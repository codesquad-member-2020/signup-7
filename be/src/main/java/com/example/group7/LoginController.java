package com.example.group7;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.HttpServerErrorException;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    JdbcTemplate jdbcTemplate;


    @GetMapping("/login")
    public String login(HttpSession session) {
        return "login";
    }

    @PostMapping("/login")
    public String login(String userId, String password, HttpSession session) {
        try {
            User user = userRepository.findByUserId(userId);
        }catch (EmptyResultDataAccessException e){
            System.out.println("없음없음");
            return "redirect:/login";
        }
        User user = userRepository.findByUserId(userId);
        if(!user.getPassword().equals(password)) {
            System.out.println("비밀번호 틀림틀림");
            return "redirect:/login";
        }
        System.out.println("로그인 성공성공");
        return "redirect:/login";
    }
}
