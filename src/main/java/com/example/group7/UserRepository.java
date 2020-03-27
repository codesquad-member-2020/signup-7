package com.example.group7;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepository {
    @Autowired
    JdbcTemplate jdbcTemplate;

    ///회원 추가
    public int insert(User user) {
        return jdbcTemplate.update("insert into user (userId, name, password, gender, email, phoneNumber, interest, year, month, date) " + "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                new Object[]{
                        user.getUserId(), user.getName(), user.getPassword(), user.getGender(), user.getEmail(), user.getPhoneNumber(), user.getInterest(), user.getYear(), user.getMonth(), user.getDate()
                });
    }

    ///유저 이름으로 유저 찾기
    public User findByUserId(String userId) {

        String sql = "SELECT * FROM USER WHERE USERID = ?";
        User foundUser = (User) jdbcTemplate.queryForObject(sql, new Object[]{userId}, new BeanPropertyRowMapper(User.class));
        return foundUser;
    }

    /// 회원 아이디 존재 여부 검사
    public boolean isUserExists(String userId) {
        String sql = "SELECT count(*) FROM USER WHERE USERID = ?";
        boolean result = false;
        int count = jdbcTemplate.queryForObject(sql, new Object[]{userId}, Integer.class);
        if (count > 0) {
            result = true;
        }
        return result;
    }

    ///핸드폰 번호 존재 여부 검사
    public boolean isNumberExists(String phoneNumber) {
        String sql = "SELECT count(*) FROM USER WHERE PHONENUMBER = ?";
        boolean result = false;
        int count = jdbcTemplate.queryForObject(sql, new Object[]{phoneNumber}, Integer.class);
        if (count > 0) {
            result = true;
        }
        return result;
    }

    ///이메일 존재 여부 검사
    public boolean isEmailExists(String email) {
        String sql = "SELECT count(*) FROM USER WHERE EMAIL = ?";
        boolean result = false;
        int count = jdbcTemplate.queryForObject(sql, new Object[]{email}, Integer.class);
        if (count > 0) {
            result = true;
        }
        return result;
    }
}
