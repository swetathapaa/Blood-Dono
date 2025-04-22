package com.blooddono.service;

import com.blooddono.model.DonorModel;

public interface DonorService {
    /**
     * Attempt to authenticate a donor by email+password.
     * @param email the donor’s email
     * @param password the plaintext password they submitted
     * @return a populated DonorModel if credentials match, or null otherwise
     */
    DonorModel authenticateDonor(String email, String password);
}