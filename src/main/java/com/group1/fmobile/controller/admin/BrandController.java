package com.group1.fmobile.controller.admin;


import com.group1.fmobile.domain.Brand;
import com.group1.fmobile.service.BrandService;
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
public class BrandController {
    @Autowired
    private BrandService brandService;
    // Hiển thị danh sách thương hiệu và form thêm mới
    @GetMapping("/brand")
    public String listBrand(Model model) {
        List<Brand> list = brandService.getAll();
        model.addAttribute("isEdit", false);  // Đặt biến cho trường hợp thêm mới
        model.addAttribute("brands", list);
        model.addAttribute("brand", new Brand());  // Tạo đối tượng trống cho thêm mới
        return "admin/brand/brand";  // Luôn hiển thị form thêm mới mặc định
    }
    // Xử lý thêm mới hoặc cập nhật thương hiệu
    @PostMapping("/brand/saveOrUpdate")
    public String saveOrUpdateBrand(@ModelAttribute("brand") @Valid Brand brand,
                                    BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {

            return "admin/brand/brand";  // Trả về trang form nếu có lỗi
        }
        brandService.saveOrUpdate(brand);  // Lưu thương hiệu (thêm mới hoặc cập nhật)
        return "redirect:/admin/brand";  // Quay lại trang quản lý sau khi lưu
    }
    // Chỉnh sửa thương hiệu (lấy thông tin để đưa lên form)
    @GetMapping("/brand/edit/{id}")
    public String editBrand(@PathVariable("id") Long id, Model model) {
        Brand brand = brandService.getById(id);
        model.addAttribute("isEdit", true);  // Đặt biến để phân biệt cập nhật
        model.addAttribute("brand", brand);  // Đối tượng brand được điền vào form để cập nhật
        List<Brand> list = brandService.getAll();
        model.addAttribute("brands", list);  // Hiển thị lại danh sách thương hiệu
        return "admin/brand/brand";  // Hiển thị form với thông tin cập nhật
    }

    // Xóa thương hiệu
    @GetMapping("/brand/delete/{id}")
    public String deleteBrand(@PathVariable("id") Long id) {
        brandService.delete(id);
        return "redirect:/admin/brand";  // Quay lại trang quản lý sau khi xóa
    }

}