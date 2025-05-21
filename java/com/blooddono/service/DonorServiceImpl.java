package com.blooddono.service;

import com.blooddono.config.DbConfig;
import com.blooddono.model.DonorModel;
import com.blooddono.util.PasswordUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DonorServiceImpl implements DonorService {

    public DonorModel authenticateDonor(String email, String password) {
        DonorModel donor = null;
        String sql = "SELECT userID, firstName, lastName, bloodGroup, dateOfBirth, gender, email, contact, password, profile_pic, role FROM user WHERE email = ?";  // Updated 'userID'

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String encrypted = rs.getString("password");  // Assuming 'password' column name
                    String decrypted = PasswordUtil.decrypt(encrypted, email);  // Decrypt using email as a key

                    if (decrypted != null && decrypted.equals(password)) {
                        byte[] profilePic = rs.getBytes("profile_pic");  // Assuming 'profile_pic' column name
                        String role = rs.getString("role");  // Assuming 'role' column is present in the table
                        int userId = rs.getInt("userID");  // Fetch the userID with the correct column name

                        donor = new DonorModel(
                            rs.getString("firstName"),
                            rs.getString("lastName"),
                            rs.getString("bloodGroup"),
                            rs.getDate("dateOfBirth").toLocalDate(),
                            rs.getString("gender"),
                            rs.getString("email"),
                            rs.getString("contact"),
                            decrypted,  // Use the decrypted password
                            profilePic,
                            role
                        );
                        donor.setUserId(userId);  // Set the userID here
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return donor;
    }
}
