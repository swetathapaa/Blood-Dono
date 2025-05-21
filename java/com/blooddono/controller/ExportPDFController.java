package com.blooddono.controller;

import com.blooddono.config.DbConfig;

import com.blooddono.model.BloodRequest;
import com.lowagie.text.DocumentException;
import org.xhtmlrenderer.pdf.ITextRenderer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/exportPDF")
public class ExportPDFController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<BloodRequest> requests = new ArrayList<>();

        try (Connection conn = DbConfig.getDbConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM blood_request")) {

            while (rs.next()) {
                BloodRequest br = new BloodRequest();
                br.setRequestId(rs.getInt("request_id"));
                br.setUserId(rs.getInt("user_id"));
                br.setFullName(rs.getString("full_name"));
                br.setContact(rs.getString("contact"));
                br.setBloodGroup(rs.getString("blood_group"));
                br.setRequiredByDate(rs.getString("required_by_date"));
                br.setMedicalCondition(rs.getString("medical_condition"));
                br.setUnitRequired(rs.getInt("unit_required"));
                br.setStatus(rs.getString("status"));
                br.setRequestDate(rs.getString("request_date"));
                requests.add(br);
            }
        } catch (Exception e) {
            throw new ServletException("Database error", e);
        }

        // Build HTML content
        StringBuilder html = new StringBuilder();
        html.append("""
            <!DOCTYPE html>
            <html>
            <head>
                <style>
                    table { width: 100%; border-collapse: collapse; }
                    th, td { padding: 8px; border: 1px solid #000; font-size: 12px; }
                    th { background-color: #f33; color: white; }
                    h2 { text-align: center; }
                </style>
            </head>
            <body>
                <h2>Blood Request Report</h2>
                <table>
                    <tr>
                        <th>Request ID</th>
                        <th>User ID</th>
                        <th>Full Name</th>
                        <th>Contact</th>
                        <th>Blood Group</th>
                        <th>Required By</th>
                        <th>Medical Condition</th>
                        <th>Units Required</th>
                        <th>Status</th>
                        <th>Request Date</th>
                    </tr>
        """);

        for (BloodRequest br : requests) {
            html.append("<tr>")
                .append("<td>").append(br.getRequestId()).append("</td>")
                .append("<td>").append(br.getUserId()).append("</td>")
                .append("<td>").append(br.getFullName()).append("</td>")
                .append("<td>").append(br.getContact()).append("</td>")
                .append("<td>").append(br.getBloodGroup()).append("</td>")
                .append("<td>").append(br.getRequiredByDate()).append("</td>")
                .append("<td>").append(br.getMedicalCondition()).append("</td>")
                .append("<td>").append(br.getUnitRequired()).append("</td>")
                .append("<td>").append(br.getStatus()).append("</td>")
                .append("<td>").append(br.getRequestDate()).append("</td>")
                .append("</tr>");
        }

        html.append("""
                </table>
            </body>
            </html>
        """);

        // Generate PDF from HTML
        try {
            ITextRenderer renderer = new ITextRenderer();
            renderer.setDocumentFromString(html.toString());
            renderer.layout();

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=BloodRequestReport.pdf");

            OutputStream os = response.getOutputStream();
            renderer.createPDF(os);
            os.close();
        } catch (DocumentException e) {
            throw new ServletException("PDF generation error", e);
        }
    }
}
