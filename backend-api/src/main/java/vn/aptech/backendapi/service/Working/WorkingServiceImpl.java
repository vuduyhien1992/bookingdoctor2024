package vn.aptech.backendapi.service.Working;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.aptech.backendapi.dto.WorkingDto;
import vn.aptech.backendapi.entities.Working;
import vn.aptech.backendapi.repository.WorkingRepository;

@Service
public class WorkingServiceImpl implements WorkingService {

    @Autowired
    private WorkingRepository workingRepository;

    @Autowired
    private ModelMapper mapper;

    private WorkingDto toDto(Working s) {
        return mapper.map(s, WorkingDto.class);
    }

    @Override
    public List<WorkingDto> findAll() {
        List<Working> slots = workingRepository.findAll();
        return slots.stream().map(this::toDto)
                .collect(Collectors.toList());
    }

    @Override
    public Optional<WorkingDto> findById(int id) {
        Optional<Working> result = workingRepository.findById(id);
        return result.map(this::toDto);
    }

    @Override
    public WorkingDto save(WorkingDto dto) {
        Working s = mapper.map(dto, Working.class);
        Working result = workingRepository.save(s);
        return toDto(result);
    }

    @Override
    public boolean deleteById(int id) {
        try {
            workingRepository.deleteById(id);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
