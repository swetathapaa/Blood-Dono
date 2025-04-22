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

    private final DonorService donorService = new DonorServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Show the login form
        req.getRequestDispatcher("/WEB-INF/pages/login.jsp")
           .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String email    = req.getParameter("email");
        String password = req.getParameter("password");

        DonorModel donor = donorService.authenticateDonor(email, password);

        if (donor != null) {
            HttpSession session = req.getSession(true);
            session.setAttribute("user", donor);
            session.setMaxInactiveInterval(15 * 60);  // 15‑minute timeout
            resp.sendRedirect(req.getContextPath() + "/user-profile");
        } else {
            req.setAttribute("errorMessage", "Invalid email or password");
            // Forward back to the same JSP
            req.getRequestDispatcher("/WEB-INF/pages/login.jsp")
               .forward(req, resp);
        }
    }
}