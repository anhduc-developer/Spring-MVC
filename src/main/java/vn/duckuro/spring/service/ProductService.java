package vn.duckuro.spring.service;

import java.util.*;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.duckuro.spring.domain.Cart;
import vn.duckuro.spring.domain.CartItem;
import vn.duckuro.spring.domain.Product;
import vn.duckuro.spring.domain.User;
import vn.duckuro.spring.repository.CartDetailRepository;
import vn.duckuro.spring.repository.CartRepository;
import vn.duckuro.spring.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService) {
        this.productRepository = productRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.cartRepository = cartRepository;
        this.userService = userService;
    }

    public Product createProduct(Product result) {
        return this.productRepository.save(result);
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    public void handleSaveProduct(Product product) {
        this.productRepository.save(product);
    }

    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void handleDelteProduct(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productID, HttpSession session) {
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(1);
                cart = this.cartRepository.save(newCart);
                user.setCart(newCart);
            }
            Product product = this.productRepository.findById(productID);
            CartItem oldCartItem = this.cartDetailRepository.findByCartAndProduct(cart, product);
            if (oldCartItem == null) {
                CartItem cartItem = new CartItem();
                cartItem.setCart(cart);
                cartItem.setProduct(product);
                cartItem.setPrice(product.getPrice());
                cartItem.setQuantity(1);
                this.cartDetailRepository.save(cartItem);
                int s = cart.getSum() + 1;
                cart.setSum(s);
                this.cartRepository.save(cart);
                session.setAttribute("sum", s);
            } else {
                oldCartItem.setQuantity(oldCartItem.getQuantity() + 1);
                this.cartDetailRepository.save(oldCartItem);
            }
        }
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartItem(long cartItemId, HttpSession session) {
        Optional<CartItem> cartItemOptional = cartDetailRepository.findById(cartItemId);
        if (cartItemOptional.isPresent()) {
            CartItem cartItem = cartItemOptional.get();
            Cart currentCart = cartItem.getCart();
            this.cartDetailRepository.deleteById(cartItemId);
            if (currentCart.getSum() > 1) {
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            } else {
                this.cartDetailRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);
            }
        }

    }
}
