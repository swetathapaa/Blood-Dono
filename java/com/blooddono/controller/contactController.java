package com.blooddono.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.blooddono.config.DbConfig;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(asyncSupported = true, urlPatterns = {"/contact"})
public class contactController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String success = req.getParameter("success");
        if ("true".equals(success)) {
            req.setAttribute("successMessage", "We have received your message. We will contact you within 24 hours.");
        }

        req.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String bloodType = req.getParameter("blood-type");
        String message = req.getParameter("message");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            //DbConfig to get database connection
            conn = DbConfig.getDbConnection();

            String sql = "INSERT INTO contact (name, phone, email, bloodType, message) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, phone);
            stmt.setString(3, email);
            stmt.setString(4, bloodType);
            stmt.setString(5, message);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                resp.setHeader("Pragma", "no-cache");
                resp.setDateHeader("Expires", 0);
                resp.sendRedirect("contact?success=true");
            } else {
                resp.setContentType("text/html");
                resp.getWriter().println("<script type='text/javascript'>");
                resp.getWriter().println("alert('Failed to save your message. Please try again.');");
                resp.getWriter().println("window.location.href = 'contact';");
                resp.getWriter().println("</script>");
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            resp.setContentType("text/html");
            resp.getWriter().println("<script type='text/javascript'>");
            resp.getWriter().println("alert('Error occurred while saving your message. Please try again later.');");
            resp.getWriter().println("window.location.href = 'contact';");
            resp.getWriter().println("</script>");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}