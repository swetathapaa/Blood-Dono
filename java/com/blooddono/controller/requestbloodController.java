package com.blooddono.controller;

import com.blooddono.config.DbConfig;
import com.blooddono.model.DonorModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/request-blood")
public class requestbloodController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/pages/requestBlood.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login");
            return;
        }

        // Cast to DonorModel instead of User
        DonorModel user = (DonorModel) session.getAttribute("user");

        // Form inputs
        String bloodGroup = req.getParameter("request_blood_group");
        String requiredByDate = req.getParameter("required_by_date");
        String medicalCondition = req.getParameter("hospital_reports");
        int unitRequired = Integer.parseInt(req.getParameter("unit_required"));

        try (Connection conn = DbConfig.getDbConnection()) {
            String sql = "INSERT INTO blood_requests (user_id, full_name, contact, blood_group, required_by_date, medical_condition, unit_required, status) VALUES (?, ?, ?, ?, ?, ?, ?, 'Pending')";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, user.getUserId());
            ps.setString(2, user.getFirstName() + " " + user.getLastName());
            ps.setString(3, user.getContact());
            ps.setString(4, bloodGroup);
            ps.setString(5, requiredByDate);
            ps.setString(6, medicalCondition);
            ps.setInt(7, unitRequired);

            ps.executeUpdate();
            req.setAttribute("successMessage", "✅ Blood request submitted successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("successMessage", " Failed to submit request.");
        }

        req.getRequestDispatcher("/WEB-INF/pages/requestBlood.jsp").forward(req, resp);
    }
}
