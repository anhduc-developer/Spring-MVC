package vn.duckuro.spring.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vn.duckuro.spring.service.CartService;

@Controller
public class CartController {
    private final CartService cartService;

    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    @GetMapping("/cart")
    public String getCartPage(Model model) {
        model.addAttribute("cart", cartService.getCart());
        return "client/cart/cart";
    }

    @PostMapping("cart/add")
    public String addToCart(@RequestParam("productId") Long productId) {
        cartService.addProduct(productId);
        return "redirect:/cart";
    }

    @PostMapping("cart/update")
    public String updateCart(@RequestParam("productId") Long productId,
            @RequestParam("quantity") int quantity) {
        cartService.updateProduct(productId, quantity);
        return "redirect:/cart";
    }

    @PostMapping("cart/remove")
    public String removeFromCart(@RequestParam("productId") Long productId) {
        cartService.removeProduct(productId);
        return "redirect:/cart";
    }
}
