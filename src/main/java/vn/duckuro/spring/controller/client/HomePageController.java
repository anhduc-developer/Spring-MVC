package vn.duckuro.spring.controller.client;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.antlr.v4.runtime.tree.Trees;
import org.springframework.security.crypto.password.PasswordEncoder;

import vn.duckuro.spring.domain.Order;
import vn.duckuro.spring.domain.OrderDetail;
import vn.duckuro.spring.domain.Product;
import vn.duckuro.spring.domain.User;
import vn.duckuro.spring.service.OrderService;
import vn.duckuro.spring.domain.DTO.RegisterDTO;
import vn.duckuro.spring.service.ProductService;
import vn.duckuro.spring.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import vn.duckuro.spring.service.UploadService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class HomePageController {

    private final OrderService orderService;
    private final ProductService productService;
    private final UserService userService;
    private final UploadService uploadService;
    private PasswordEncoder passwordEncoder;

    public HomePageController(ProductService productService, UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder, OrderService orderService) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.uploadService = uploadService;
        this.orderService = orderService;
    }

    @GetMapping("/")
    public String getHomePage(Model model, HttpServletRequest request) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        HttpSession session = request.getSession(false);
        return "client/homepage/show";
    }

    @GetMapping("/login")
    public String getLoginUser() {
        return "client/auth/login";
    }

    @GetMapping("/register")
    public String getRegesterUser(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping(value = "/register")
    public String createUserPage(@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }
        User user = this.userService.registerDTOtoUser(registerDTO);
        System.out.println(user);
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }

    @GetMapping("/access-deny")
    public String getDenyPage(Model model) {
        return "client/auth/deny";
    }

    @GetMapping("/history")
    public String getHistoryOrder(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        List<Order> orders = this.orderService.getAllOrders(id);
        model.addAttribute("orders", orders);
        return "client/cart/history";
    }

    @GetMapping("/products")
    public String getClientProducts(Model model) {
        List<String> factorys = new ArrayList<>();

        List<Product> arr = this.productService.getAllProducts();
        factorys.add("Tất Cả");
        for (Product x : arr) {
            if (!factorys.contains(x.getFactory())) {
                factorys.add(x.getFactory());
            }
        }

        model.addAttribute("factorys", factorys);
        model.addAttribute("products", this.productService.getAllProducts());
        return "client/homepage/product";
    }

    @GetMapping("/products/{factory}")
    public String getFilterProducts(@PathVariable(required = false) String factory, Model model) {
        if (factory.equals("Tất Cả")) {
            model.addAttribute("products", this.productService.getAllProducts());
        } else {
            model.addAttribute("products", this.productService.findByFactory(factory));
        }
        return "client/homepage/product";
    }
}
