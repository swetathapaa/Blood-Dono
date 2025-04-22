package com.blooddono.model;

import java.time.LocalDate;

public class DonorModel {
	private String first_Name;
	private String last_Name;
	private String blood_Group;
	private LocalDate dob;
	private String gender;
	private String email;
	private String contact;
	private String password;

	
	
	public DonorModel(String first_Name, String last_Name, String blood_Group, LocalDate dob, String gender, String email,
			String contact, String password) {
		this.first_Name = first_Name;
		this.last_Name = last_Name;
		this.blood_Group = blood_Group;
		this.dob = dob;
		this.gender = gender;
		this.email = email;
		this.contact = contact;
		this.password = password;
	}



	public String getFirstName() {
		return first_Name;
	}



	public void setFirstName(String firstName) {
		this.first_Name = firstName;
	}



	public String getLastName() {
		return last_Name;
	}



	public void setLastName(String lastName) {
		this.last_Name = lastName;
	}



	public String getBloodGroup() {
		return blood_Group;
	}



	public void setBloodGroup(String bloodGroup) {
		this.blood_Group = bloodGroup;
	}



	public LocalDate getDob() {
		return dob;
	}



	public void setDob(LocalDate dob) {
		this.dob = dob;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getContact() {
		return contact;
	}



	public void setContact(String contact) {
		this.contact = contact;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}

	
}