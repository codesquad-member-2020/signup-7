package com.example.group7;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class ApiUserController {

    @Autowired
    UserRepository userRepository;

    ///회원가입
    @PostMapping("/register")
    public ResponseEntity<ApiResponseMessage> createUser(User user) {

        ///아이디 중복 체크
        if (userRepository.isUserExists(user.getUserId())) {
            return new ResponseEntity<>(new ApiResponseMessage(HttpStatus.BAD_REQUEST, "ID ALREADY IN USE"), HttpStatus.BAD_REQUEST);
        }

        if (userRepository.isNumberExists(user.getPhoneNumber())) {
            return new ResponseEntity<>(new ApiResponseMessage(HttpStatus.BAD_REQUEST, "PHONE NUMBER ALREADY IN USE"), HttpStatus.BAD_REQUEST);
        }

        if (userRepository.isEmailExists(user.getEmail())) {
            return new ResponseEntity<>(new ApiResponseMessage(HttpStatus.BAD_REQUEST, "EMAIL ALREADY IN USE"), HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(new ApiResponseMessage(HttpStatus.OK, "REGISTERED SUCCESSFULLY"), HttpStatus.OK);
    }

    ///아이디 중복검사
    @GetMapping("/validate/id")
    public ResponseEntity<ApiResponseMessage> isValidateId(String userId) {

        if (!userRepository.isUserExists(userId)) {
            System.out.println("user id : " + userId);
            System.out.println(userRepository.isUserExists(userId));
            return new ResponseEntity<>(new ApiResponseMessage(HttpStatus.OK, "ID AVAILABLE"), HttpStatus.OK);
        }
        return new ResponseEntity<>(new ApiResponseMessage(HttpStatus.BAD_REQUEST, "ID ALREADY IN USE"), HttpStatus.BAD_REQUEST);
    }

    ///핸드폰 번호 중복검사
    @GetMapping("/validate/phoneNumber")
    public ResponseEntity<ApiResponseMessage> isValidateNumber(String phoneNumber) {

        if (!userRepository.isNumberExists(phoneNumber)) {
            System.out.println("phone number : " + phoneNumber);
            return new ResponseEntity<>(new ApiResponseMessage(HttpStatus.OK, "PHONE NUMBER AVAILABLE"), HttpStatus.OK);
        }
        return new ResponseEntity<>(new ApiResponseMessage(HttpStatus.BAD_REQUEST, "PHONE NUMBER ALREADY IN USE"), HttpStatus.BAD_REQUEST);
    }

    ///이메일 중복검사
    @GetMapping("/validate/email")
    public ResponseEntity<ApiResponseMessage> isValidateEmail(String email) {

        if (!userRepository.isEmailExists(email)) {
            System.out.println("user email : " + email);
            return new ResponseEntity<>(new ApiResponseMessage(HttpStatus.OK, "EMAIL AVAILABLE"), HttpStatus.OK);
        }
        return new ResponseEntity<>(new ApiResponseMessage(HttpStatus.BAD_REQUEST, "EMAIL ALREADY IN USE"), HttpStatus.BAD_REQUEST);
    }


}
