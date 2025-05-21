package com.blooddono.controller;

import com.blooddono.model.User;
import com.blooddono.model.DonorModel;
import com.blooddono.service.UserService;
import com.blooddono.util.PasswordUtil;
import com.blooddono.util.UserToDonorMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;

@WebServlet("/updateProfile")
@MultipartConfig(maxFileSize = 1024 * 1024 * 2)
public class UpdateProfileServlet extends HttpServlet {
    private final UserService service = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        String email = (session != null) ? (String) session.getAttribute("userEmail") : null;

        if (email == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User u = service.fetchByEmail(email);
        if (u == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Update user details
        u.setFirstName(req.getParameter("firstName"));
        u.setLastName(req.getParameter("lastName"));
        u.setBloodGroup(req.getParameter("bloodGroup"));
        u.setDob(LocalDate.parse(req.getParameter("dateOfBirth")));
        u.setGender(req.getParameter("gender"));
        u.setContact(req.getParameter("contact"));

        String currentPassword = req.getParameter("currentPassword");
        String newPassword = req.getParameter("password");
        if (newPassword != null && !newPassword.isBlank()) {
            if (currentPassword == null || !PasswordUtil.matches(u.getPassword(), currentPassword, email)) {
                DonorModel donor = UserToDonorMapper.map(u); // Map User to DonorModel
                req.setAttribute("error", "Incorrect current password. Please try again.");
                req.setAttribute("user", donor);
                req.getRequestDispatcher("/WEB-INF/pages/userdashboard.jsp").forward(req, resp);
                return;
            }

            u.setPassword(PasswordUtil.encrypt(email, newPassword));
        }

        Part profilePicPart = req.getPart("profile_pic");
        if (profilePicPart != null && profilePicPart.getSize() > 0) {
            try (InputStream is = profilePicPart.getInputStream()) {
                u.setProfilePic(is.readAllBytes());
            }
        }

        boolean success = service.updateProfile(u);
        if (success) {
            DonorModel donor = UserToDonorMapper.map(u); // Map User to DonorModel
            session.setAttribute("user", donor);
            resp.sendRedirect(req.getContextPath() + "/user-profile?update=success");
        } else {
            DonorModel donor = UserToDonorMapper.map(u); // Map User to DonorModel
            req.setAttribute("error", "Profile update failed. Please try again.");
            req.setAttribute("user", donor);
            req.getRequestDispatcher("/WEB-INF/pages/userdashboard.jsp").forward(req, resp);
        }
    }
}