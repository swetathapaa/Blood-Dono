<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.blooddono.model.User" %>
<html>
<head>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 12px;
        }
        th, td {
            border: 1px solid #444;
            padding: 6px;
            text-align: center;
        }
        th {
            background-color: #888;
            color: #fff;
        }
        h2 {
            text-align: center;
        }
    </style>
</head>
<body>
<h2>User Report</h2>
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
        <td><%= u.getGender() %></td>
        <td><%= u.getBloodGroup() %></td>
    </tr>
    <% } %>
</table>
</body>
</html>
