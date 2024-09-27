package com.group1.fmobile.controller.admin;

import com.group1.fmobile.domain.ProductCategory;
import com.group1.fmobile.service.CategoryService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;
    // Hiển thị danh sách thương hiệu và form thêm mới
    @RequestMapping("/category")
    public String listCategory(Model model) {
        List<ProductCategory> list = categoryService.getAll();
        model.addAttribute("categories", list);
        model.addAttribute("isEdit", false);  // Đặt biến cho trường hợp thêm mới
        model.addAttribute("category", new ProductCategory());  // Tạo đối tượng trống cho thêm mới
        return "admin/category/category";  // Luôn hiển thị form thêm mới mặc định
    }

    // Xử lý thêm mới hoặc cập nhật thương hiệu
    @PostMapping("/category/saveOrUpdate")
    public String saveOrUpdateCategory(@ModelAttribute("category") @Valid ProductCategory category,
                                       BindingResult bindingResult) {
        if (bindingResult.hasErrors()){
            System.out.println(bindingResult);
            return "admin/category/category";
        }
        categoryService.saveOrUpdate(category);  // Lưu thương hiệu (thêm mới hoặc cập nhật)
        return "redirect:/admin/category";  // Quay lại trang quản lý sau khi lưu
    }

    // Chỉnh sửa thương hiệu (lấy thông tin để đưa lên form)
    @GetMapping("/category/edit/{id}")
    public String editCategory(@PathVariable("id") Long id, Model model) {
        ProductCategory category = categoryService.getById(id);
        model.addAttribute("category", category);  // Đối tượng category được điền vào form để cập nhật
        List<ProductCategory> list = categoryService.getAll();
        model.addAttribute("isEdit", true);  // Đặt biến để phân biệt cập nhật
        model.addAttribute("categories", list);  // Hiển thị lại danh sách thương hiệu
        return "admin/category/category";  // Hiển thị form với thông tin cập nhật
    }

    // Xóa thương hiệu
    @GetMapping("/category/delete/{id}")
    public String deleteCategory(@PathVariable("id") Long id) {
        categoryService.delete(id);
        return "redirect:/admin/category";  // Quay lại trang quản lý sau khi xóa
    }

}
