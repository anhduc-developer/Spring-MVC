package vn.duckuro.spring.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.duckuro.spring.domain.Order;
import vn.duckuro.spring.domain.Product;
import vn.duckuro.spring.domain.User;
import vn.duckuro.spring.service.OrderService;
import vn.duckuro.spring.service.ProductService;
import vn.duckuro.spring.service.UserService;

@Controller
public class DashboardController {
    private final UserService userService;
    private final ProductService productService;
    private final OrderService orderService;

    public DashboardController(UserService userService, ProductService productService, OrderService orderService) {
        this.userService = userService;
        this.productService = productService;
        this.orderService = orderService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        List<User> users = this.userService.getAllUsers();
        List<Product> products = this.productService.getAllProducts();
        List<Order> orders = this.orderService.getAllOrders();
        model.addAttribute("countUsers", this.userService.countUsers());
        model.addAttribute("countProducts", this.productService.countProducts());
        model.addAttribute("countOrders", this.orderService.countOrders());
        return "admin/dashboard/show";
    }
}
