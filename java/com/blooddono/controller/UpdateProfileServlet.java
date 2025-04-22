package com.blooddono.controller;

import com.blooddono.model.User;
import com.blooddono.service.UserService;
import com.blooddono.util.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {
    private final UserService service = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        String email = session != null ? (String) session.getAttribute("userEmail") : null;

        if (email == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User u = service.fetchByEmail(email);

        u.setFirstName(req.getParameter("first_name"));
        u.setLastName(req.getParameter("last_name"));
        u.setBloodGroup(req.getParameter("blood_group"));
        u.setDob(LocalDate.parse(req.getParameter("dob")));
        u.setGender(req.getParameter("gender"));
        u.setContact(req.getParameter("contact"));

        String pw = req.getParameter("password");


        if (pw != null && !pw.isBlank()) {
            try {
                String encryptedPassword = PasswordUtil.encrypt(email, pw);
                u.setPassword(encryptedPassword);
            } catch (Exception e) {
                e.printStackTrace();
                resp.sendRedirect(req.getContextPath() + "/userProfile?update=failed");
                return;
            }
        }

        boolean ok = service.updateProfile(u);
        resp.sendRedirect(req.getContextPath() + "/userProfile?update=" + (ok ? "success" : "failed"));
    }
}