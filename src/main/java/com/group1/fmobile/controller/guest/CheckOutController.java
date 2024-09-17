package com.group1.fmobile.controller.guest;

import com.group1.fmobile.domain.Product;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class CheckOutController {

    @GetMapping("checkout-page")
    public String checkoutPage(HttpSession session, Model model) {
        @SuppressWarnings("unchecked")
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        double totalAmount = (double) session.getAttribute("totalAmount");

        model.addAttribute("cart", cart);
        model.addAttribute("totalAmount", totalAmount);

        return "guest/searchPage/checkout";
    }
}
