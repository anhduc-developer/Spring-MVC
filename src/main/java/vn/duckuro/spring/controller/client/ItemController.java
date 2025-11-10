package vn.duckuro.spring.controller.client;

import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.duckuro.spring.domain.Cart;
import vn.duckuro.spring.domain.CartItem;
import vn.duckuro.spring.domain.Product;
import vn.duckuro.spring.domain.User;
import vn.duckuro.spring.repository.CartRepository;
import vn.duckuro.spring.repository.UserRepository;
import vn.duckuro.spring.service.ProductService;
import vn.duckuro.spring.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ItemController {

    private final CartRepository cartRepository;
    private final ProductService productService;
    private final UserRepository userRepository;

    public ItemController(ProductService productService, UserRepository userRepository, CartRepository cartRepository) {
        this.productService = productService;
        this.userRepository = userRepository;
        this.cartRepository = cartRepository;
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
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }
        Long id = (Long) session.getAttribute("id");
        User currentUser = new User();
        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);
        List<CartItem> cartItems = cart == null ? new ArrayList<>() : cart.getCartItems();

        double totalPrice = 0;
        for (CartItem x : cartItems) {
            totalPrice += x.getPrice() * x.getQuantity();
        }
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);
        return "client/cart/cart";
    }

    @PostMapping("/cart/update/{id}")
    public String updateCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String res = request.getParameter("quantity");
        int quantity = Integer.parseInt(res);
        this.productService.handleUpdateCart(id, quantity, session);
        return "redirect:/cart";
    }

    @PostMapping("/cart/remove/{id}")
    public String postDeleteCartItem(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartItemId = id;
        this.productService.handleRemoveCartItem(cartItemId, session);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String checkout(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("id");
        if (userId == null)
            return "redirect:/login";
        User currentUser = new User();
        currentUser.setId(userId);
        Cart cart = productService.fetchByUser(currentUser);
        if (cart == null) {
            cart = new Cart();
            cart.setUser(currentUser);
            cart.setSum(0);
            cart = this.productService.hanldeSaveCart(cart);
        }
        session.setAttribute("cartId", cart.getId());
        List<CartItem> cartItems = (cart != null) ? cart.getCartItems() : new ArrayList<>();
        double totalPrice = 0;
        for (CartItem item : cartItems) {
            totalPrice += item.getProduct().getPrice() * item.getQuantity();
        }
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/checkout";
    }

    @PostMapping("/checkout/confirm")
    public String confirmOrder(HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser = this.userRepository.findById(id);
        System.out.println(currentUser);
        this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone);
        return "client/cart/thanks";
    }

}
