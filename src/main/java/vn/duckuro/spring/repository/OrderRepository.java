package vn.duckuro.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.duckuro.spring.domain.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

}
