package com.blooddono.controller;

import com.blooddono.model.DonorModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/user-profile")
public class UserProfileServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
          throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    if (session == null || session.getAttribute("user") == null) {
      resp.sendRedirect(req.getContextPath() + "/login");
      return;
    }
    req.getRequestDispatcher("/WEB-INF/pages/userProfile.jsp")
       .forward(req, resp);
  }
}