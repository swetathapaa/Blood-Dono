package com.blooddono.model;

import java.time.LocalDate;

public class DonorModel {
	private int userId;
    private String firstName;
    private String lastName;
    private String bloodGroup;
    private LocalDate dateOfBirth;
    private String gender;
    private String email;
    private String contact;
    private String password;
    private byte[] profilePic;
    private String role; // Add role field

    // Constructor with role
    public DonorModel(String firstName, String lastName, String bloodGroup, LocalDate dob, String gender, String email, String contact, String password, byte[] profilePic, String role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.bloodGroup = bloodGroup;
        this.dateOfBirth = dob;
        this.gender = gender;
        this.email = email;
        this.contact = contact;
        this.password = password;
        this.profilePic = profilePic;
        this.role = role != null ? role : "user"; // Default to "user" if role is null
    }

    // Constructor without role
    public DonorModel(String firstName, String lastName, String bloodGroup, LocalDate dob, String gender, String email, String contact, String password, byte[] profilePic) {
        this(firstName, lastName, bloodGroup, dob, gender, email, contact, password, profilePic, "user"); // Default role to "user"
    }

    // Getters and setters
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public LocalDate getDob() {
        return dateOfBirth;
    }

    public void setDob(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
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

    public byte[] getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(byte[] profilePic) {
        this.profilePic = profilePic;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

}