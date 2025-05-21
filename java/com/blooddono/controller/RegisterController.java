package com.blooddono.controller;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;

import com.blooddono.model.DonorModel;
import com.blooddono.service.RegisterService;
import com.blooddono.util.PasswordUtil;
import com.blooddono.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final RegisterService registerService = new RegisterService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String validationMessage = validateRegistrationForm(req);
            if (validationMessage != null) {
                handleError(req, resp, validationMessage);
                return;
            }

            String email = req.getParameter("email");
            if (registerService.isEmailTaken(email)) {
                handleError(req, resp, "This email is already registered.");
                return;
            }

            DonorModel donorModel = extractDonorModel(req);
            Boolean isAdded = registerService.addDonor(donorModel);

            if (isAdded == null) {
                handleError(req, resp, "Our server is under maintenance. Please try again later!");
            } else if (isAdded) {
                handleSuccess(req, resp, "You have been successfully registered!", "/WEB-INF/pages/login.jsp");
            } else {
                handleError(req, resp, "Registration failed. Please try again later!");
            }
        } catch (Exception e) {
            handleError(req, resp, "Unexpected error occurred. Please try again later.");
            e.printStackTrace();
        }
    }

    private String validateRegistrationForm(HttpServletRequest req) {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String bloodGroup = req.getParameter("bloodGroup");
        String dobStr = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String contact = req.getParameter("contact");
        String password = req.getParameter("password");
        String retypePassword = req.getParameter("retypePassword");

        if (ValidationUtil.isNullOrEmpty(firstName)) return "First name is required.";
        if (ValidationUtil.isNullOrEmpty(lastName)) return "Last name is required.";
        if (ValidationUtil.isNullOrEmpty(bloodGroup)) return "Blood group is required.";
        if (ValidationUtil.isNullOrEmpty(dobStr)) return "Date of birth is required.";
        if (ValidationUtil.isNullOrEmpty(gender)) return "Gender is required.";
        if (ValidationUtil.isNullOrEmpty(email)) return "Email is required.";
        if (ValidationUtil.isNullOrEmpty(contact)) return "Contact number is required.";
        if (ValidationUtil.isNullOrEmpty(password)) return "Password is required.";
        if (ValidationUtil.isNullOrEmpty(retypePassword)) return "Please retype the password.";

        try {
            LocalDate dob = LocalDate.parse(dobStr);
            if (!ValidationUtil.isAgeAtLeast16(dob)) return "You must be at least 16 years old to register.";
        } catch (Exception e) {
            return "Invalid date format. Please use YYYY-MM-DD.";
        }

        if (!ValidationUtil.isValidEmail(email)) return "Invalid email format.";
        if (!ValidationUtil.isValidPhoneNumber(contact)) return "Phone number must be 10 digits and start with 9.";
        if (!ValidationUtil.isValidPassword(password)) return "Password must be at least 8 characters long with uppercase, number, and symbol.";
        if (!ValidationUtil.doPasswordsMatch(password, retypePassword)) return "Passwords do not match.";

        return null;
    }

    private DonorModel extractDonorModel(HttpServletRequest req) throws Exception {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String bloodGroup = req.getParameter("bloodGroup");
        LocalDate dob = LocalDate.parse(req.getParameter("dob"));
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String contact = req.getParameter("contact");
        String password = PasswordUtil.encrypt(email, req.getParameter("password"));

        Part profilePicPart = req.getPart("profilePic");
        byte[] profilePicBytes = null;
        if (profilePicPart != null) {
            profilePicBytes = profilePicPart.getInputStream().readAllBytes();
        }

        return new DonorModel(firstName, lastName, bloodGroup, dob, gender, email, contact, password, profilePicBytes);
    }

    private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message, String page)
            throws ServletException, IOException {
        req.setAttribute("success", message);
        req.getRequestDispatcher(page).forward(req, resp);
    }

    private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
            throws ServletException, IOException {
        req.setAttribute("error", message);
        req.setAttribute("firstName", req.getParameter("firstName"));
        req.setAttribute("lastName", req.getParameter("lastName"));
        req.setAttribute("bloodGroup", req.getParameter("bloodGroup"));
        req.setAttribute("dob", req.getParameter("dob"));
        req.setAttribute("gender", req.getParameter("gender"));
        req.setAttribute("email", req.getParameter("email"));
        req.setAttribute("contact", req.getParameter("contact"));
        req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, resp);
    }
}
