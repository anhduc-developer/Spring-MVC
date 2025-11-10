package vn.duckuro.spring.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.duckuro.spring.domain.Product;
import vn.duckuro.spring.service.ProductService;
import vn.duckuro.spring.service.UploadService;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping({ "/admin/product", "/admin/product/" })
    public String getProduct(Model model) {
        List<Product> arr = this.productService.getAllProducts();
        model.addAttribute("products", arr);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("admin/product/create")
    public String postCreateProduct(@ModelAttribute("newProduct") @Valid Product product,
            BindingResult newProductbindingResult, @RequestParam("duckuroFile") MultipartFile file) {
        List<FieldError> errors = newProductbindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + "-" + error.getDefaultMessage());
        }
        if (newProductbindingResult.hasErrors()) {
            return "admin/product/create";
        }
        if (!file.isEmpty()) {
            String image = this.uploadService.handleSaveUploadFile(file, "product");
            product.setPhoto(image);
        }
        this.productService.createProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{id}")
    public String updateUser(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.getProductById(id);
        model.addAttribute("newProduct", currentProduct);
        return "admin/product/update";
    }

    @PostMapping("admin/product/update")
    public String postUpdateProduct(@ModelAttribute("newProduct") @Valid Product product,
            BindingResult newProductBindingResult, @RequestParam("duckuroFile") MultipartFile file) {
        Product currentProduct = this.productService.getProductById(product.getId());
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/update";
        }
        if (currentProduct != null) {
            currentProduct.setName(product.getName());
            currentProduct.setPrice(product.getPrice());
            currentProduct.setQuantity(product.getQuantity());
            currentProduct.setShortDesc(product.getShortDesc());
            currentProduct.setDetailDesc(product.getDetailDesc());
            currentProduct.setSold(product.getSold());
            if (!file.isEmpty()) {
                System.out.println("Lỗi ở đây");
                String photo = this.uploadService.handleSaveUploadFile(file, "product");
                currentProduct.setPhoto(photo);
            }
            this.productService.handleSaveProduct(currentProduct);
        }
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProduct(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        Product product = new Product();
        product.setId(id);
        model.addAttribute("newProduct", product);
        return "admin/product/delete";
    }

    @PostMapping("admin/product/delete")
    public String getDeleteUser(Model model, @ModelAttribute("newProduct") Product product) {
        this.productService.handleDelteProduct(product.getId());
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/detail/{id}")
    public String getDetailProduct(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("id", id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }
}