package com.blooddono.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.List;

import com.blooddono.config.DbConfig;
import com.blooddono.dao.BlogDao;
import com.blooddono.dao.CampaignDao;
import com.blooddono.dao.DonorDao;
import com.blooddono.model.DonorCampaignModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet("/adminDashboard")
public class adminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        System.out.println("GET Request received with action: " + action);

        if ("getUser".equals(action)) {
            String userIdParam = req.getParameter("userID");
            if (userIdParam == null || userIdParam.trim().isEmpty()) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user ID format.");
                return;
            }

            int userId;
            try {
                userId = Integer.parseInt(userIdParam.trim());
            } catch (NumberFormatException e) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user ID format.");
                return;
            }

            try (Connection conn = DbConfig.getDbConnection();
                 PreparedStatement stmt = conn.prepareStatement("SELECT * FROM user WHERE userID = ?")) {
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    resp.setContentType("application/json");
                    resp.setCharacterEncoding("UTF-8");
                    String json = String.format(
                            "{\"userID\":%d,\"firstName\":\"%s\",\"lastName\":\"%s\",\"email\":\"%s\",\"contact\":\"%s\",\"dateOfBirth\":\"%s\",\"gender\":\"%s\",\"bloodGroup\":\"%s\"}",
                            rs.getInt("userID"), rs.getString("firstName"), rs.getString("lastName"),
                            rs.getString("email"), rs.getString("contact"), rs.getDate("dateOfBirth").toString(),
                            rs.getString("gender"), rs.getString("bloodGroup"));
                    resp.getWriter().write(json);
                } else {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching user details.");
            }
        } else if ("viewDonors".equals(action)) {
            List<DonorCampaignModel> donorList = new DonorDao().getAllDonors();
            req.getSession().setAttribute("donorList", donorList); // Store donorList in session
            resp.sendRedirect("adminDashboard?action=viewDashboard"); // Redirect to adminDashboard controller
        } else if ("viewDashboard".equals(action)) {
            req.getRequestDispatcher("/WEB-INF/pages/admin.jsp").forward(req, resp); // Use admin.jsp
        } else {
            // Default action: Load dashboard
            req.getRequestDispatcher("/WEB-INF/pages/admin.jsp").forward(req, resp); // Use admin.jsp
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        System.out.println("POST action parameter: " + action);

        if ("deleteUser".equals(action)) {
            String userId = request.getParameter("userID");
            if (userId == null || userId.trim().isEmpty()) {
                response.getWriter().write("{\"status\":\"error\",\"message\":\"Invalid user ID.\"}");
                return;
            }
            try (Connection conn = DbConfig.getDbConnection();
                 PreparedStatement stmt = conn.prepareStatement("DELETE FROM user WHERE userID = ?")) {
                stmt.setInt(1, Integer.parseInt(userId));
                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    response.getWriter().write("{\"status\":\"success\",\"message\":\"User deleted successfully.\"}");
                } else {
                    response.getWriter().write("{\"status\":\"error\",\"message\":\"User not found or already deleted.\"}");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("{\"status\":\"error\",\"message\":\"Database error: " + e.getMessage() + "\"}");
            }
        } else if ("update".equals(action)) {
            String userID = request.getParameter("userID");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String gender = request.getParameter("gender");
            String bloodGroup = request.getParameter("bloodGroup");

            try (Connection conn = DbConfig.getDbConnection();
                 PreparedStatement stmt = conn.prepareStatement(
                         "UPDATE user SET firstName=?, lastName=?, email=?, contact=?, dateOfBirth=?, gender=?, bloodGroup=? WHERE userID=?")) {
                stmt.setString(1, firstName);
                stmt.setString(2, lastName);
                stmt.setString(3, email);
                stmt.setString(4, contact);
                stmt.setString(5, dateOfBirth);
                stmt.setString(6, gender);
                stmt.setString(7, bloodGroup);
                stmt.setInt(8, Integer.parseInt(userID));

                int rowsUpdated = stmt.executeUpdate();
                if (rowsUpdated > 0) {
                    response.sendRedirect("adminDashboard?action=viewDashboard");
                } else {
                    response.getWriter().write("{\"status\":\"error\",\"message\":\"User not found.\"}");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("{\"status\":\"error\",\"message\":\"Error updating user: " + e.getMessage() + "\"}");
            }
        } else if ("approveBlog".equals(action)) {
            int updatedRows = 0;
            try (Connection conn = DbConfig.getDbConnection()) {
                for (String key : request.getParameterMap().keySet()) {
                    if (key.startsWith("approval_")) {
                        int blogId = Integer.parseInt(key.substring(9));
                        String approvalStatus = request.getParameter(key);
                        String sql = "UPDATE blog SET admin_approval = ? WHERE id = ?";
                        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                            pstmt.setString(1, approvalStatus);
                            pstmt.setInt(2, blogId);
                            updatedRows += pstmt.executeUpdate();
                        }
                    }
                }
                response.getWriter().write(
                        "{\"status\":\"success\",\"message\":\"" + updatedRows + " record(s) updated.\"}");
            } catch (Exception e) {
                response.getWriter().write("{\"status\":\"error\",\"message\":\"Error updating blog approval: " + e.getMessage() + "\"}");
            }
        } else if ("addCampaign".equals(action)) {
            String name = request.getParameter("campaignName");
            String location = request.getParameter("campaignLocation");
            String date = request.getParameter("campaignDate");
            String details = request.getParameter("campaignDetails");
            Part imagePart = request.getPart("campaignImageFile");
            InputStream imageStream = null;

            try {
                if (imagePart != null && imagePart.getSize() > 0) {
                    imageStream = imagePart.getInputStream();
                }
                try (Connection conn = DbConfig.getDbConnection()) {
                    String sql = "INSERT INTO campaign (CampaignName, CampaignLocation, CampaignDate, CampaignDetails, CampaignImage) VALUES (?, ?, ?, ?, ?)";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                        stmt.setString(1, name);
                        stmt.setString(2, location);
                        stmt.setDate(3, java.sql.Date.valueOf(date));
                        stmt.setString(4, details);
                        if (imageStream != null) {
                            stmt.setBinaryStream(5, imageStream, imagePart.getSize());
                        } else {
                            stmt.setNull(5, java.sql.Types.BLOB);
                        }
                        int rowsInserted = stmt.executeUpdate();
                        if (rowsInserted > 0) {
                            response.sendRedirect("adminDashboard?action=viewDashboard");
                        } else {
                            response.getWriter().write("{\"status\":\"error\",\"message\":\"Failed to add campaign.\"}");
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("{\"status\":\"error\",\"message\":\"Database error: " + e.getMessage() + "\"}");
            }
        } else if ("deleteCampaign".equals(action)) {
            String campaignId = request.getParameter("campaignID");
            if (campaignId == null || campaignId.trim().isEmpty()) {
                response.getWriter().write("{\"status\":\"error\",\"message\":\"Invalid campaign ID.\"}");
                return;
            }
            try (Connection conn = DbConfig.getDbConnection();
                 PreparedStatement stmt = conn.prepareStatement("DELETE FROM campaign WHERE CampaignID = ?")) {
                stmt.setInt(1, Integer.parseInt(campaignId));
                int rows = stmt.executeUpdate();
                if (rows > 0) {
                    response.getWriter().write("{\"status\":\"success\",\"message\":\"Campaign deleted successfully.\"}");
                } else {
                    response.getWriter().write("{\"status\":\"error\",\"message\":\"Campaign not found or could not be deleted.\"}");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("{\"status\":\"error\",\"message\":\"Database error: " + e.getMessage() + "\"}");
            }
        } else if ("updateUnits".equals(action)) {
            String donorIdStr = request.getParameter("donorId");
            String unitsStr = request.getParameter("unitsDonated");
            try {
                int donorId = Integer.parseInt(donorIdStr);
                int units = Integer.parseInt(unitsStr);
                DonorDao donorDao = new DonorDao();
                boolean success = donorDao.updateUnitsDonated(donorId, units);
                if (success) {
                    response.sendRedirect("adminDashboard?action=viewDashboard");
                } else {
                    response.getWriter().write("{\"status\":\"error\",\"message\":\"Failed to update units donated.\"}");
                }
            } catch (NumberFormatException e) {
                response.getWriter().write("{\"status\":\"error\",\"message\":\"Invalid donor ID or units donated.\"}");
            } catch (Exception e) {
                response.getWriter().write("{\"status\":\"error\",\"message\":\"Error updating units donated: " + e.getMessage() + "\"}");
            }
        } else if ("updateCampaign".equals(action)) {
            String idStr = request.getParameter("id");
            String name = request.getParameter("name");
            String location = request.getParameter("location");
            String dateStr = request.getParameter("date");
            String details = request.getParameter("details");

            try {
                int campaignId = Integer.parseInt(idStr);
                CampaignDao campaignDao = new CampaignDao();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date date = sdf.parse(dateStr);
                boolean success = campaignDao.updateCampaign(campaignId, name, location, date, details);
                if (success) {
                    response.sendRedirect("adminDashboard?action=viewDashboard");
                } else {
                    response.getWriter().write("{\"status\":\"error\",\"message\":\"Failed to update campaign.\"}");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("{\"status\":\"error\",\"message\":\"Error updating campaign: " + e.getMessage() + "\"}");
            }
        } else if ("deleteBlog".equals(action)) {
            String idStr = request.getParameter("id");
            try {
                int blogId = Integer.parseInt(idStr);
                BlogDao blogDao = new BlogDao();
                boolean deleted = blogDao.deleteBlog(blogId);
                if (deleted) {
                    response.getWriter().write("{\"status\":\"success\",\"message\":\"Blog deleted successfully.\"}");
                } else {
                    response.getWriter().write("{\"status\":\"error\",\"message\":\"Blog not found or delete failed.\"}");
                }
            } catch (NumberFormatException e) {
                response.getWriter().write("{\"status\":\"error\",\"message\":\"Invalid Blog ID.\"}");
            }
        } else {
            response.getWriter().write("{\"status\":\"error\",\"message\":\"Unknown action: " + action + "\"}");
        }
    }
}