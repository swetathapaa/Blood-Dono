package com.blooddono.service;

import com.blooddono.config.DbConfig;
import com.blooddono.model.DonorModel;
import com.blooddono.util.PasswordUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DonorServiceImpl implements DonorService {

    @Override
    public DonorModel authenticateDonor(String email, String password) {
        DonorModel donor = null;
        String sql = "SELECT * FROM donor WHERE email = ?";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String encrypted = rs.getString("password");
                    String decrypted = PasswordUtil.decrypt(encrypted, email);

                    if (decrypted != null && decrypted.equals(password)) {
                        donor = new DonorModel(
                            rs.getString("first_name"),
                            rs.getString("last_name"),
                            rs.getString("blood_group"),
                            rs.getDate("dob").toLocalDate(),
                            rs.getString("gender"),
                            rs.getString("email"),
                            rs.getString("contact"),
                            encrypted
                        );
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return donor;
    }
}