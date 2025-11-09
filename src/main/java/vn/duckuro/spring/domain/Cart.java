package vn.duckuro.spring.domain;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.validation.constraints.Min;

@Entity
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Min(value = 0)
    private int sum;
    @OneToOne()
    @JoinColumn(name = "user_id")
    private User user;
    @OneToMany(mappedBy = "cart")
    private List<CartItem> items;

    public void setId(long id) {
        this.id = id;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }

    public long getId() {
        return id;
    }

    public int getSum() {
        return sum;
    }

    public User getUser() {
        return user;
    }

    public List<CartItem> getCartItems() {
        return items;
    }

}