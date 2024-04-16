package vn.aptech.backendapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.aptech.backendapi.entities.Working;


@Repository
public interface WorkingRepository extends JpaRepository<Working, Integer> {
}
