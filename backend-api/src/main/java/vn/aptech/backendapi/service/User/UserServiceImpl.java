package vn.aptech.backendapi.service.User;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.internet.MimeMessage;
import vn.aptech.backendapi.dto.UserDto;
import vn.aptech.backendapi.dto.UserDtoCreate;
import vn.aptech.backendapi.entities.Doctor;
import vn.aptech.backendapi.entities.Partient;
import vn.aptech.backendapi.entities.Role;
import vn.aptech.backendapi.entities.User;
import vn.aptech.backendapi.repository.DoctorRepository;
import vn.aptech.backendapi.repository.PartientRepository;
import vn.aptech.backendapi.repository.RoleRepository;
import vn.aptech.backendapi.repository.UserRepository;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PartientRepository partientRepository;

    @Autowired
    private DoctorRepository doctorRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private ModelMapper mapper;

    // writed by An in 5/31
    @Autowired
    private JavaMailSender javaMailSender;

    // edited by An in 5/6
    private UserDto toDto(User user) {
        UserDto userDto = new UserDto();
        userDto.setId(user.getId());
        userDto.setEmail(user.getEmail());
        userDto.setPhone(user.getPhone());
        userDto.setStatus(user.isStatus());
        userDto.setFullName(user.getFullName());
        userDto.setProvider(user.getProvider());
        userDto.setRoles(user.getAuthorities());
        return userDto;
    }

    public Optional<User> findByEmailOrPhone(String username) {
        return userRepository.findByEmailOrPhone(username, username);
    }

    // public Optional<UserDto> findByPhone(String phone){
    // Optional<User> result = userRepository.findByPhone(phone);
    // return result.map(this::toDto);
    // }

    public User save(User user) {
        return userRepository.save(user);
    }

    public Optional<UserDto> findById(int id) {
        Optional<User> result = userRepository.findById(id);
        return result.map(this::toDto);
    }

    public List<UserDto> findAll() {
        List<User> users = userRepository.findAll();
        return users.stream().map(this::toDto)
                .collect(Collectors.toList());
    }

    public UserDtoCreate registerNewUser(UserDtoCreate userDtoCreate) {
        User user = mapper.map(userDtoCreate, User.class);
        Optional<Role> roleOptional = roleRepository.findById(userDtoCreate.getRoleId());
        roleOptional.ifPresent(role -> user.setRoles(Collections.singletonList(role)));
        User savedUser = userRepository.save(user);

        if (savedUser != null) {
            try {

                String Message = "Dear Customer , you have just successfully created an account, please go to http://localhost:5173/login to activate the account . Thank You.";

                MimeMessage mimeMessage = javaMailSender.createMimeMessage();
                MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage);
                mimeMessageHelper.setTo(userDtoCreate.getEmail());
                mimeMessageHelper.setSubject("Register Successfully");
                mimeMessageHelper.setText(Message);
                javaMailSender.send(mimeMessage);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        return mapper.map(savedUser, UserDtoCreate.class);
    }

    // writed by An in 5/19
    public Optional<UserDto> updateUser(UserDto dto) {
        return userRepository.findById(dto.getId()).map(user -> {
            user.setFullName(dto.getFullName());
            user.setEmail(dto.getEmail());
            user.setPhone(dto.getPhone());
            userRepository.save(user);
            return toDto(user);
        });
    }

    @Override
    public boolean changeStatus(int id, boolean status) {
        User u = userRepository.findById(id).get();
        boolean newStatus = status ? false : true;
        Doctor d = doctorRepository.findDoctorByUserId(id);
        Partient p = partientRepository.getPatientByUserId(id);
        if (d != null) {
            d.setStatus(newStatus);
            doctorRepository.save(d);
        }
        if (p != null) {
            p.setStatus(newStatus);
            partientRepository.save(p);
        }
        u.setStatus(newStatus);
        try {
            userRepository.save(u);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
