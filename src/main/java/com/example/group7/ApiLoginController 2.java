package com.example.group7;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpSession;


@RestController
public class ApiLoginController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    JdbcTemplate jdbcTemplate;
    ///로그인
    @PostMapping("/login")
    @ResponseBody
    public ResponseEntity<ApiResponseMessage> login(String userId, String password, HttpSession session) {
        try {
            User user = userRepository.findByUserId(userId);
        } catch (EmptyResultDataAccessException e) {
            System.out.println("user doesn't exist");
            return new ResponseEntity<>(new ApiResponseMessage(HttpStatus.NOT_FOUND, "USER DOES NOT EXIST",404), HttpStatus.NOT_FOUND);
        }
        User user = userRepository.findByUserId(userId);
        if (!password.equals(user.getPassword())) {
            System.out.println("login failure");
            return new ResponseEntity<>(new ApiResponseMessage(HttpStatus.NOT_FOUND, "ID OR PASSWORD DOES NOT MATCH",404), HttpStatus.NOT_FOUND);
        }
        System.out.println("password and id match");
        session.setAttribute("user", user);
        return new ResponseEntity<>(new ApiResponseMessage(HttpStatus.OK, user,200), HttpStatus.OK);
    }
}