package com.example.group7;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import org.springframework.http.HttpStatus;
import java.time.LocalDateTime;
@Getter
public class ApiResponseMessage {
    private HttpStatus status;
    private Object message;
    private int statusCode;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
    private LocalDateTime timestamp;
    private ApiResponseMessage() {
        timestamp = LocalDateTime.now();
    }
    public ApiResponseMessage(HttpStatus status, String message, int statusCode) {
        this();
        this.status = status;
        this.message = message;
        this.statusCode = statusCode;
    }
    public ApiResponseMessage(HttpStatus status, User user, int statusCode) {
        this();
        this.status = status;
        this.message = user;
        this.statusCode = statusCode;
    }
}