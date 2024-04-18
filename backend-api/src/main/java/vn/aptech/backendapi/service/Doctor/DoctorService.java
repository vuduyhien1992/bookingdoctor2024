package vn.aptech.backendapi.service.Doctor;

import vn.aptech.backendapi.dto.DoctorDto;

import java.util.List;

public interface DoctorService {
    List<DoctorDto> findAll();
}
