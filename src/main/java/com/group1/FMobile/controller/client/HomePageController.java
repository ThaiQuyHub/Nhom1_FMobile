package com.group1.fmobile.controller.client;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomePageController {

    @GetMapping("/home")
    public String gethome(){
        return "client/homepage/index";

    }

    @GetMapping("/UserPage")
    public String getUserPage() {
        return "client/homepage/userpage";
    }
}
