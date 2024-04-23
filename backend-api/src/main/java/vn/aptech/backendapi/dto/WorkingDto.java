package vn.aptech.backendapi.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;


@Data
@Getter
@Setter
public class WorkingDto {
    private int id;
    private String company;
    private String address;
    private LocalDate startWork;
    private LocalDate endWork;
}
