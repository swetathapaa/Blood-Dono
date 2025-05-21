package com.blooddono.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import com.blooddono.model.BloodRequest;
import com.blooddono.config.DbConfig;

@WebServlet("/reportController")
public class ReportController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<BloodRequest> bloodRequests = new ArrayList<>();

        try (Connection conn = DbConfig.getDbConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM blood_request")) {

            while (rs.next()) {
                BloodRequest req = new BloodRequest();
                req.setRequestId(rs.getInt("request_id"));
                req.setUserId(rs.getInt("user_id"));
                req.setFullName(rs.getString("full_name"));
                req.setContact(rs.getString("contact"));
                req.setBloodGroup(rs.getString("blood_group"));
                req.setRequiredByDate(rs.getString("required_by_date"));
                req.setMedicalCondition(rs.getString("medical_condition"));
                req.setUnitRequired(rs.getInt("unit_required"));
                req.setStatus(rs.getString("status"));
                req.setRequestDate(rs.getString("request_date"));
                bloodRequests.add(req);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("bloodRequests", bloodRequests);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/pages/report.jsp");
        dispatcher.forward(request, response);
    }
}
