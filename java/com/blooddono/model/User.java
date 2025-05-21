package com.blooddono.model;

import java.time.LocalDate;

public class User {
    private int userID;
    private String firstName;
    private String lastName;
    private String contact;
    private String email;
    private LocalDate dateOfBirth;
    private String gender;
    private String password;
    private byte[] profilePic;
    private String bloodGroup;

    // Constructor to initialize the User object
    public User(int userID, String firstName, String lastName, String contact, String email,
                LocalDate dateOfBirth, String gender, String password, byte[] profilePic, String bloodGroup) {
        this.userID = userID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.contact = contact;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.password = password;
        this.profilePic = profilePic;
        this.bloodGroup = bloodGroup;
    }

    // Getters and Setters (Optional, but useful for accessing the properties)
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

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

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }
}
