package com.blooddono.controller;

import com.blooddono.model.DonorModel;
import com.blooddono.service.DonorService;
import com.blooddono.service.DonorServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private final DonorService donorService = new DonorServiceImpl();  // Use the correct service

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Display the login form
        req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Debug: Check if the email and password are being passed correctly
        System.out.println("Login attempt with email: " + email + " and password: " + password);

        // Authenticate the donor
        DonorModel donor = donorService.authenticateDonor(email, password);

        // Debug: Check if the donor object is returned
        if (donor != null) {
            System.out.println("Donor authenticated: " + donor.getFirstName() + " " + donor.getLastName());

            HttpSession session = req.getSession(true);
            session.setAttribute("user", donor);  // Store the authenticated user in the session
            session.setAttribute("userEmail", donor.getEmail());
            session.setAttribute("userId", donor.getUserId());  // Store the userId in the session
            session.setMaxInactiveInterval(15 * 60); // 15 minutes session timeout

            // Debug: Check if the userId is stored correctly in session
            System.out.println("User ID stored in session: " + donor.getUserId());

            // Role-based redirection
            if ("admin".equalsIgnoreCase(donor.getRole())) {
                req.getRequestDispatcher("/WEB-INF/pages/admin.jsp").forward(req, resp);
            } else {
                req.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(req, resp);
            }
        } else {
            System.out.println("Invalid credentials for email: " + email);  // Debugging line for invalid login

            req.setAttribute("errorMessage", "Invalid email or password");
            req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
        }
    }
}
