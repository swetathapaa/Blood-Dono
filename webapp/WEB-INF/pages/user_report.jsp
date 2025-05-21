<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.blooddono.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Report</title>
    <style>
        table {
            width: 95%;
            margin: 30px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #666;
            text-align: center;
        }
        th {
            background-color: #880808;
            color: white;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">User Report</h2>
    <table>
        <tr>
            <th>User ID</th>
            <th>Name</th>
            <th>Contact</th>
            <th>Email</th>
            <th>DOB</th>
            <th>Gender</th>
            <th>Blood Group</th>
        </tr>
        <%
            List<User> userList = (List<User>) request.getAttribute("userList");
            for (User u : userList) {
        %>
        <tr>
            <td><%= u.getUserID() %></td>
            <td><%= u.getFirstName() + " " + u.getLastName() %></td>
            <td><%= u.getContact() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getDob() %></td>
            <td><%= u.getGender() %></td>s
            <td><%= u.getBloodGroup() %></td>
        </tr>
        <% } %>
    </table>
    <form action="exportUserPDF" method="get" style="text-align:center; margin-top: 20px;">
        <button type="submit">Export as PDF</button>
    </form>
</body>
</html>
