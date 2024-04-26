package vn.aptech.backendapi.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class WorkingCreateDto {
    private int id;
    private String company;
    private String address;
    private String startWork;
    private String endWork;
}
