package vn.aptech.backendapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.aptech.backendapi.entities.Slot;


@Repository
public interface SlotRepository extends JpaRepository<Slot, Integer> {
}
