package vn.duckuro.spring.domain;

import java.util.List;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import vn.duckuro.spring.service.validator.StrongPassword;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity // bien 1 class thong thuong thanh 1 entity
@Table(name = "users") // table nay viet bao nhieu thi no cung chi tuong ung voi mot cai ma thoi
public class User {
    public static final Object getConfirmPasssword = null;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotNull
    @Email
    @Email(message = "Email không hợp lệ", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;
    @NotNull
    @Size(min = 2, message = "Password phải có tối thiểu 2 ký tự")
    @StrongPassword()
    private String password;
    @NotNull
    @Size(min = 3, message = "Họ và tên phải có tối thiểu 3 ký tự")
    private String fullName;
    private String address;
    private String phone;
    private String avatar;
    // User many -> to one -> role
    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;
    @OneToMany(mappedBy = "user")
    List<Order> orders;

    @OneToOne(mappedBy = "user")
    private Cart cart;

    public Role getRole() {
        return role;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public long getId() {
        return this.id;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getFullName() {
        return fullName;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    public String getAvatar() {
        return this.avatar;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public Cart getCart() {
        return this.cart;
    }

    @Override
    public String toString() {
        return this.id + " " + this.email + " " + this.password + " " + this.fullName + " " + this.phone + " "
                + this.address + " " + this.avatar;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }
}
