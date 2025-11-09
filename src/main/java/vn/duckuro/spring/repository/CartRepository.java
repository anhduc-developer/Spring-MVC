package vn.duckuro.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.duckuro.spring.domain.Cart;
import vn.duckuro.spring.domain.User;

public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);

}
