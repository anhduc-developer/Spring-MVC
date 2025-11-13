package vn.duckuro.spring.controller.admin;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

import java.util.*;

import vn.duckuro.spring.domain.User;
import vn.duckuro.spring.service.UploadService;
import vn.duckuro.spring.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;
    private PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    // @RequestMapping("/")
    // public String getHomePage(Model model) {
    // List<User> arr = this.userService.getAllUsers();
    // System.out.println(arr);
    // model.addAttribute("duckuro", "test");
    // model.addAttribute("duc", "Hello from Spring Boot!");
    // model.addAttribute("print", "Xin chao ban");
    // model.addAttribute("duck", "PTIT");
    // return "hello";
    // }

    // MVC => , View <-> Controller ---Service ---Repository--- Model(entity)

    @GetMapping(value = "admin/user/create")
    public String getCreateUser(Model model) {
        model.addAttribute("newUser", new User()); // null User
        return "admin/user/create";
    }

    @PostMapping(value = "admin/user/create")
    public String createUserPage(Model model, @ModelAttribute("newUser") @Valid User res,
            BindingResult newUserbindingResult,
            @RequestParam("duckuroFile") MultipartFile file) {
        List<FieldError> errors = newUserbindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        if (newUserbindingResult.hasErrors()) {
            return "admin/user/create"; // không return redirect vì refresh lại => mất dữ liệu
        }
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(res.getPassword());
        res.setAvatar(avatar);
        res.setPassword(hashPassword);
        res.setRole(this.userService.getRoleByName(res.getRole().getName()));
        this.userService.handleSaveUser(res);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user")
    public String displayUsers(Model model, User user) {
        ArrayList<User> arr = this.userService.getAllUsers();
        model.addAttribute("users", arr);
        return "admin/user/show";
    }

    // khong co post
    @GetMapping("/admin/user/update/{id}")
    public String updateUser(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update"; // front
    }

    @PostMapping("/admin/user/update/29")
    public String getUpdateUser(Model model, @ModelAttribute("newUser") User user) {
        User currentUser = this.userService.getUserById(user.getId());
        if (currentUser != null) {
            currentUser.setAddress(user.getAddress());
            currentUser.setFullName(user.getFullName());
            currentUser.setPhone(user.getPhone());
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/{id}")
    public String getDetailUser(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("id", id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUser(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        User user = new User();
        user.setId(id);
        model.addAttribute("newUser", user);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String getDeleteUser(Model model, @ModelAttribute("newUser") User user) {
        List<User> users = this.userService.getAllUsers();
        int cnt = 0;
        for (User x : users) {
            if (x.getRole().equals("ADMIN")) {
                ++cnt;
            }
        }
        if (cnt <= 1) {

            model.addAttribute("errorMessage", "Không thể Xóa ADMIN duy nhất");
            return "client/auth/deny";
        }
        this.userService.handleDeleteUser(user.getId());
        return "redirect:/admin/user";
    }
}
