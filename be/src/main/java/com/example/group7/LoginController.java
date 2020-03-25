package com.example.group7;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    JdbcTemplate jdbcTemplate;

    @PostMapping("/login")
    public String login(String userId, String password, HttpSession session) {
        User user = userRepository.findByUserId(userId);
        System.out.println("---------------------------------" + user);
        if (user == null) {
            System.out.println("no user exist");
        }
        session.setAttribute("logged in user", user);
        System.out.println("user " + user.getName() + " signed in!");
        return "redirect:/login";
    }
}
