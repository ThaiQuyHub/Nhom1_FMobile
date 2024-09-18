package com.group1.fmobile.controller.client;

import com.group1.fmobile.domain.Orders;
import com.group1.fmobile.domain.User;
import com.group1.fmobile.domain.dto.RegisterDTO;
import com.group1.fmobile.repository.OrderRepository;
import com.group1.fmobile.repository.UserRepository;
import com.group1.fmobile.service.account.MailService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;

/**
 * Controller xử lý các thao tác liên quan đến đơn hàng của khách hàng.
 * Bao gồm hiển thị danh sách đơn hàng và hủy đơn hàng.
 *
 * @author Nguyen Cong Dat
 */
@Controller
public class OrderController {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MailService mailService;

    /**
     * Xử lý yêu cầu GET để hiển thị trang danh sách đơn hàng của người dùng.
     *
     * @param session Phiên làm việc của người dùng
     * @param model Model để truyền dữ liệu đến view
     * @param pageable Đối tượng Pageable để hỗ trợ phân trang
     * @return Tên view để hiển thị danh sách đơn hàng hoặc chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
     */
    @GetMapping("/order")
    public String orderPage(HttpSession session, Model model, Pageable pageable) {
        // Kiểm tra xem người dùng đã đăng nhập chưa
        if(session.getAttribute("loggedInUser") == null){
            return "redirect:/login";  // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
        }

        // Lấy email của người dùng đã đăng nhập từ session
        String email = session.getAttribute("loggedInUser").toString();
        // Tìm thông tin người dùng dựa trên email
        User user = userRepository.findByEmail(email);

        // Lấy danh sách đơn hàng của người dùng với phân trang
        Page<Orders> page = orderRepository.findByUserId(user.getId(), pageable);

        // Thêm dữ liệu vào model để hiển thị trong view
        model.addAttribute("listOrder", page.getContent());  // Danh sách đơn hàng
        model.addAttribute("totalPage", page.getTotalPages());  // Tổng số trang
        model.addAttribute("currentPage", pageable.getPageNumber());  // Trang hiện tại

        return "client/order/order";  // Trả về tên view để hiển thị
    }

    /**
     * Xử lý yêu cầu POST để hủy đơn hàng.
     *
     * @param orderId ID của đơn hàng cần hủy
     * @return Chuyển hướng về trang danh sách đơn hàng sau khi hủy
     */
    @PostMapping("/cancel-order")
    public String cancelOrder(@RequestParam(value = "orderID") Long orderId){
        // Tìm đơn hàng dựa trên ID
        Orders orders = orderRepository.findById(orderId).get();

        // Cập nhật trạng thái đơn hàng thành "Đã hủy"
        orders.setStatus("Canceled");

        // Lưu thay đổi vào cơ sở dữ liệu
        orderRepository.save(orders);

        // Gửi email thông báo cho khách hàng về việc hủy đơn hàng
        mailService.sendMail(orders.getUser().getEmail(),
                "Thông báo đơn hàng bị hủy",
                "Đơn hàng " + orders.getId() + " của bạn đã bị hủy vào lúc " + LocalDateTime.now());

        // Chuyển hướng về trang danh sách đơn hàng
        return "redirect:/order";
    }
}