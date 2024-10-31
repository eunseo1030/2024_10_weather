package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrHomeController {

    @RequestMapping("/usr/home/main")
    public String showMain() {
        return "usr/home/main";  // main.jsp 페이지를 반환
    }
}

