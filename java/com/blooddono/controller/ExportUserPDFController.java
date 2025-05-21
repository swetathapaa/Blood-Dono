package com.blooddono.controller;

import com.blooddono.config.DbConfig;
import com.blooddono.model.User;
import com.lowagie.text.DocumentException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.xhtmlrenderer.pdf.ITextRenderer;

import java.io.*;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

@WebServlet("/exportUserPDF")
public class ExportUserPDFController extends HttpServlet {
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

        // Render JSP as HTML
        String html = renderHtml(request, response, "/WEB-INF/pages/user_report_pdf.jsp");

        // Generate PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=user_report.pdf");

        try (OutputStream os = response.getOutputStream()) {
            ITextRenderer renderer = new ITextRenderer();
            renderer.setDocumentFromString(html);
            renderer.layout();
            renderer.createPDF(os);
        } catch (DocumentException e) {
            throw new ServletException(e);
        }
    }

    private String renderHtml(HttpServletRequest request, HttpServletResponse response, String jspPath)
            throws ServletException, IOException {
        StringWriter sw = new StringWriter();
        RequestDispatcher rd = request.getRequestDispatcher(jspPath);
        HttpServletResponseWrapper responseWrapper = new HttpServletResponseWrapper(response) {
            private final PrintWriter writer = new PrintWriter(sw);
            public PrintWriter getWriter() {
                return writer;
            }
        };
        rd.include(request, responseWrapper);
        return sw.toString();
    }
}
