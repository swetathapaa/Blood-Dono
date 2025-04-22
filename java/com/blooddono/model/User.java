package com.blooddono.model;

import java.time.LocalDate;

public class User {
    private int id;
    private String firstName;
    private String lastName;
    private String bloodGroup;
    private LocalDate dob;
    private String gender;
    private String email;
    private String contact;
    private String password;

    public User() { }

    public User(int id, String firstName, String lastName, String bloodGroup,
                LocalDate dob, String gender, String email, String contact, String password) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.bloodGroup = bloodGroup;
        this.dob = dob;
        this.gender = gender;
        this.email = email;
        this.contact = contact;
        this.password = password;
    }

	public int getId() {
		return id;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getBloodGroup() {
		return bloodGroup;
	}

	public LocalDate getDob() {
		return dob;
	}

	public String getGender() {
		return gender;
	}

	public String getEmail() {
		return email;
	}

	public String getContact() {
		return contact;
	}

	public String getPassword() {
		return password;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public void setDob(LocalDate dob) {
		this.dob = dob;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public void setPassword(String password) {
		this.password = password;
	}
    


}