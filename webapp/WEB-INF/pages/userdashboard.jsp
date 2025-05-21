<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.blooddono.model.DonorModel" %>

<%
    DonorModel user = (DonorModel) request.getAttribute("user");
    String requestStatus = (String) request.getAttribute("requestStatus");

    if (user == null || !"user".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }

    String errorMessage = (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>User Profile - Blood Donor</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/dashboard.css" />
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const errorMessage = document.querySelector('.error-message');
            if (errorMessage) {
                document.querySelector('input[name="currentPassword"]').value = '';
                document.querySelector('input[name="password"]').value = '';
                document.querySelector('input[name="retypePassword"]').value = '';
            }
        });

        function validateForm() {
            const currentPassword = document.querySelector('input[name="currentPassword"]').value;
            const newPassword = document.querySelector('input[name="password"]').value;
            const confirmPassword = document.querySelector('input[name="retypePassword"]').value;

            if (newPassword && !currentPassword) {
                alert("Please enter your current password to change it.");
                return false;
            }
            if (newPassword && newPassword !== confirmPassword) {
                alert("New passwords do not match. Please try again.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>

<%@ include file="nav.jsp" %>

<div class="profile-container">
    <!-- Left Panel -->
    <div class="profile-left">
        <div class="profile-pic">
            <img src="<%= request.getContextPath() %>/user-profile?pic=true" alt="Profile Picture" />
        </div>
        <h3><%= user.getFirstName() %> <%= user.getLastName() %></h3>
        <p>Email: <%= user.getEmail() %></p>
        <p>Blood Group: <%= user.getBloodGroup() %></p>
        <p>Date Of Birth: <%= user.getDob() %></p>
        <p>Gender: <%= user.getGender() %></p>
        <p>Contact: <%= user.getContact() %></p>

        <!-- 🔥 Request Status -->
        <p style="margin-top: 10px; font-weight: bold;">Request Status:
            <span style="color: <%= "Approved".equalsIgnoreCase(requestStatus) ? "green" : 
                                    "Rejected".equalsIgnoreCase(requestStatus) ? "red" : 
                                    "orange" %>;">
                <%= requestStatus != null ? requestStatus : "No Requests" %>
            </span>
        </p>
    </div>

    <!-- Center Panel -->
    <div class="profile-center">
        <h2>User Profile</h2>

        <% if (errorMessage != null) { %>
            <div class="error-message" style="color: red; margin-bottom: 10px;">
                <%= errorMessage %>
            </div>
        <% } %>

        <form action="<%= request.getContextPath() %>/updateProfile" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
            <input type="text" name="firstName" value="<%= user.getFirstName() %>" required />
            <input type="text" name="lastName" value="<%= user.getLastName() %>" required />
            <input type="text" name="bloodGroup" value="<%= user.getBloodGroup() %>" required />
            <input type="date" name="dateOfBirth" value="<%= user.getDob() %>" required />
            
            <select name="gender" required>
                <option value="male" <%= "male".equals(user.getGender()) ? "selected" : "" %>>Male</option>
                <option value="female" <%= "female".equals(user.getGender()) ? "selected" : "" %>>Female</option>
                <option value="other" <%= "other".equals(user.getGender()) ? "selected" : "" %>>Other</option>
            </select>

            <input type="tel" name="contact" value="<%= user.getContact() %>" pattern="[0-9]{10}" required />

            <h3>Change Password</h3>
            <input type="password" name="currentPassword" placeholder="Enter Current Password" />
            <input type="password" name="password" placeholder="New Password (optional)" />
            <input type="password" name="retypePassword" placeholder="Confirm New Password" />

            <input type="file" name="profile_pic" accept="image/*" />
            <button type="submit">Save Changes</button>
        </form>
    </div>
</div>

</body>
</html>
