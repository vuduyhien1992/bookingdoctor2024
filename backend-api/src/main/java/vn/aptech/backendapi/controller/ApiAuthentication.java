package vn.aptech.backendapi.controller;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import vn.aptech.backendapi.dto.Authentication;
import vn.aptech.backendapi.dto.AuthenticationWithUsernameAndKeycode;
import vn.aptech.backendapi.entities.RefreshToken;
import vn.aptech.backendapi.entities.User;
import vn.aptech.backendapi.repository.RefreshTokenRepository;
import vn.aptech.backendapi.service.Auth.AuthenticationWithUsernameAndKeycodeService;
import vn.aptech.backendapi.service.User.UserService;

import java.time.LocalDateTime;
import java.util.Optional;


//Khoa edit 18/04/2024
@RestController
@RequestMapping(value = "/api/auth")
public class ApiAuthentication {
    @Autowired
    private AuthenticationWithUsernameAndKeycodeService service;

    @Autowired
    private UserService userService;

    @Autowired
    private RefreshTokenRepository refreshTokenRepository;

    // Login
    @PostMapping("/login")
    public ResponseEntity<Authentication> login(@RequestBody AuthenticationWithUsernameAndKeycode body){
        var session = service.processLogin(body);
        return ResponseEntity.ok(session);
    }


    @PostMapping("/send-otp")
    public ResponseEntity<String> sendOtp(@RequestBody AuthenticationWithUsernameAndKeycode body) {
        String username = body.getUsername();
        String provider = body.getProvider();
        Optional<User> userOptional = userService.findByEmailOrPhone(username);
        if(userOptional.isPresent() && userOptional.get().getProvider().equals(provider)){
            Optional<RefreshToken> refreshTokenOptional = refreshTokenRepository.findRefreshTokenByUsername(username);

            if (refreshTokenOptional.isPresent()) {
                RefreshToken refreshToken = refreshTokenOptional.get();
                LocalDateTime expiredAt = refreshToken.getExpiredAt();
                LocalDateTime now = LocalDateTime.now();

                // Kiểm tra tính hợp lệ của token
                if (now.isBefore(expiredAt)) {
                    return ResponseEntity.ok("Token is still valid"); // Token chưa hết hạn, không thực hiện gửi OTP
                } else {
                    return ResponseEntity.ok("Token is expired, login successful"); // Token đã hết hạn, thực hiện đăng nhập
                }
            } else {
                // Nếu không tìm thấy RefreshToken, tạo mã OTP và cập nhật vào User
                String otp = RandomStringUtils.randomNumeric(6);
                //Optional<User> userOptional= userService.findByEmailOrPhone(username);

                if (userOptional.isPresent()) {
                    User user = userOptional.get();
                    user.setKeyCode(otp);
                    userService.save(user);
                    return ResponseEntity.ok("Keycode updated successfully: " + otp); // Gửi mã OTP thành công
                } else {
                    return ResponseEntity.status(HttpStatus.NOT_FOUND)
                            .body("User not found with identifier: " + username); // Không tìm thấy người dùng
                }
            }
        }else{
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("You chose the wrong login method, please choose another method!");
        }

    }
}

