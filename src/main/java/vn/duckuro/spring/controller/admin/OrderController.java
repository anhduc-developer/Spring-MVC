package vn.duckuro.spring.controller.admin;

import vn.duckuro.spring.domain.Order;
import vn.duckuro.spring.domain.OrderDetail;
import vn.duckuro.spring.service.OrderService;
import vn.duckuro.spring.service.ProductService;
import vn.duckuro.spring.service.UserService;

import java.util.List;

import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class OrderController {
    private final UserService userService;
    private final OrderService orderService;

    public OrderController(UserService userService, OrderService orderService) {
        this.userService = userService;
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getDashboard(Model model) {
        List<Order> orders = this.orderService.fetchAllOrders();
        model.addAttribute("orders", orders);
        return "admin/order/show";
    }

    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrder(Model model, @PathVariable long id) {
        Order currentOrder = this.orderService.getOrderById(id);
        model.addAttribute("newOrder", currentOrder);
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String postUpdateOrder(@ModelAttribute("newOrder") Order order) {
        this.orderService.handleUpdateOrder(order);
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String getDeleteOrder(Model model, @PathVariable long id) {
        Order order = this.orderService.getOrderById(id);
        model.addAttribute("order", order);
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String postDeleteOrder(@ModelAttribute("order") Order order) {
        this.orderService.handleDeleteOrder(order.getId());
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/detail/{id}")
    public String getDetailOrder(Model model, @PathVariable long id) {
        Order order = this.orderService.getOrderById(id);
        List<OrderDetail> arr = this.orderService.handleDetailOrder(id);
        model.addAttribute("items", arr);
        return "admin/order/detail";
    }
    // =>: front-end
    // =>: session:tai sao em khong update o session minh vua vao => du lieu quan
    // trong khong tuan thuong
    // =>: vi du nhu: gio hang , khong can phai luu vao database => vi du thua du
    // lieu, (session)
}
