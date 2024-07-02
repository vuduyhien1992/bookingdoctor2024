package vn.aptech.backendapi.dto.Schedule;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Getter
@Setter
public class DepartmentWithSlotsDTO {
    private int id;
    private String name;
    private String icon;
    private List<SlotWithDoctorsDTO> slots;
}
