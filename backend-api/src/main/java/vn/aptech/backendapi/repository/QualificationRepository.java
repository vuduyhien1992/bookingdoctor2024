package vn.aptech.backendapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.aptech.backendapi.entities.Qualification;


@Repository
public interface QualificationRepository extends JpaRepository<Qualification, Integer> {
}
