package vn.aptech.backendapi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import vn.aptech.backendapi.dto.DoctorDto;
import vn.aptech.backendapi.dto.UserInformation;
import vn.aptech.backendapi.service.Doctor.DoctorService;

import java.util.List;

@RestController
@RequestMapping(value = "/api/doctor")
@PreAuthorize("hasAnyAuthority('DOCTOR')")
public class DoctorController {

    @Autowired
    private DoctorService doctorService;

    @GetMapping()
    //@PreAuthorize("hasAnyAuthority('USER', 'DOCTOR')")
    public ResponseEntity<List<DoctorDto>> findAll() {
        List<DoctorDto> result = doctorService.findAll();
        return ResponseEntity.ok(result);
    }

}
