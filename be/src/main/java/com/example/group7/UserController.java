package com.example.group7;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    @Autowired
    UserRepository userRepository;

    ///회원가입
    @PostMapping("/register")
    public String register(User user) {
        userRepository.insert(user);
        System.out.println("user trying to register : " + user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

}


//    int result = jdbcTemplate.queryForObject(
//            "SELECT COUNT(*) FROM EMPLOYEE", Integer.class);