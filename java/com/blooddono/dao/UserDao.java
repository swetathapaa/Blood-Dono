package com.blooddono.dao;

import java.sql.*;
import com.blooddono.config.DbConfig;
import com.blooddono.model.User;

public class UserDao {

    public User getUserByEmail(String email) throws Exception {
        String sql = "SELECT * FROM user WHERE email = ?";
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getInt("userID"),
                            rs.getString("firstName"),
                            rs.getString("lastName"),
                            rs.getString("contact"),
                            rs.getString("email"),
                            rs.getDate("dateOfBirth").toLocalDate(),
                            rs.getString("gender"),
                            rs.getString("password"),
                            rs.getBytes("profile_pic"),
                            rs.getString("bloodGroup")
                    );
                }
            }
        }
        return null;
    }

    public boolean updateUser(User u) throws Exception {
        String sql = "UPDATE user SET firstName=?, lastName=?, contact=?, dateOfBirth=?, gender=?, password=?, profile_pic=?, bloodGroup=? WHERE email=?";
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getFirstName());
            ps.setString(2, u.getLastName());
            ps.setString(3, u.getContact());
            ps.setDate(4, Date.valueOf(u.getDob()));
            ps.setString(5, u.getGender());
            ps.setString(6, u.getPassword());
            ps.setBytes(7, u.getProfilePic());
            ps.setString(8, u.getBloodGroup());
            ps.setString(9, u.getEmail());
            return ps.executeUpdate() > 0;
        }
    }

    public byte[] getProfilePicByEmail(String email) throws Exception {
        String sql = "SELECT profile_pic FROM user WHERE email = ?";
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getBytes("profile_pic");
                }
            }
        }
        return null;
    }

    // 🔥 New method to fetch latest request status
    public String getLatestRequestStatus(int userId) throws Exception {
        String sql = "SELECT status FROM blood_request WHERE user_id = ? ORDER BY request_date DESC LIMIT 1";
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("status");
                }
            }
        }
        return null;
    }
}
