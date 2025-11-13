package vn.duckuro.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.duckuro.spring.domain.User;
import java.util.*;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User duckuro);

    void deleteById(long id);

    User findById(long id);

    ArrayList<User> findOneByEmail(String email);

    boolean existsByEmail(String email);

    boolean existsByPhone(String phone);

    User findByEmail(String email);
}
