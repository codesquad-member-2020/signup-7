package com.example.group7;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    ///로그인
    @GetMapping("/login")
    public String login() {
        return "login";
    }

}
