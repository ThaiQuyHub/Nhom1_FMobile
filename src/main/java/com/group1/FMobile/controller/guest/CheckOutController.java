package com.group1.fmobile.controller.guest;

import com.group1.fmobile.domain.*;
import com.group1.fmobile.repository.*;
import com.group1.fmobile.service.PaymentMethodService;
import com.group1.fmobile.service.ProductServices;
import com.group1.fmobile.service.account.MailService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    /**
     * Xử lý yêu cầu GET cho trang thanh toán.
     * Chuẩn bị dữ liệu cần thiết cho quá trình thanh toán bao gồm các mục trong giỏ hàng và tổng số tiền.
     *
     * @param session Phiên HTTP để lưu trữ và truy xuất dữ liệu đặc thù của người dùng
     * @param productIds Mảng các ID sản phẩm trong giỏ hàng
     * @param quantities Mảng số lượng tương ứng với từng sản phẩm
     * @param total Tổng số tiền của đơn hàng
     * @param model Model Spring MVC để thêm thuộc tính cho view
     * @return Tên view cho trang thanh toán hoặc chuyển hướng về trang chủ nếu giỏ hàng trống
     */
    @GetMapping("/checkout")
    public String checkout(HttpSession session,
                           @RequestParam(value = "productId[]", required = false) String[] productIds,
                           @RequestParam(value = "productQuantity[]", required = false) String[] quantities,
                           @RequestParam(value = "totalAmount", required = false) String total,
                           Model model) {
        // Kiểm tra xem người dùng đã đăng nhập chưa và thêm thông tin người dùng vào model
        if(session.getAttribute("loggedInUser") != null){
            String email = session.getAttribute("loggedInUser").toString();
            User user = userRepository.findByEmail(email);
            model.addAttribute("user", user);
        }

        // Chuyển hướng về trang chủ nếu giỏ hàng trống
        if(productIds == null || productIds.length == 0){
            model.addAttribute("error", "Giỏ hàng trống. Vui lòng thêm sản phẩm vào giỏ hàng trước khi thanh toán.");
            return "redirect:/home";
        }

        // Chuẩn bị dữ liệu giỏ hàng
        HashMap<Product, Long> cartProducts = new HashMap<Product, Long>();
        Double totalAmount = Double.parseDouble(total);

        // Duyệt qua từng sản phẩm trong giỏ hàng
        for (int i = 0; i < productIds.length; i++) {
            Long id = Long.parseLong(productIds[i]);
            Long quantity = Long.parseLong(quantities[i]);
            // Lấy thông tin chi tiết của sản phẩm từ cơ sở dữ liệu
            Product product = productServices.getProductById(id);
            if (product != null) {
                // Thêm sản phẩm và số lượng vào map cartProducts
                cartProducts.put(product, quantity);
            }
        }

        // Lưu dữ liệu giỏ hàng vào session và thêm vào model
        session.setAttribute("cartProducts", cartProducts);
        session.setAttribute("totalAmount", totalAmount);
        model.addAttribute("cart", cartProducts);
        model.addAttribute("totalAmount", totalAmount);
        // Thêm danh sách phương thức thanh toán vào model
        model.addAttribute("payment", paymentMethodService.findAll());

        return "guest/searchPage/checkout";
    }

    /**
     * Xử lý yêu cầu POST để tạo đơn hàng cho người dùng đã đăng nhập.
     * Xử lý chi tiết đơn hàng, lưu đơn hàng và gửi email xác nhận.
     *
     * @param session Phiên HTTP chứa dữ liệu người dùng và giỏ hàng
     * @param model Model Spring MVC
     * @param payment ID của phương thức thanh toán đã chọn
     * @param address Địa chỉ giao hàng cho đơn hàng
     * @return Chuyển hướng đến trang chủ sau khi tạo đơn hàng thành công
     */
    @PostMapping("/checkout")
    public String createOrder(HttpSession session, Model model,
                              @RequestParam(value = "payment") Long payment,
                              @RequestParam(value = "address") String address){
        // Lấy thông tin người dùng và dữ liệu giỏ hàng từ session
        String email = session.getAttribute("loggedInUser").toString();
        User user = userRepository.findByEmail(email);
        PaymentMethod paymentMethod = paymentMethodRepository.findById(payment).get();
        HashMap<Product, Long> cartProducts = (HashMap<Product, Long>) session.getAttribute("cartProducts");

        // Kiểm tra xem giỏ hàng có trống không
        if(cartProducts.size() == 0){
            model.addAttribute("errorQuantityCart", "Số lượng trong giỏ hàng phải > 0");
            return "guest/searchPage/checkout";
        }

        // Tính tổng số tiền đơn hàng
        Double total = tinhTongTien(cartProducts);

        // Tạo và điền thông tin cho đối tượng đơn hàng
        Orders orders = taoDonHang(user, paymentMethod, address, total);

        // Áp dụng giảm giá nếu có
        apDungGiamGia(orders, total);

        // Lưu đơn hàng vào cơ sở dữ liệu
        Orders result = orderRepository.save(orders);

        // Tạo và lưu chi tiết đơn hàng
        luuChiTietDonHang(result, cartProducts);

        // Gửi email xác nhận
        mailService.sendMail(user.getEmail(), "Thông báo đặt hàng thành công",
                "Cảm ơn bạn đã đặt hàng của chúng tôi. Mã đơn hàng của bạn là: " + orders.getId());

        return "redirect:/home";
    }

    /**
     * Xử lý yêu cầu POST để tạo đơn hàng cho người dùng chưa đăng nhập (thanh toán khách).
     * Xử lý chi tiết đơn hàng, lưu đơn hàng và gửi email xác nhận nếu có.
     *
     * @param session Phiên HTTP chứa dữ liệu giỏ hàng
     * @param model Model Spring MVC
     * @param payment ID của phương thức thanh toán đã chọn
     * @param phone Số điện thoại của khách hàng
     * @param address Địa chỉ giao hàng cho đơn hàng
     * @param fullName Họ tên đầy đủ của khách hàng
     * @param email Địa chỉ email của khách hàng (tùy chọn)
     * @return Chuyển hướng đến trang chủ sau khi tạo đơn hàng thành công
     */
    @PostMapping("/checkout-not-login")
    public String createOrderNotLogin(HttpSession session, Model model,
                                      @RequestParam(value = "payment") Long payment,
                                      @RequestParam(value = "phone") String phone,
                                      @RequestParam(value = "address") String address,
                                      @RequestParam(value = "fullName") String fullName,
                                      @RequestParam(value = "email") String email) {
        // Lấy phương thức thanh toán và dữ liệu giỏ hàng
        PaymentMethod paymentMethod = paymentMethodRepository.findById(payment).get();
        HashMap<Product, Long> cartProducts = (HashMap<Product, Long>) session.getAttribute("cartProducts");

        // Kiểm tra xem giỏ hàng có trống không
        if(cartProducts.size() == 0){
            model.addAttribute("errorQuantityCart", "Số lượng trong giỏ hàng phải > 0");
            return "guest/searchPage/checkout";
        }

        // Tính tổng số tiền đơn hàng
        Double total = tinhTongTien(cartProducts);

        // Tạo và điền thông tin cho đối tượng đơn hàng của khách
        Orders orders = taoDonHangKhach(paymentMethod, address, total, fullName, phone);

        // Áp dụng giảm giá nếu có
        apDungGiamGia(orders, total);

        // Lưu đơn hàng vào cơ sở dữ liệu
        Orders result = orderRepository.save(orders);

        // Tạo và lưu chi tiết đơn hàng
        luuChiTietDonHang(result, cartProducts);

        // Gửi email xác nhận nếu có địa chỉ email
        if (email != null && !email.isEmpty()) {
            mailService.sendMail(email, "Thông báo đặt hàng thành công",
                    "Cảm ơn bạn đã đặt hàng của chúng tôi. Mã đơn hàng của bạn là: " + result.getId());
        }

        return "redirect:/home";
    }

    /**
     * Tính tổng số tiền cho đơn hàng dựa trên nội dung giỏ hàng.
     *
     * @param cartProducts Map các sản phẩm và số lượng của chúng trong giỏ hàng
     * @return Tổng số tiền của đơn hàng
     */
    private Double tinhTongTien(HashMap<Product, Long> cartProducts) {
        // Sử dụng Java Stream để tính tổng tiền
        return cartProducts.entrySet().stream()
                .mapToDouble(entry -> entry.getKey().getPrice() * entry.getValue())
                .sum();
    }

    /**
     * Tạo đối tượng Đơn hàng cho người dùng đã đăng nhập.
     *
     * @param user Người dùng đã đăng nhập
     * @param paymentMethod Phương thức thanh toán đã chọn
     * @param address Địa chỉ giao hàng
     * @param total Tổng số tiền đơn hàng
     * @return Đối tượng Đơn hàng đã tạo
     */
    private Orders taoDonHang(User user, PaymentMethod paymentMethod, String address, Double total) {
        Orders orders = new Orders();
        orders.setOrderDate(LocalDateTime.now());  // Đặt ngày đặt hàng là thời điểm hiện tại
        orders.setStatus("Waiting");  // Đặt trạng thái đơn hàng là "Đang chờ"
        orders.setPaymentMethod(paymentMethod);  // Đặt phương thức thanh toán
        orders.setUser(user);  // Liên kết đơn hàng với người dùng
        orders.setShippingAddress(address);  // Đặt địa chỉ giao hàng
        orders.setTotalPayment(total);  // Đặt tổng số tiền thanh toán
        return orders;
    }

    /**
     * Tạo đối tượng Đơn hàng cho người dùng chưa đăng nhập (khách).
     *
     * @param paymentMethod Phương thức thanh toán đã chọn
     * @param address Địa chỉ giao hàng
     * @param total Tổng số tiền đơn hàng
     * @param fullName Họ tên đầy đủ của khách hàng
     * @param phone Số điện thoại của khách hàng
     * @return Đối tượng Đơn hàng đã tạo
     */
    private Orders taoDonHangKhach(PaymentMethod paymentMethod, String address, Double total, String fullName, String phone) {
        Orders orders = new Orders();
        orders.setOrderDate(LocalDateTime.now());  // Đặt ngày đặt hàng là thời điểm hiện tại
        orders.setStatus("Waiting");  // Đặt trạng thái đơn hàng là "Đang chờ"
        orders.setPaymentMethod(paymentMethod);  // Đặt phương thức thanh toán
        orders.setShippingAddress(address);  // Đặt địa chỉ giao hàng
        orders.setTotalPayment(total);  // Đặt tổng số tiền thanh toán
        orders.setFullName(fullName);  // Đặt họ tên của khách hàng
        orders.setPhone(phone);  // Đặt số điện thoại của khách hàng
        return orders;
    }

    /**
     * Áp dụng giảm giá cho đơn hàng nếu có.
     *
     * @param orders Đối tượng Đơn hàng
     * @param total Tổng số tiền đơn hàng
     */
    private void apDungGiamGia(Orders orders, Double total) {
        // Tìm kiếm các mã giảm giá áp dụng được cho tổng số tiền này
        List<Discount> discounts = discountRepository.findByAmount(total);
        if (!discounts.isEmpty()) {
            // Nếu có mã giảm giá, áp dụng mã đầu tiên tìm được
            orders.setDiscount(discounts.get(0));
        }
    }

    /**
     * Lưu chi tiết đơn hàng cho từng sản phẩm trong giỏ hàng.
     *
     * @param order Đối tượng Đơn hàng chính
     * @param cartProducts Map các sản phẩm và số lượng của chúng trong giỏ hàng
     */
    private void luuChiTietDonHang(Orders order, HashMap<Product, Long> cartProducts) {
        for (Map.Entry<Product, Long> entry : cartProducts.entrySet()) {
            Product product = entry.getKey();
            Long quantity = entry.getValue();

            // Tạo đối tượng chi tiết đơn hàng mới
            OrdersDetail ordersDetail = new OrdersDetail();
            ordersDetail.setOrders(order);  // Liên kết với đơn hàng chính
            ordersDetail.setPrice(product.getPrice());  // Đặt giá của sản phẩm
            ordersDetail.setProduct(product);  // Liên kết với sản phẩm
            ordersDetail.setQuantity(Integer.valueOf(quantity.toString()));  // Đặt số lượng

            // Lưu chi tiết đơn hàng vào cơ sở dữ liệu
            orderDetailRepository.save(ordersDetail);
        }
    }
}