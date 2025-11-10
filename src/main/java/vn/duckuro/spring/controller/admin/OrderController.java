package vn.duckuro.spring.controller.admin;

import vn.duckuro.spring.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {
    private final UserService userService;

    public OrderController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin/order")
    public String getDashboard() {
        return "admin/order/show";
    }
}
