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
<<<<<<< HEAD

    @GetMapping("/UserPage")
    public String getUserPage() {
        return "client/homepage/userpage";
    }
=======
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
}
