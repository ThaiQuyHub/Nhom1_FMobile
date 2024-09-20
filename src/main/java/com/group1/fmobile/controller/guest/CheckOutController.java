package com.group1.fmobile.controller.guest;

import com.group1.fmobile.domain.*;
import com.group1.fmobile.repository.*;
import com.group1.fmobile.service.PaymentMethodService;
import com.group1.fmobile.service.ProductServices;
import com.group1.fmobile.service.RoleService;
import com.group1.fmobile.service.account.MailService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.LocalDate;
import java.util.*;

/**
 * Controller xử lý các quá trình thanh toán trong ứng dụng thương mại điện tử.
 * Bao gồm hiển thị trang thanh toán, tạo đơn hàng cho cả người dùng đã đăng nhập và khách.
 *
 * @author Nguyen Cong Dat
 */
@Controller
public class CheckOutController {

    @Autowired
    private ProductServices productServices;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PaymentMethodService paymentMethodService;

    @Autowired
    private PaymentMethodRepository paymentMethodRepository;

    @Autowired
    private DiscountRepository discountRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Autowired
    private MailService mailService;

    @Autowired
    private RoleRepository roleRepository;

    /**
     * Xử lý yêu cầu GET cho trang thanh toán.
     * Chuẩn bị dữ liệu cần thiết cho quá trình thanh toán bao gồm các mục trong giỏ hàng và tổng số tiền.
     */
    @GetMapping("/checkout")
    public String checkout(HttpSession session,
                           @RequestParam(value = "productId[]", required = false) String[] productIds,
                           @RequestParam(value = "productQuantity[]", required = false) String[] quantities,
                           @RequestParam(value = "totalAmount", required = false) String total,
                           Model model) {
        if(session.getAttribute("loggedInUser") != null){
            String email = session.getAttribute("loggedInUser").toString();
            User user = userRepository.findByEmail(email);
            model.addAttribute("user", user);
        }

        if(productIds == null || productIds.length == 0){
            model.addAttribute("error", "Giỏ hàng trống. Vui lòng thêm sản phẩm vào giỏ hàng trước khi thanh toán.");
            return "redirect:/home";
        }

        HashMap<Product, Long> cartProducts = new HashMap<Product, Long>();
        Double totalAmount = Double.parseDouble(total);

        for (int i = 0; i < productIds.length; i++) {
            Long id = Long.parseLong(productIds[i]);
            Long quantity = Long.parseLong(quantities[i]);
            Product product = productServices.getProductById(id);
            if (product != null) {
                cartProducts.put(product, quantity);
            }
        }

        List<Discount> discounts = discountRepository.findByAmount(totalAmount);
        if (!discounts.isEmpty()) {
            Discount applicableDiscount = discounts.get(0);
            model.addAttribute("discount", applicableDiscount);

            Double discountedAmount = totalAmount - applicableDiscount.getDiscountValue();
            model.addAttribute("discountedAmount", discountedAmount);
        }

        session.setAttribute("cartProducts", cartProducts);
        session.setAttribute("totalAmount", totalAmount);
        model.addAttribute("cart", cartProducts);
        model.addAttribute("totalAmount", totalAmount);
        model.addAttribute("payment", paymentMethodService.findAll());

        return "guest/searchPage/checkout";
    }

    /**
     * Xử lý yêu cầu POST để tạo đơn hàng cho người dùng đã đăng nhập.
     * Xử lý chi tiết đơn hàng, lưu đơn hàng và gửi email xác nhận.
     */
    @PostMapping("/checkout")
    public String createOrder(HttpSession session, Model model,
                              @RequestParam(value = "payment") Long payment,
                              @RequestParam(value = "address") String address){
        String email = session.getAttribute("loggedInUser").toString();
        User user = userRepository.findByEmail(email);
        PaymentMethod paymentMethod = paymentMethodRepository.findById(payment).get();
        HashMap<Product, Long> cartProducts = (HashMap<Product, Long>) session.getAttribute("cartProducts");

        if(cartProducts.size() == 0){
            model.addAttribute("errorQuantityCart", "Số lượng trong giỏ hàng phải > 0");
            return "guest/searchPage/checkout";
        }

        Double total = tinhTongTien(cartProducts);

        Orders orders = taoDonHang(user, paymentMethod, address, total);

        apDungGiamGia(orders, total);

        Orders result = orderRepository.save(orders);

        luuChiTietDonHang(result, cartProducts);

        // Tính toán số tiền sau khi áp dụng giảm giá
        double totalAfterDiscount = calculateTotalAfterDiscount(orders);

        // Cập nhật số tiền của người dùng
        user.setAmount(user.getAmount() + (long) totalAfterDiscount);
        userRepository.save(user);

        model.addAttribute("orderMessage", "Đặt hàng thành công! Cảm ơn bạn đã mua hàng.");
        mailService.sendMail(user.getEmail(), "Thông báo đặt hàng thành công",
                "Cảm ơn bạn đã đặt hàng của chúng tôi. Mã đơn hàng của bạn là: " + orders.getId());

        return "redirect:/order";
    }

    /**
     * Xử lý yêu cầu POST để tạo đơn hàng cho người dùng chưa đăng nhập (thanh toán khách).
     * Xử lý chi tiết đơn hàng, lưu đơn hàng và gửi email xác nhận nếu có.
     */
    @PostMapping("/checkout-not-login")
    public String createOrderNotLogin(HttpSession session, Model model,
                                      @RequestParam(value = "payment") Long payment,
                                      @RequestParam(value = "phone") String phone,
                                      @RequestParam(value = "address") String address,
                                      @RequestParam(value = "fullName") String fullName,
                                      @RequestParam(value = "email") String email) {
        PaymentMethod paymentMethod = paymentMethodRepository.findById(payment).get();
        HashMap<Product, Long> cartProducts = (HashMap<Product, Long>) session.getAttribute("cartProducts");

        if (cartProducts.size() == 0) {
            model.addAttribute("errorQuantityCart", "Số lượng trong giỏ hàng phải > 0");
            return "guest/searchPage/checkout";
        }

        Double total = tinhTongTien(cartProducts);

        Orders orders;

        if (email != null && !email.isEmpty()) {
            User existingUser = userRepository.findByEmail(email);

            if (existingUser == null) {
                User newUser = new User();
                newUser.setFullName(fullName);
                newUser.setPhone(phone);
                newUser.setAddress(address);
                newUser.setCreationDate(LocalDate.now());
                newUser.setRoles(new HashSet<>(List.of(new Role(3,RoleType.GUEST))));
                userRepository.save(newUser);

                orders = taoDonHang(newUser, paymentMethod, address, total);
            } else {
                orders = taoDonHang(existingUser, paymentMethod, address, total);
            }
        } else {
            orders = taoDonHangKhach(paymentMethod, address, total, fullName, phone);
        }

        Orders result = orderRepository.save(orders);

        luuChiTietDonHang(result, cartProducts);

        model.addAttribute("orderMessage", "Đặt hàng thành công! Cảm ơn bạn đã mua hàng.");

        if (email != null && !email.isEmpty()) {
            mailService.sendMail(email, "Thông báo đặt hàng thành công",
                    "Cảm ơn bạn đã đặt hàng của chúng tôi. Mã đơn hàng của bạn là: " + result.getId());
        }

        return "redirect:/home";
    }

    /**
     * Tính tổng số tiền cho đơn hàng dựa trên nội dung giỏ hàng.
     */
    private Double tinhTongTien(HashMap<Product, Long> cartProducts) {
        return cartProducts.entrySet().stream()
                .mapToDouble(entry -> entry.getKey().getPrice() * entry.getValue())
                .sum();
    }

    /**
     * Tạo đối tượng Đơn hàng cho người dùng đã đăng nhập.
     */
    private Orders taoDonHang(User user, PaymentMethod paymentMethod, String address, Double total) {
        Orders orders = new Orders();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDate = LocalDateTime.now().format(formatter);
        orders.setOrderDate(LocalDateTime.parse(formattedDate, formatter));
        orders.setStatus("Waiting");
        orders.setPaymentMethod(paymentMethod);
        orders.setUser(user);
        orders.setShippingAddress(address);
        orders.setTotalPayment(total);
        return orders;
    }

    /**
     * Tạo đối tượng Đơn hàng cho người dùng chưa đăng nhập (khách).
     */
    private Orders taoDonHangKhach(PaymentMethod paymentMethod, String address, Double total, String fullName, String phone) {
        Orders orders = new Orders();
        orders.setOrderDate(LocalDateTime.now());
        orders.setStatus("Waiting");
        orders.setPaymentMethod(paymentMethod);
        orders.setShippingAddress(address);
        orders.setTotalPayment(total);
        orders.setFullName(fullName);
        orders.setPhone(phone);
        return orders;
    }

    /**
     * Áp dụng giảm giá cho đơn hàng nếu có.
     */
    private void apDungGiamGia(Orders orders, Double total) {
        List<Discount> discounts = discountRepository.findByAmount(total);
        if (!discounts.isEmpty()) {
            orders.setDiscount(discounts.get(0));
        }
    }

    /**
     * Lưu chi tiết đơn hàng cho từng sản phẩm trong giỏ hàng.
     */
    private void luuChiTietDonHang(Orders order, HashMap<Product, Long> cartProducts) {
        for (Map.Entry<Product, Long> entry : cartProducts.entrySet()) {
            Product product = entry.getKey();
            Long quantity = entry.getValue();

            OrdersDetail ordersDetail = new OrdersDetail();
            ordersDetail.setOrders(order);
            ordersDetail.setPrice(product.getPrice());
            ordersDetail.setProduct(product);
            ordersDetail.setQuantity(Integer.valueOf(quantity.toString()));

            orderDetailRepository.save(ordersDetail);
        }
    }

    /**
     * Tính toán tổng số tiền sau khi áp dụng giảm giá.
     */
    private double calculateTotalAfterDiscount(Orders order) {
        double totalBeforeDiscount = order.getTotalPayment();
        if (order.getDiscount() != null) {
            return totalBeforeDiscount - order.getDiscount().getDiscountValue();
        }
        return totalBeforeDiscount;
    }
}