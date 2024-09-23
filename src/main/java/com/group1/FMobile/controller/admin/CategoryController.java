package com.group1.fmobile.controller.admin;

import com.group1.fmobile.domain.dto.Brand;
import com.group1.fmobile.domain.dto.Category;
import com.group1.fmobile.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;
    // Hiển thị danh sách thương hiệu và form thêm mới
    @RequestMapping("")
    public String listCategory(Model model) {
        List<Category> list = categoryService.getAll();
        model.addAttribute("categories", list);
        model.addAttribute("isEdit", false);  // Đặt biến cho trường hợp thêm mới
        model.addAttribute("category", new Category());  // Tạo đối tượng trống cho thêm mới
        return "admin/category/category";  // Luôn hiển thị form thêm mới mặc định
    }

    // Xử lý thêm mới hoặc cập nhật thương hiệu
    @PostMapping("/saveOrUpdate")
    public String saveOrUpdateCategory(@ModelAttribute("category") Category category, RedirectAttributes redirectAttributes) {
        categoryService.saveOrUpdate(category);  // Lưu thương hiệu (thêm mới hoặc cập nhật)
        redirectAttributes.addFlashAttribute("successMessage", "Thương hiệu đã được lưu thành công!");
        return "redirect:/admin/category";  // Quay lại trang quản lý sau khi lưu
    }

    // Chỉnh sửa thương hiệu (lấy thông tin để đưa lên form)
    @GetMapping("/edit/{id}")
    public String editCategory(@PathVariable("id") Long id, Model model) {
        Category category = categoryService.getById(id);
        model.addAttribute("category", category);  // Đối tượng category được điền vào form để cập nhật
        List<Category> list = categoryService.getAll();
        model.addAttribute("isEdit", true);  // Đặt biến để phân biệt cập nhật
        model.addAttribute("categories", list);  // Hiển thị lại danh sách thương hiệu
        return "admin/category/category";  // Hiển thị form với thông tin cập nhật
    }

    // Xóa thương hiệu
    @GetMapping("/delete/{id}")
    public String deleteCategory(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        categoryService.delete(id);
        redirectAttributes.addFlashAttribute("successMessage", "Thương hiệu đã được xóa thành công!");
        return "redirect:/admin/category";  // Quay lại trang quản lý sau khi xóa
    }

}
