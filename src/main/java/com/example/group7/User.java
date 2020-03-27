package com.example.group7;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.Id;

import javax.validation.constraints.NotNull;


@Getter @Setter @ToString
public class User {

    @Id
    private Long id;

    private String userId;
    private String password;
    private String name;
    private String gender;
    private String email;
    private String phoneNumber;
    private String interest;
    private String year;
    private String month;
    private String date;

    public User() {

    }

    public User(String userId, String password, String name, String gender, String email, String phoneNumber, String interest, String year, String month, String date) {
        this.userId = userId;
        this.password = password;
        this.name = name;
        this.gender = gender;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.interest = interest;
        this.year = year;
        this.month = month;
        this.date = date;
    }
}
