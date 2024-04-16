package vn.aptech.backendapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.aptech.backendapi.entities.Feedback;


@Repository
public interface FeedbackRepository extends JpaRepository<Feedback, Integer> {
}
