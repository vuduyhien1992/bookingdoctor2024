package vn.aptech.backendapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.aptech.backendapi.entities.RefreshToken;


@Repository
public interface RefeshTokenRepository extends JpaRepository<RefreshToken, Integer> {
}
