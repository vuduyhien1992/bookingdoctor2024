package vn.aptech.backendapi.service.Doctor;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.aptech.backendapi.dto.DoctorDto;
import vn.aptech.backendapi.dto.UserInformation;
import vn.aptech.backendapi.entities.Doctor;
import vn.aptech.backendapi.entities.User;
import vn.aptech.backendapi.repository.DoctorRepository;

import java.util.List;


@Service
public class DoctorServiceImpl implements DoctorService{

    @Autowired
    private DoctorRepository doctorRepository;

    @Autowired
    private ModelMapper mapper;
    private DoctorDto toDto(Doctor p) {
        return mapper.map(p, DoctorDto.class);
    }

    public List<DoctorDto> findAll(){
        return doctorRepository.findAll().stream().map(this::toDto).toList();
    }

}
