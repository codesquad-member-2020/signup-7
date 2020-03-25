package com.example.group7;

import lombok.Generated;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.annotation.Id;

@Getter @Setter @ToString
public class User {

    @Id
    private Long id;

    private String userId;
    private String password;
    private String name;
    private String sex;
    private String email;
    private String phoneNumber;
    private String interest;
    private String dateOfBirth;

    public User() {

    }

    public User(String userId, String password, String name, String sex, String email, String phoneNumber, String interest, String dateOfBirth) {
        this.userId = userId;
        this.password = password;
        this.name = name;
        this.sex = sex;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.interest = interest;
        this.dateOfBirth = dateOfBirth;
    }
}
