package com.group1.fmobile.controller.guest;

import com.group1.fmobile.domain.Product;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class CartController {
    @PostMapping("/checkout")
    public String checkout(HttpSession session, @RequestParam Map<String, String> formData) {
        List<Product> cart = new ArrayList<>();

        for (int i = 1; formData.containsKey("product_id_" + i); i++) {
            Product item = new Product();
            item.setId(Long.parseLong(formData.get("product_id_" + i)));
            item.setProductName(formData.get("product_name_" + i));
            item.setPrice(Double.parseDouble(formData.get("product_price_" + i)));
            item.setQuantity(Integer.parseInt(formData.get("quantity_" + i)));
            cart.add(item);
        }
        double totalAmount = Double.parseDouble(formData.get("total_amount"));
        session.setAttribute("cart", cart);
        session.setAttribute("totalAmount", totalAmount);

        return "redirect:/checkout-page";
    }
}
