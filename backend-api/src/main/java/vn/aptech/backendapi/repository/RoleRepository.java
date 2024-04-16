package vn.aptech.backendapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.aptech.backendapi.entities.Role;


@Repository
public interface RoleRepository extends JpaRepository<Role, Integer> {
}
