package com.blooddono.controller;

import com.blooddono.model.DonorModel;
import com.blooddono.model.User;
import com.blooddono.service.UserService;
import com.blooddono.util.UserToDonorMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/user-profile")
public class UserProfileServlet extends HttpServlet {
    private final UserService service = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        Object userObj = (session != null) ? session.getAttribute("user") : null;

        if (userObj == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        DonorModel donor;
        if (userObj instanceof User) {
            donor = UserToDonorMapper.map((User) userObj);
        } else if (userObj instanceof DonorModel) {
            donor = (DonorModel) userObj;
        } else {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        if ("true".equalsIgnoreCase(req.getParameter("pic"))) {
            byte[] img = service.fetchProfilePic(donor.getEmail());
            if (img != null) {
                resp.setContentType("image/jpeg");
                resp.setContentLength(img.length);
                try (OutputStream os = resp.getOutputStream()) {
                    os.write(img);
                }
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
            return;
        }

        // Get latest request status for display
        User fullUser = service.fetchByEmail(donor.getEmail());
        String latestStatus = service.getLatestRequestStatus(fullUser.getUserID());
        req.setAttribute("user", donor);
        req.setAttribute("requestStatus", latestStatus != null ? latestStatus : "No Requests");

        req.getRequestDispatcher("/WEB-INF/pages/userdashboard.jsp").forward(req, resp);
    }
}
