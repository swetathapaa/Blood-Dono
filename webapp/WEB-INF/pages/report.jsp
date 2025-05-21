<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.blooddono.model.BloodRequest" %>
<!DOCTYPE html>
<html>
<head>
    <title>Blood Request Report</title>
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
            background-color: #f33;
            color: white;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Blood Request Report</h2>
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
        <%
            List<BloodRequest> list = (List<BloodRequest>) request.getAttribute("bloodRequests");
            if (list != null && !list.isEmpty()) {
                for (BloodRequest br : list) {
        %>
        <tr>
            <td><%= br.getRequestId() %></td>
            <td><%= br.getUserId() %></td>
            <td><%= br.getFullName() %></td>
            <td><%= br.getContact() %></td>
            <td><%= br.getBloodGroup() %></td>
            <td><%= br.getRequiredByDate() %></td>
            <td><%= br.getMedicalCondition() %></td>
            <td><%= br.getUnitRequired() %></td>
            <td><%= br.getStatus() %></td>
            <td><%= br.getRequestDate() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="10">No records found.</td>
        </tr>
        <% } %>
    </table>
    <form action="exportPDF" method="get" style="text-align:center; margin-bottom: 20px;">
    <button type="submit">Export as PDF</button>
	</form>
</body>
</html>
