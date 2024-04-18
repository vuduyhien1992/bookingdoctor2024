package vn.aptech.backendapi.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import vn.aptech.backendapi.entities.User;

import java.util.List;


@Getter
@Setter
@AllArgsConstructor
public class UserInformation {
    private final int id;
    private final String email;
    private final String phone;
    private final String fullName;
    private final List<String> roles;

    public UserInformation(User user){
        id = user.getId();
        email = user.getEmail();
        phone = user.getPhone();
        fullName = user.getFullName();
        roles = user.getAuthorities();
    }
}
