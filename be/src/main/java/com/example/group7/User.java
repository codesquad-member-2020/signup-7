package com.example.group7;

import com.fasterxml.jackson.annotation.JsonProperty;
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

    @JsonProperty
    private String userId;
    @JsonProperty
    private String password;
    @JsonProperty
    private String name;
    @JsonProperty
    private String sex;
    @JsonProperty
    private String email;
    @JsonProperty
    private String phoneNumber;
    @JsonProperty
    private String interest;
    @JsonProperty
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
