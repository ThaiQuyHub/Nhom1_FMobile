package com.group1.fmobile.controller.admin;

import com.group1.fmobile.domain.dto.Brand;
import com.group1.fmobile.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin/brand")
public class BrandController {
    @Autowired
    private BrandService brandService;
    // Hiển thị danh sách thương hiệu và form thêm mới
    @RequestMapping("")
    public String listBrand(Model model) {
        List<Brand> list = brandService.getAll();
        model.addAttribute("isEdit", false);  // Đặt biến cho trường hợp thêm mới
        model.addAttribute("brands", list);
        model.addAttribute("brand", new Brand());  // Tạo đối tượng trống cho thêm mới
        return "admin/brand/brand";  // Luôn hiển thị form thêm mới mặc định
    }
    // Xử lý thêm mới hoặc cập nhật thương hiệu
    @PostMapping("/saveOrUpdate")
    public String saveOrUpdateBrand(@ModelAttribute("brand") Brand brand, RedirectAttributes redirectAttributes) {
        brandService.saveOrUpdate(brand);  // Lưu thương hiệu (thêm mới hoặc cập nhật)
        redirectAttributes.addFlashAttribute("successMessage", "Thương hiệu đã được lưu thành công!");
        return "redirect:/admin/brand";  // Quay lại trang quản lý sau khi lưu
    }
    // Chỉnh sửa thương hiệu (lấy thông tin để đưa lên form)
    @GetMapping("/edit/{id}")
    public String editBrand(@PathVariable("id") Long id, Model model) {
        Brand brand = brandService.getById(id);
        model.addAttribute("isEdit", true);  // Đặt biến để phân biệt cập nhật
        model.addAttribute("brand", brand);  // Đối tượng brand được điền vào form để cập nhật
        List<Brand> list = brandService.getAll();
        model.addAttribute("brands", list);  // Hiển thị lại danh sách thương hiệu

        return "admin/brand/brand";  // Hiển thị form với thông tin cập nhật
    }

    // Xóa thương hiệu
    @GetMapping("/delete/{id}")
    public String deleteBrand(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        brandService.delete(id);
        redirectAttributes.addFlashAttribute("successMessage", "Thương hiệu đã được xóa thành công!");
        return "redirect:/admin/brand";  // Quay lại trang quản lý sau khi xóa
    }

}