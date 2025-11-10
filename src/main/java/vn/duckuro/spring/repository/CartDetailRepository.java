package vn.duckuro.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.duckuro.spring.domain.Cart;
import vn.duckuro.spring.domain.CartItem;
import vn.duckuro.spring.domain.Product;

public interface CartDetailRepository extends JpaRepository<CartItem, Long> {
    boolean existsByCartAndProduct(Cart cart, Product product);

    CartItem findByCartAndProduct(Cart cart, Product product);

    List<CartItem> findByCart(Cart cart);
}
