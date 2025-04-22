package com.blooddono.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
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
				  "INSERT INTO donor (first_name, last_name, blood_group, dob, gender, email, contact, password) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
				                  
	    try (Connection conn = DbConfig.getDbConnection();
	         PreparedStatement stmt = conn.prepareStatement(insertSql)) {

	        // 1) Log that we have a live connection
	        System.out.println("🔗 Connected to DB: " + conn.getCatalog());

	        // 2) Bind parameters
	        stmt.setString(1, donor.getFirstName());
	        stmt.setString(2, donor.getLastName());
	        stmt.setString(3, donor.getBloodGroup());
	        stmt.setDate(4, Date.valueOf(donor.getDob()));
	        stmt.setString(5, donor.getGender());
	        stmt.setString(6, donor.getEmail());
	        stmt.setString(7, donor.getContact());
	        stmt.setString(8, donor.getPassword());

	        // 3) Log what we’re about to insert
	        System.out.printf("📝 Inserting: %s %s, %s, %s\n",
	          donor.getFirstName(), donor.getLastName(),
	          donor.getEmail(), donor.getContact());

	        // 4) Execute and log affected rows
	        int rows = stmt.executeUpdate();
	        System.out.println("✅ Rows inserted: " + rows);

	        return rows > 0;
	    } catch (Exception e) {
	        System.err.println("❌ Exception in addDonor: " + e.getMessage());
	        e.printStackTrace();
	        return null;
	    }
	}

}