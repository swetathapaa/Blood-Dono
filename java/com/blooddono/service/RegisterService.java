package com.blooddono.service;

import java.sql.Connection;
import java.io.ByteArrayInputStream;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.blooddono.config.DbConfig;
import com.blooddono.model.DonorModel;

public class RegisterService {

    private Connection dbConn;

    public RegisterService() {
        try {
            this.dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public Boolean addDonor(DonorModel donor) {
        String insertSql =
            "INSERT INTO user (firstName, lastName, contact, email, dateOfBirth, gender, password, profile_pic, bloodGroup) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(insertSql)) {

            stmt.setString(1, donor.getFirstName());
            stmt.setString(2, donor.getLastName());
            stmt.setString(3, donor.getContact());
            stmt.setString(4, donor.getEmail());
            stmt.setDate(5, Date.valueOf(donor.getDob()));
            stmt.setString(6, donor.getGender());
            stmt.setString(7, donor.getPassword());
            stmt.setBlob(8, new ByteArrayInputStream(donor.getProfilePic()));
            stmt.setString(9, donor.getBloodGroup());

            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            System.err.println("❌ Exception in addDonor: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public boolean isEmailTaken(String email) {
        String query = "SELECT 1 FROM user WHERE email = ?";
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return false; // fail-safe: assume not taken
        }
    }
}
