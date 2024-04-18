package vn.aptech.backendapi.service.Doctor;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import vn.aptech.backendapi.dto.DoctorDto;
import vn.aptech.backendapi.dto.UserInformation;
import vn.aptech.backendapi.entities.Doctor;
import vn.aptech.backendapi.entities.User;
import vn.aptech.backendapi.repository.DoctorRepository;

import java.util.List;

public class DoctorServiceImpl implements DoctorService{
    private DoctorRepository doctorRepository;

    private ModelMapper mapper;
    private DoctorDto toDto(Doctor p) {
        return mapper.map(p, DoctorDto.class);
    }

    public List<DoctorDto> findAll(){
        return doctorRepository.findAll().stream().map(this::toDto).toList();
    }


}
