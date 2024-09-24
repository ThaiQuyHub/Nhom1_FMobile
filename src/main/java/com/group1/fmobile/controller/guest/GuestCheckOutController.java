package com.group1.fmobile.controller.guest;

import com.group1.fmobile.domain.*;
import com.group1.fmobile.domain.dto.OrderDTO;
import com.group1.fmobile.repository.*;
import com.group1.fmobile.service.PaymentMethodService;
import com.group1.fmobile.service.ProductServices;
import com.group1.fmobile.service.account.MailService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
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

    @GetMapping("/checkout")
    public String checkout(HttpSession session,
                           @RequestParam(value = "productId[]", required = false) String[] productIds,
                           @RequestParam(value = "productQuantity[]", required = false) String[] quantities,
                           @RequestParam(value = "totalAmount", required = false) String total,
                           Model model) {
        if (productIds == null || productIds.length == 0) {
            model.addAttribute("error", "Cart is empty. Please add products to cart before checkout.");
            return "redirect:/home";
        }

        HashMap<Product, Long> cartProducts = new HashMap<>();
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

        OrderDTO orderDTO = new OrderDTO();
        if (session.getAttribute("loggedInUser") != null) {
            String email = session.getAttribute("loggedInUser").toString();
            User user = userRepository.findByEmail(email);
            model.addAttribute("user", user);

            orderDTO.setFullName(user.getFullName());
            orderDTO.setAddress(user.getAddress());
            orderDTO.setPhone(user.getPhone());
            orderDTO.setEmail(user.getEmail());
        }
        model.addAttribute("orderDTO", orderDTO);

        return "guest/searchPage/checkout";
    }

    @PostMapping("/checkout")
    public String createOrder(@Valid @ModelAttribute("orderDTO") OrderDTO orderDTO, BindingResult bindingResult,
                              HttpSession session, Model model) {
        if (bindingResult.hasErrors()) {
            addAttributesForCheckoutForm(model, session);
            return "guest/searchPage/checkout";
        }

        try {
            String email = session.getAttribute("loggedInUser") != null ? session.getAttribute("loggedInUser").toString() : null;
            User user = email != null ? userRepository.findByEmail(email) : null;
            PaymentMethod paymentMethod = paymentMethodRepository.findById(orderDTO.getPaymentId()).orElseThrow();
            HashMap<Product, Long> cartProducts = (HashMap<Product, Long>) session.getAttribute("cartProducts");

            if (cartProducts.isEmpty()) {
                model.addAttribute("errorQuantityCart", "Cart quantity must be > 0");
                return "guest/searchPage/checkout";
            }

            Double total = calculateTotal(cartProducts);
            Orders orders;

            if (user != null) {
                orders = createOrder(user, paymentMethod, orderDTO.getAddress(), total);
//                orders.setFullName(orderDTO.getFullName());
//                orders.setPhone(orderDTO.getPhone());
            } else {
                orders = createGuestOrder(paymentMethod, orderDTO.getAddress(), total, orderDTO.getFullName(), orderDTO.getPhone());
            }

            applyDiscount(orders, total);
            Orders result = orderRepository.save(orders);
            saveOrderDetails(result, cartProducts);

            double totalAfterDiscount = calculateTotalAfterDiscount(orders);
            if (user != null) {
                user.setAmount(user.getAmount() + (long) totalAfterDiscount);
                userRepository.save(user);
            }

            String emailContent = String.format(
                    "Thank you for your order: [ %s ].\n\nOrder Details\nOrder ID: %s\nShipping Address: %s\nPhone: %s\n"
//                    orders.getFullName(),
//                    orders.getId(),
//                    orders.getShippingAddress(),
//                    orders.getPhone()
            );

            mailService.sendMail(user != null ? user.getEmail() : orderDTO.getEmail(), "Order Confirmation", emailContent);

            session.removeAttribute("cartProducts");
            session.removeAttribute("totalAmount");


            model.addAttribute("orderSuccess", "Order placed successfully! Thank you for your purchase.");
            session.setAttribute("orderSuccess", "Order placed successfully! Thank you for your purchase.");
        } catch (Exception e) {
            model.addAttribute("orderError", "An error occurred while processing your order. Please try again.");
            session.setAttribute("orderError", "An error occurred while processing your order. Please try again.");
            return "guest/searchPage/checkout";
        }

        return "redirect:/order";
    }

    @PostMapping("/checkout-not-login")
    public String createOrderNotLogin(@Valid @ModelAttribute("orderDTO") OrderDTO orderDTO, BindingResult bindingResult,
                                      HttpSession session, Model model) {
        if (bindingResult.hasErrors()) {
            addAttributesForCheckoutForm(model, session);
            return "guest/searchPage/checkout";
        }

        try {
            PaymentMethod paymentMethod = paymentMethodRepository.findById(orderDTO.getPaymentId()).orElseThrow();
            HashMap<Product, Long> cartProducts = (HashMap<Product, Long>) session.getAttribute("cartProducts");

            if (cartProducts.isEmpty()) {
                model.addAttribute("errorQuantityCart", "Cart quantity must be > 0");
                return "guest/searchPage/checkout";
            }

            Double total = calculateTotal(cartProducts);
            Orders orders;

            if (orderDTO.getEmail() != null && !orderDTO.getEmail().isEmpty()) {
                User existingUser = userRepository.findByEmail(orderDTO.getEmail());

                if (existingUser != null) {
                    model.addAttribute("emailError", "Email already exists in the system. Please log in or use a different email.");
                    addAttributesForCheckoutForm(model, session);
                    return "guest/searchPage/checkout";
                }

                User newUser = createNewUser(orderDTO);
                // Cộng dồn số tiền vào tài khoản của người không login ???




                userRepository.save(newUser);
                orders = createOrder(newUser, paymentMethod, orderDTO.getAddress(), total);
//                orders.setFullName(orderDTO.getFullName());
//                orders.setPhone(orderDTO.getPhone());
            } else {
                orders = createGuestOrder(paymentMethod, orderDTO.getAddress(), total, orderDTO.getFullName(), orderDTO.getPhone());
            }

            Orders result = orderRepository.save(orders);
            saveOrderDetails(result, cartProducts);

            String emailContent = String.format(
                    "Thank you for your order: [ %s ].\n\nOrder Details\nOrder ID: %s\nShipping Address: %s\nPhone: %s\n"
//                    orders.getFullName(),
//                    orders.getId(),
//                    orders.getShippingAddress(),
//                    orders.getPhone()
            );

            session.removeAttribute("cartProducts");
            session.removeAttribute("totalAmount");

            mailService.sendMail(orderDTO.getEmail(), "Order Confirmation", emailContent);
            model.addAttribute("orderSuccess", "Order placed successfully! Thank you for your purchase.");
            session.setAttribute("orderSuccess", "Order placed successfully! Thank you for your purchase.");
        } catch (Exception e) {
            model.addAttribute("orderError", "An error occurred while processing your order. Please try again.");
            session.setAttribute("orderError", "An error occurred while processing your order. Please try again.");
            return "guest/searchPage/checkout";
        }

        return "redirect:/home";
    }

    private void addAttributesForCheckoutForm(Model model, HttpSession session) {
        model.addAttribute("cart", session.getAttribute("cartProducts"));
        model.addAttribute("totalAmount", session.getAttribute("totalAmount"));
        model.addAttribute("payment", paymentMethodService.findAll());
    }

    private User createNewUser(OrderDTO orderDTO) {
        User newUser = new User();
        newUser.setFullName(orderDTO.getFullName());
        newUser.setPhone(orderDTO.getPhone());
        newUser.setAddress(orderDTO.getAddress());
//        newUser.setEmail(orderDTO.getEmail());
        newUser.setCreationDate(LocalDate.now());
        newUser.setRoles(new HashSet<>(List.of(new Role(3, RoleType.GUEST))));
        newUser.setAmount(0L);
        return newUser;
    }

    private Double calculateTotal(HashMap<Product, Long> cartProducts) {
        return cartProducts.entrySet().stream()
                .mapToDouble(entry -> entry.getKey().getPrice() * entry.getValue())
                .sum();
    }

    private Orders createOrder(User user, PaymentMethod paymentMethod, String address, Double total) {
        Orders orders = new Orders();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDate = LocalDateTime.now().format(formatter);
        orders.setOrderDate(LocalDateTime.parse(formattedDate, formatter));
        orders.setStatus("Waiting");
//        orders.setPaymentMethod(paymentMethod);
        orders.setUser(user);
        orders.setShippingAddress(address);
        orders.setTotalPayment(total);
        return orders;
    }

    private Orders createGuestOrder(PaymentMethod paymentMethod, String address, Double total, String fullName, String phone) {
        Orders orders = new Orders();
        orders.setOrderDate(LocalDateTime.now());
        orders.setStatus("Waiting");
//        orders.setPaymentMethod(paymentMethod);
        orders.setShippingAddress(address);
        orders.setTotalPayment(total);
//        orders.setFullName(fullName);
//        orders.setPhone(phone);
        return orders;
    }

    private void applyDiscount(Orders orders, Double total) {
        List<Discount> discounts = discountRepository.findByAmount(total);
        if (!discounts.isEmpty()) {
            orders.setDiscount(discounts.get(0));
        }
    }

    private void saveOrderDetails(Orders order, HashMap<Product, Long> cartProducts) {
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

    private double calculateTotalAfterDiscount(Orders order) {
        double totalBeforeDiscount = order.getTotalPayment();
        if (order.getDiscount() != null) {
            return totalBeforeDiscount - order.getDiscount().getDiscountValue();
        }
        return totalBeforeDiscount;
    }
}
