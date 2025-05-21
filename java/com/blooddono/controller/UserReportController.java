package com.blooddono.controller;

import com.blooddono.config.DbConfig;
import com.blooddono.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

@WebServlet("/userReport")
public class UserReportController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<User> userList = new ArrayList<>();

        try (Connection conn = DbConfig.getDbConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM user")) {

            while (rs.next()) {
                User user = new User(
                        rs.getInt("userID"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("contact"),
                        rs.getString("email"),
                        rs.getDate("dateOfBirth").toLocalDate(),
                        rs.getString("gender"),
                        rs.getString("password"),
                        rs.getBytes("profile_pic"),
                        rs.getString("bloodGroup")
                );
                userList.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/pages/user_report.jsp");
        dispatcher.forward(request, response);
    }
}
