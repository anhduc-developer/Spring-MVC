package vn.duckuro.spring.service;

import org.springframework.stereotype.Service;
import java.util.*;

import vn.duckuro.spring.domain.Role;
import vn.duckuro.spring.domain.User;
import vn.duckuro.spring.domain.DTO.RegisterDTO;
import vn.duckuro.spring.repository.ProductRepository;
import vn.duckuro.spring.repository.RoleRepository;
import vn.duckuro.spring.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final ProductRepository productRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository,
            ProductRepository productRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.productRepository = productRepository;
    }

    public String handleHello() {
        return "Hello from Service";
    }

    // dependency injection
    public ArrayList<User> getAllUsers() {
        return (ArrayList<User>) this.userRepository.findAll();
    }

    public ArrayList<User> getAllUsersByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public User handleSaveUser(User user) {
        User res = this.userRepository.save(user);
        return res;
    }

    public void handleDeleteUser(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findFirstByName(name);
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        user.setPhone(registerDTO.getPhone());
        return user;
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public boolean checkPhoneExist(String phone) {
        return this.userRepository.existsByPhone(phone);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public long countUsers() {
        List<User> users = this.userRepository.findAll();
        return users.size();
    }

    public void handleUpdateUser(User user) {
        this.userRepository.save(user);
    }

    public void handleChangePassword(User user) {
        this.userRepository.save(user);
    }
}
