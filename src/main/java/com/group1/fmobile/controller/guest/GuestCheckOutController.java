
package com.group1.fmobile.controller.guest;

import com.group1.fmobile.domain.*;
import com.group1.fmobile.domain.dto.OrderDTO;
import com.group1.fmobile.repository.*;
import com.group1.fmobile.service.PaymentMethodService;
import com.group1.fmobile.service.ProductServices;
import com.group1.fmobile.service.account.MailService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@Controller
@RequestMapping("/checkout")
@Transactional
public class GuestCheckOutController {

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
    private OrdersDetailRepository orderDetailRepository;
    @Autowired
    private MailService mailService;

    private static final Logger logger = LoggerFactory.getLogger(GuestCheckOutController.class);

    @GetMapping
    public String checkout(HttpSession session,
                           @RequestParam(value = "productId[]", required = false) String[] productIds,
                           @RequestParam(value = "productQuantity[]", required = false) String[] quantities,
                           @RequestParam(value = "totalAmount", required = false) String total,
                           Model model) {
        if (productIds == null || productIds.length == 0) {
            model.addAttribute("error", "Cart is empty. Please add products to cart before checkout.");
            return "redirect:/home";
        }

        Map<Product, Long> cartProducts = new HashMap<>();
        Double totalAmount = Double.parseDouble(total);

        for (int i = 0; i < productIds.length; i++) {
            Product product = productServices.getProductById(Long.parseLong(productIds[i]));
            if (product != null) {
                cartProducts.put(product, Long.parseLong(quantities[i]));
            }
        }

        applyDiscount(totalAmount, model);
        setSessionAttributes(session, cartProducts, totalAmount);
        setModelAttributes(model, cartProducts, totalAmount);

        List<PaymentMethod> paymentMethods = paymentMethodService.findAll();
        model.addAttribute("paymentMethods", paymentMethods);

        OrderDTO orderDTO = createOrderDTO(session);
        model.addAttribute("orderDTO", orderDTO);

        User user = getUser(session);
        model.addAttribute("user", user);

        logger.info("Checkout method called. User: " + (user != null ? user.getEmail() : "null"));

        return "guest/searchPage/checkout";
    }

    @PostMapping
    public String createOrder(@Valid @ModelAttribute("orderDTO") OrderDTO orderDTO, BindingResult bindingResult,
                              HttpSession session, Model model) {
        User user = getUser(session);
        logger.info("CreateOrder method called. User: " + (user != null ? user.getEmail() : "null"));

        if (bindingResult.hasErrors()) {
            addAttributesForCheckoutForm(model, session);
            model.addAttribute("user", user);
            return "guest/searchPage/checkout";
        }

        try {
            if (user == null) {
                logger.info("User is null, redirecting to not-login checkout");
                return "redirect:/checkout/not-login";
            }

            // Đảm bảo sử dụng email của user đã đăng nhập
            String userEmail = user.getEmail();
            if (userEmail == null || userEmail.isEmpty()) {
                logger.error("Logged in user has no email address");
                model.addAttribute("emailError", "User email not found. Please update your profile.");
                return "guest/searchPage/checkout";
            }

            PaymentMethod paymentMethod = paymentMethodRepository.findById(orderDTO.getPaymentId()).orElseThrow();
            Map<Product, Long> cartProducts = getCartProducts(session);

            if (cartProducts.isEmpty()) {
                model.addAttribute("errorQuantityCart", "Cart quantity must be > 0");
                return "guest/searchPage/checkout";
            }

            Double total = calculateTotal(cartProducts);
            Orders order = createAndSaveOrder(user, paymentMethod, orderDTO.getAddress(), total);
            saveOrderDetails(order, cartProducts);

            updateUserAmount(user, order);

            // Sử dụng email của user để gửi xác nhận
            try {
                sendConfirmationEmail(order, userEmail);
                logger.info("Confirmation email sent to: " + userEmail);
            } catch (Exception e) {
                logger.error("Failed to send confirmation email to " + userEmail, e);
                model.addAttribute("emailError", "We couldn't send a confirmation email. Please check your order details in your account.");
            }

            clearSessionAttributes(session);
            clearSessionErrorMessage(session);

            setSuccessMessage(model, session);
        } catch (Exception e) {
            logger.error("Error in createOrder: ", e);
            setErrorMessage(model, session);
            return "guest/searchPage/checkout";
        }

        return "redirect:/order";
    }

    @PostMapping("/not-login")
    public String createOrderNotLogin(@Valid @ModelAttribute("orderDTO") OrderDTO orderDTO, BindingResult bindingResult,
                                      HttpSession session, Model model) {
        logger.info("CreateOrderNotLogin method called");

        if (bindingResult.hasErrors()) {
            addAttributesForCheckoutForm(model, session);
            return "guest/searchPage/checkout";
        }

        try {
            User existingUser = userRepository.findByEmail(orderDTO.getEmail());
            if (existingUser != null) {
                model.addAttribute("emailError", "This email is already registered. Please use a different email to receive notifications or log in to get discounts.");
                addAttributesForCheckoutForm(model, session);
                return "guest/searchPage/checkout";
            }

            PaymentMethod paymentMethod = paymentMethodRepository.findById(orderDTO.getPaymentId()).orElseThrow();
            Map<Product, Long> cartProducts = getCartProducts(session);

            if (cartProducts.isEmpty()) {
                model.addAttribute("errorQuantityCart", "Cart quantity must be > 0");
                return "guest/searchPage/checkout";
            }

            Double total = calculateTotal(cartProducts);

            Orders order = createAndSaveOrderForGuestWithoutEmail(orderDTO, paymentMethod, total);
            saveOrderDetails(order, cartProducts);

            updateUserAmount(order.getUser(), order);

            try {
                sendConfirmationEmail(order, orderDTO);
                logger.info("Sent email to: " + orderDTO.getEmail());
            } catch (Exception e) {
                logger.error("Failed to send confirmation email to: " + orderDTO.getEmail(), e);
            }


            clearSessionAttributes(session);
            clearSessionErrorMessage(session);
            setSuccessMessage(model, session);
        } catch (Exception e) {
            logger.error("Error in createOrderNotLogin: ", e);
            setErrorMessage(model, session);
            return "guest/searchPage/checkout";
        }

        return "redirect:/home";
    }

    private void applyDiscount(Double totalAmount, Model model) {
        List<Discount> discounts = discountRepository.findByAmount(totalAmount);
        if (!discounts.isEmpty()) {
            Discount applicableDiscount = discounts.get(0);
            model.addAttribute("discount", applicableDiscount);
            model.addAttribute("discountedAmount", totalAmount - applicableDiscount.getDiscountValue());
        }
    }

    private void setSessionAttributes(HttpSession session, Map<Product, Long> cartProducts, Double totalAmount) {
        session.setAttribute("cartProducts", cartProducts);
        session.setAttribute("totalAmount", totalAmount);
    }

    private void setModelAttributes(Model model, Map<Product, Long> cartProducts, Double totalAmount) {
        model.addAttribute("cart", cartProducts);
        model.addAttribute("totalAmount", totalAmount);
        model.addAttribute("payment", paymentMethodService.findAll());
    }

    private OrderDTO createOrderDTO(HttpSession session) {
        OrderDTO orderDTO = new OrderDTO();
        User user = getUser(session);
        if (user != null) {
            orderDTO.setFullName(user.getFullName());
            orderDTO.setAddress(user.getAddress());
            orderDTO.setPhone(user.getPhone());
            orderDTO.setEmail(user.getEmail());
        }
        return orderDTO;
    }

    private User getUser(HttpSession session) {
        String email = session.getAttribute("loggedInUser") != null ? session.getAttribute("loggedInUser").toString() : null;
        return email != null ? userRepository.findByEmail(email) : null;
    }

    @SuppressWarnings("unchecked")
    private Map<Product, Long> getCartProducts(HttpSession session) {
        return (Map<Product, Long>) session.getAttribute("cartProducts");
    }

    private Double calculateTotal(Map<Product, Long> cartProducts) {
        return cartProducts.entrySet().stream()
                .mapToDouble(entry -> entry.getKey().getPrice() * entry.getValue())
                .sum();
    }

    private Orders createAndSaveOrder(User user, PaymentMethod paymentMethod, String address, Double total) {
        Orders order = new Orders();
        order.setOrderDate(LocalDateTime.now());
        order.setStatus("Waiting");
        order.setPaymentMethod(paymentMethod);
        order.setUser(user);
        order.setShippingAddress(address);
        order.setTotalPayment(total);

        List<Discount> discounts = discountRepository.findByAmount(total);
        if (!discounts.isEmpty()) {
            order.setDiscount(discounts.get(0));
        }

        return orderRepository.save(order);
    }

    private Orders createAndSaveOrderForGuestWithoutEmail(OrderDTO orderDTO, PaymentMethod paymentMethod, Double total) {
        User user = new User();
        user.setFullName(orderDTO.getFullName());
        user.setPhone(orderDTO.getPhone());
        user.setAddress(orderDTO.getAddress());
        user.setEmail(null);
        user.setCreationDate(LocalDate.now());
        user.setRoles(new HashSet<>(List.of(new Role(3, RoleType.GUEST))));
        user.setAmount(0L);
        user = userRepository.save(user);

        return createAndSaveOrder(user, paymentMethod, orderDTO.getAddress(), total);
    }

    private void saveOrderDetails(Orders order, Map<Product, Long> cartProducts) {
        for (Map.Entry<Product, Long> entry : cartProducts.entrySet()) {
            OrdersDetail ordersDetail = new OrdersDetail();
            ordersDetail.setOrders(order);
            ordersDetail.setPrice(entry.getKey().getPrice());
            ordersDetail.setProduct(entry.getKey());
            ordersDetail.setQuantity(entry.getValue().intValue());
            orderDetailRepository.save(ordersDetail);
        }
    }

    private void updateUserAmount(User user, Orders order) {
        if (user != null) {
            double newOrderAmount = calculateTotalAfterDiscount(order);
            user.setAmount(user.getAmount() + (long) newOrderAmount);
            userRepository.save(user);
        }
    }

    private double calculateTotalAfterDiscount(Orders order) {
        double totalBeforeDiscount = order.getTotalPayment();
        if (order.getDiscount() != null) {
            return totalBeforeDiscount - order.getDiscount().getDiscountValue();
        }
        return totalBeforeDiscount;
    }

    private void sendConfirmationEmail(Orders order, OrderDTO orderDTO) {
        String emailContent = String.format(
                "Thank you for your order: [ %s ].\n\nOrder Details\nOrder ID: %s\nShipping Address: %s\nPhone: %s\n",
                orderDTO.getFullName(),
                order.getId(),
                order.getShippingAddress(),
                orderDTO.getPhone()
        );
        mailService.sendMail(orderDTO.getEmail(), "Order Confirmation", emailContent);
    }
    // Cập nhật phương thức sendConfirmationEmail để nhận email trực tiếp
    private void sendConfirmationEmail(Orders order, String email) {
        String emailContent = String.format(
                "Thank you for your order: [ %s ].\n\nOrder Details\nOrder ID: %s\nShipping Address: %s\nPhone: %s\n",
                order.getUser().getFullName(),
                order.getId(),
                order.getShippingAddress(),
                order.getUser().getPhone()
        );
        mailService.sendMail(email, "Order Confirmation", emailContent);
    }

    private void clearSessionAttributes(HttpSession session) {
        session.removeAttribute("cartProducts");
        session.removeAttribute("totalAmount");
    }

    private void clearSessionErrorMessage(HttpSession session) {
        session.removeAttribute("orderError");
    }

    private void setSuccessMessage(Model model, HttpSession session) {
        String successMessage = "Order placed successfully! Thank you for your purchase.";
        model.addAttribute("orderSuccess", successMessage);
        session.setAttribute("orderSuccess", successMessage);
    }

    private void setErrorMessage(Model model, HttpSession session) {
        String errorMessage = "An error occurred while processing your order. Please try again.";
        model.addAttribute("orderError", errorMessage);
        session.setAttribute("orderError", errorMessage);
    }

    private void addAttributesForCheckoutForm(Model model, HttpSession session) {
        model.addAttribute("cart", session.getAttribute("cartProducts"));
        model.addAttribute("totalAmount", session.getAttribute("totalAmount"));
        model.addAttribute("payment", paymentMethodService.findAll());
        User user = getUser(session);
        model.addAttribute("user", user);
    }
}