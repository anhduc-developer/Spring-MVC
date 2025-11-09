package vn.duckuro.spring.controller.client;

import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.duckuro.spring.domain.Cart;
import vn.duckuro.spring.domain.CartItem;
import vn.duckuro.spring.domain.Product;
import vn.duckuro.spring.domain.User;
import vn.duckuro.spring.service.ProductService;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ItemController {
    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "client/product/detail";
    }

    @PostMapping("/cart/add/{id}")
    public String postAddProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long productId = id;
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, productId, session);
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);
        Cart cart = this.productService.fetchByUser(currentUser);
        List<CartItem> cartItems = cart == null ? new ArrayList<CartItem>() : cart.getCartItems();
        double totalPrice = 0;
        for (CartItem x : cartItems) {
            totalPrice += x.getPrice() * x.getQuantity();
        }
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("totalPrice", totalPrice);
        return "client/cart/cart";
    }

    @PostMapping("/cart/remove/{id}")
    public String postDeleteCartItem(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartItemId = id;
        this.productService.handleRemoveCartItem(cartItemId, session);
        return "redirect:/cart";
    }

}
