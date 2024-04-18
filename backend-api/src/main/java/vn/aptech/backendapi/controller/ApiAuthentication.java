package vn.aptech.backendapi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import vn.aptech.backendapi.dto.Authentication;
import vn.aptech.backendapi.dto.AuthenticationWithUsernameAndKeycode;
import vn.aptech.backendapi.service.Auth.AuthenticationWithUsernameAndKeycodeService;


//Khoa edit 18/04/2024
@RestController
@RequestMapping(value = "/api/auth/login")
public class ApiAuthentication {
    @Autowired
    private AuthenticationWithUsernameAndKeycodeService service;


    // Login
    @PostMapping
    public ResponseEntity<Authentication> login(@RequestBody AuthenticationWithUsernameAndKeycode body){
        var session = service.processLogin(body);
        return ResponseEntity.ok(session);
    }


//    @PostMapping("/submit")
//    public ResponseEntity<Authentication> checkLogin(@RequestBody AuthenticationWithUsernameAndKeycode body){
//
//    }
}
