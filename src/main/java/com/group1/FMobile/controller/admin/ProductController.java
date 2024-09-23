package com.group1.fmobile.controller.admin;

import com.group1.fmobile.domain.dto.Brand;
import com.group1.fmobile.domain.dto.Category;
import com.group1.fmobile.domain.dto.Image;
import com.group1.fmobile.domain.dto.Product;
import com.group1.fmobile.service.BrandService;
import com.group1.fmobile.service.CategoryService;
import com.group1.fmobile.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin/product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @Autowired
    private BrandService brandService;

    @Autowired
    private CategoryService categoryService;
    // Hiển thị danh sách san pham và form thêm mới
    @RequestMapping("")
    public String listProduct(Model model) {
        List<Product> list = productService.getAll();
        List<Brand> brands = brandService.getAll();
        List<Category> categories = categoryService.getAll();
        model.addAttribute("isEdit", false);  // Đặt biến cho trường hợp thêm mới
        model.addAttribute("products", list);
        model.addAttribute("brands", brands);  // Truyền danh sách thương hiệu
        model.addAttribute("categories", categories);  // Truyền danh sách danh mục
        model.addAttribute("product", new Product());  // Tạo đối tượng trống cho thêm mới
        return "admin/product/product";  // Luôn hiển thị form thêm mới mặc định
    }
    // Xử lý thêm mới hoặc cập nhật san pham
    @PostMapping("/saveOrUpdate")
    public String saveOrUpdateProduct(@ModelAttribute("product") Product product, RedirectAttributes redirectAttributes) {
        productService.saveOrUpdate(product);  // Lưu san pham (thêm mới hoặc cập nhật)
        redirectAttributes.addFlashAttribute("successMessage", "San pham đã được lưu thành công!");
        return "redirect:/admin/product";  // Quay lại trang quản lý sau khi lưu
    }
    // Chỉnh sửa thương hiệu (lấy thông tin để đưa lên form)
    @GetMapping("/edit/{id}")
    public String editProduct(@PathVariable("id") Long id, Model model) {
        Product product = productService.getById(id);
        model.addAttribute("isEdit", true);  // Đặt biến để phân biệt cập nhật
        model.addAttribute("product", product);  // Đối tượng san pham được điền vào form để cập nhật
        List<Product> list = productService.getAll();
        List<Brand> brands = brandService.getAll();
        List<Category> categories = categoryService.getAll();
        model.addAttribute("brands", brands);  // Truyền danh sách thương hiệu
        model.addAttribute("categories", categories);  // Truyền danh sách danh mục
        return "admin/product/product";  // Hiển thị form với thông tin cập nhật
    }
    // Xóa san pham
    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        productService.delete(id);
        redirectAttributes.addFlashAttribute("successMessage", "Sản phẩm đã được xóa thành công!");
        return "redirect:/admin/product";  // Quay lại trang quản lý sau khi xóa
    }
}
