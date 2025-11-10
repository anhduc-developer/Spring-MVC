package vn.duckuro.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.duckuro.spring.domain.Cart;
import vn.duckuro.spring.domain.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
}
