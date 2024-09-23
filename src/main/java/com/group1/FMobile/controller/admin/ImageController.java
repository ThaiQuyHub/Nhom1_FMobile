package com.group1.fmobile.controller.admin;

import com.group1.fmobile.domain.dto.Image;
import com.group1.fmobile.domain.dto.Product;
import com.group1.fmobile.service.ImageService;
import com.group1.fmobile.service.ProductService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("/admin/image")
public class ImageController {

    @Autowired
    private ImageService imageService;

    @Autowired
    private ProductService productService;

    // Đường dẫn lưu trữ hình ảnh trên server
    private static String UPLOAD_DIR = "src/main/webapp/resources/images/product";
    // Hiển thị danh sách thương hiệu và form thêm mới
    @RequestMapping("")
    public String listImage(Model model) {
        List<Image> images = imageService.getAll();
        List<Product> products = productService.getAll();

        model.addAttribute("isEdit", false);  // Đặt biến cho trường hợp thêm mới
        model.addAttribute("images", images);
        model.addAttribute("products", products);
        model.addAttribute("image", new Image());  // Tạo đối tượng trống cho thêm mới
        return "admin/image/image";  // Hiển thị form thêm mới mặc định
    }
    // Xử lý thêm mới hoặc cập nhật hình ảnh
    @PostMapping("/saveOrUpdate")
    public String saveOrUpdateImage(@Valid @ModelAttribute("image") Image image,
                                    BindingResult bindingResult,
                                    @RequestParam("image_data") MultipartFile imageData,
                                    RedirectAttributes redirectAttributes) {
        // Kiểm tra lỗi xác thực cho các trường khác của đối tượng Image (ngoại trừ image_data)
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Dữ liệu không hợp lệ!");
            return "redirect:/admin/image";
        }

        // Kiểm tra xem file có được tải lên hay không
        if (imageData == null || imageData.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Vui lòng chọn hình ảnh!");
            return "redirect:/admin/image";
        }

        try {
            // Kiểm tra định dạng file (chỉ chấp nhận PNG và JPEG)
            String contentType = imageData.getContentType();
            if (!contentType.equals("image/png") && !contentType.equals("image/jpeg")) {
                redirectAttributes.addFlashAttribute("errorMessage", "Chỉ chấp nhận định dạng PNG hoặc JPEG!");
                return "redirect:/admin/image";
            }

            // Lưu file hình ảnh lên server
            String fileName = imageData.getOriginalFilename();
            Path filePath = Paths.get(UPLOAD_DIR + fileName);
            Files.write(filePath, imageData.getBytes());

            // Lưu URL của hình ảnh (đường dẫn tương đối)
            image.setImage_url("/images/product/" + fileName);

            // Lưu đối tượng Image vào cơ sở dữ liệu
            imageService.saveOrUpdate(image);
            redirectAttributes.addFlashAttribute("successMessage", "Hình ảnh đã được lưu thành công!");

        } catch (IOException e) {
            // Xử lý lỗi khi lưu hình ảnh
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi trong quá trình lưu hình ảnh: " + e.getMessage());
            return "redirect:/admin/image";
        }

        return "redirect:/admin/image";  // Quay lại trang quản lý sau khi lưu
    }

    // Chỉnh sửa hình ảnh (lấy thông tin để đưa lên form)
    @GetMapping("/edit/{id}")
    public String editImage(@PathVariable("id") Long id, Model model) {
        Image image = imageService.getById(id);
        List<Product> products = productService.getAll();

        model.addAttribute("isEdit", true);  // Đặt biến để phân biệt chế độ cập nhật
        model.addAttribute("image", image);  // Đối tượng image được điền vào form để cập nhật
        model.addAttribute("products", products);  // Hiển thị lại danh sách sản phẩm

        List<Image> images = imageService.getAll();
        model.addAttribute("images", images);  // Hiển thị danh sách hình ảnh

        return "admin/image/image";  // Hiển thị form với thông tin cập nhật
    }

    // Xóa hình ảnh
    @GetMapping("/delete/{id}")
    public String deleteImage(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        try {
            imageService.delete(id);
            redirectAttributes.addFlashAttribute("successMessage", "Hình ảnh đã được xóa thành công!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi khi xóa hình ảnh: " + e.getMessage());
        }

        return "redirect:/admin/image";  // Quay lại trang quản lý sau khi xóa
    }

}
