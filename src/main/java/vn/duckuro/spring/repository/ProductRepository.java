package vn.duckuro.spring.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.duckuro.spring.domain.Product;
import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    ArrayList<Product> findByName(String res);

    Product findById(long id);

    List<Product> findByFactory(String factory);
}
