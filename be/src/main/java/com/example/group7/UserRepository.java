package com.example.group7;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserRepository {
    @Autowired
    JdbcTemplate jdbcTemplate;

    ///회원 추가
    public int insert(User user) {
        return jdbcTemplate.update("insert into user (userId, name, password, sex, email, phoneNumber, interest, dateOfBirth) " + "values(?, ?, ?, ?, ?, ?, ?, ?)",
                new Object[] {
                        user.getUserId(), user.getName(), user.getPassword(), user.getSex(), user.getEmail(), user.getPhoneNumber(), user.getInterest(),user.getDateOfBirth()
                });
    }

//
//    public List< User > findAll() {
//        return jdbcTemplate.query("select * from user", new UserRowMapper());
//    }
//
    public User findById(long id) {
        return jdbcTemplate.queryForObject("select * from user where id=?", new Object[] {
                        id
                },
                new BeanPropertyRowMapper< User >(User.class));
    }

    public User findByUserId(String userId) {

        String sql = "SELECT * FROM USER WHERE USERID = ?";
            User foundUser = (User)jdbcTemplate.queryForObject(sql, new Object[]{userId}, new BeanPropertyRowMapper(User.class));
            return foundUser;
    }

    /// 회원 아이디 존재 여부
    public boolean isUserExists(String userId) {
        String sql = "SELECT count(*) FROM USER WHERE USERID = ?";
        boolean result = false;
        int count = jdbcTemplate.queryForObject(sql, new Object[] { userId }, Integer.class);
        if (count > 0) {
            result = true;
        }
        return result;
    }

//
//    //회원 삭
//    public int deleteById(long id) {
//        return jdbcTemplate.update("delete from user where id=?", new Object[] {
//                id
//        });
//    }
//
//
//    public int update(User user) {
//        return jdbcTemplate.update("update student " + " set name = ?, passport_number = ? " + " where id = ?",
//                new Object[] {
//                        student.getName(), student.getPassportNumber(), student.getId()
//                });
//    }
}
