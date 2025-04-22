package com.blooddono.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.blooddono.config.DbConfig;
import com.blooddono.model.User;

public class UserDao {

    public User getUserByEmail(String email) throws Exception {
        String sql = "SELECT * FROM donor WHERE email = ?";
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new User(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("blood_group"),
                        rs.getDate("dob").toLocalDate(),
                        rs.getString("gender"),
                        rs.getString("email"),
                        rs.getString("contact"),
                        rs.getString("password")
                    );
                }
            }
        }
        return null;
    }

    public boolean updateUser(User u) throws Exception {
        String sql = "UPDATE donor SET first_name = ?, last_name = ?, blood_group = ?, dob = ?, " +
                     "gender = ?, contact = ?, password = ? WHERE email = ?";
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getFirstName());
            ps.setString(2, u.getLastName());
            ps.setString(3, u.getBloodGroup());
            ps.setDate(4, Date.valueOf(u.getDob()));
            ps.setString(5, u.getGender());
            ps.setString(6, u.getContact());
            ps.setString(7, u.getPassword());
            ps.setString(8, u.getEmail());
            return ps.executeUpdate() > 0;
        }
    }
}