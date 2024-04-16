package vn.aptech.backendapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.aptech.backendapi.entities.Schedule;


@Repository
public interface ScheduleRepository extends JpaRepository<Schedule, Integer> {
}
