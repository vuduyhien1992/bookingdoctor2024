package vn.aptech.backendapi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import vn.aptech.backendapi.dto.UserInformation;
import vn.aptech.backendapi.service.User.UserService;

import java.util.List;

@RestController
@RequestMapping(value = "api/v1/users")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping
    public ResponseEntity<List<UserInformation>> findAll() {
        List<UserInformation> result = userService.findAll();
        return ResponseEntity.ok(result);
    }

}
