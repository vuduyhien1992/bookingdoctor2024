package vn.aptech.backendapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.aptech.backendapi.entities.Medical;


@Repository
public interface MedicalRepository extends JpaRepository<Medical, Integer> {
}
