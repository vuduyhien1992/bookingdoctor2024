package vn.aptech.backendapi.service.User;


import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.aptech.backendapi.dto.UserInformation;
import vn.aptech.backendapi.entities.User;
import vn.aptech.backendapi.repository.UserRepository;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ModelMapper mapper;

    private UserInformation toDto(User p) {
        return mapper.map(p, UserInformation.class);
    }
    public Optional<User> findByEmailOrPhone(String username){
        return userRepository.findByEmailOrPhone(username, username);
    }

    public User save(User user) {
        return userRepository.save(user);
    }

    public List<UserInformation> findAll(){
        return userRepository.findAll().stream().map(this::toDto).toList();
    }


}
