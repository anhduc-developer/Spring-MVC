package vn.duckuro.spring.service;

import java.lang.StackWalker.Option;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import vn.duckuro.spring.controller.admin.OrderController;
import vn.duckuro.spring.domain.Order;
import vn.duckuro.spring.domain.OrderDetail;
import vn.duckuro.spring.domain.Product;
import vn.duckuro.spring.domain.User;
import vn.duckuro.spring.repository.OrderDetailRepository;
import vn.duckuro.spring.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public List<Order> fetchAllOrders() {
        return this.orderRepository.findAll();
    }

    public Optional<Order> fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public Order getOrderById(long id) {
        return this.orderRepository.getById(id);
    }

    public void handleUpdateOrder(Order order) {
        Optional<Order> orderOptional = this.fetchOrderById(order.getId());
        if (orderOptional.isPresent()) {
            Order currentOrder = orderOptional.get();
            currentOrder.setStatus(order.getStatus());
            this.orderRepository.save(currentOrder);
        }
    }

    public void handleDeleteOrder(long id) {
        Optional<Order> orderOptional = this.orderRepository.findById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            List<OrderDetail> arr = this.orderDetailRepository.findByOrderId(id);
            for (OrderDetail x : arr) {
                this.orderDetailRepository.delete(x);
            }
            this.orderRepository.delete(order);
        }
    }

    public List<OrderDetail> handleDetailOrder(long id) {
        List<OrderDetail> arr = this.orderDetailRepository.findByOrderId(id);
        return arr;
    }

    public List<Order> getAllOrders() {
        return this.orderRepository.findAll();
    }

    public long countOrders() {
        List<Order> orders = this.orderRepository.findAll();
        return orders.size();
    }

    public List<Order> getAllOrders(long id) {
        return this.orderRepository.findByUserId(id);
    }

}
