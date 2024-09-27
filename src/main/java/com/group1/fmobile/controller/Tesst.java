package com.group1.fmobile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class Tesst {
    @PostMapping("error")
    public String getHome() {
        return "client/homepage/index";
    }
}
