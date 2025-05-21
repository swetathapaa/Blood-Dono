<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="com.blooddono.config.DbConfig"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Blood Dono Admin Dashboard</title>

<!-- Google Fonts -->
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Bodoni+Moda:ital,wght@0,400;1,400&family=Montserrat:wght@500&display=swap")
	;

@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap")
	;

:root {
	--red: #d32f2f;
	--light-green: #a5d6a7;
	--bg-light: #fdfcfc;
	--text: #2e2e2e;
	--card-bg: #ffffff;
	--table-header: #c62828;
	--table-row-alt: #f9f9f9;
	--border: #e0e0e0;
	--button-bg: #66bb6a;
	--highlight: #ffeaea;
	--popup-bg: rgba(0, 0, 0, 0.5);
	--popup-box-bg: #f8dcdc;
}

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: "Poppins", sans-serif;
	background: linear-gradient(to bottom right, #fff5f5, #fff);
	color: var(--text);
}

/* Navigation */
header {
	background-color: var(--red);
	color: white;
	padding: 20px 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

header h1 {
	font-family: "Bodoni Moda", serif;
	font-size: 1.8rem;
}

.dashboard {
	padding: 40px;
}

.greeting {
	font-size: 1.6rem;
	font-weight: bold;
	color: var(--red);
	margin-bottom: 30px;
}

.cards {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
	gap: 24px;
	margin-bottom: 50px;
}

.card {
	background: var(--card-bg);
	border-radius: 20px;
	padding: 20px;
	border-left: 6px solid var(--red);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
	transition: transform 0.2s;
}

.card:hover {
	transform: translateY(-4px);
}

.card h3 {
	color: var(--red);
	font-size: 1.2rem;
	margin-bottom: 10px;
}

.section {
	margin-bottom: 50px;
}

.section-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.section-header h2 {
	font-size: 1.4rem;
	color: var(--red);
}

.section-header-buttons {
	display: flex;
	gap: 10px;
}

.btn-add:hover {
	background-color: #4caf50;
}

.btns {
	background-color: var(--red);
	color: white;
	border: none;
	padding: 10px 18px;
	border-radius: 8px;
	cursor: pointer;
	font-weight: 500;
	transition: background-color 0.3s;
	margin-left: 10px;
}

.btns:hover {
	background-color: #b71c1c;
}

/* Table Styling */
table {
	width: 100%;
	border-collapse: collapse;
	border-radius: 12px;
	overflow: hidden;
	background-color: white;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

th, td {
	padding: 14px 16px;
	border-bottom: 1px solid var(--border);
	text-align: center;
}

th {
	background-color: var(--table-header);
	color: white;
}

tr:nth-child(even) td {
	background-color: var(--table-row-alt);
}

tr:first-child th {
	background-color: var(--table-header);
	/* Ensures the header row stands out */
}

tr:nth-child(even) {
	background-color: var(--table-row-alt);
}

tr:nth-child(odd) {
	background-color: white;
}

/* Button Styles */
.btn-update, .btns {
	padding: 8px 16px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	font-weight: 500;
	transition: background-color 0.3s;
}

.btn-update {
	background-color: #ffc107;
	color: white;
}

.btns {
	background-color: #dc3545;
	color: white;
}

.btn-add:hover, .btn-update:hover, .btns:hover {
	opacity: 0.8;
}

/* Popup and Confirm Box Styles */
.popup, .confirm-overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: var(--popup-bg);
	justify-content: center;
	align-items: center;
	z-index: 999;
}

.popup-box, .confirm-box {
	background: var(--popup-box-bg);
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
	width: 400px;
	max-width: 100%;
	color: #878787;
	text-align: center;
}

.popup h3, .confirm-box h3 {
	margin-bottom: 20px;
	color: var(--red);
}

.popup input, .popup textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border-radius: 8px;
	border: 1px solid var(--border);
	font-size: 1rem;
	background-color: #e9fff0;
}

.btn-submit, .btn-close, .btn-confirm, .btn-cancel {
	padding: 12px;
	font-weight: 600;
	border-radius: 8px;
	cursor: pointer;
	margin: 5px;
	width: 10%;
}

.btn-submit {
	background-color: var(--button-bg);
	color: white;
	border: none;
}

.btn-close, .btn-cancel {
	background-color: var(--red);
	color: white;
	border: none;
}

.btn-confirm {
	background-color: var(--button-bg);
	color: white;
	border: none;
}

/* Modal background */
.modal {
	display: none; /* Initially hidden */
	position: fixed;
	z-index: 999;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: var(--popup-bg);
	justify-content: center;
	align-items: center;
}

/* Modal content box - styled like popup-box */
.modal-content {
	background: var(--popup-box-bg);
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
	width: 400px;
	max-width: 100%;
	max-height: 80vh; /* Limit height to 80% of viewport height */
	overflow-y: auto; /* Enable vertical scroll inside modal if needed */
	color: #878787;
	text-align: center;
	position: relative;
}

/* Close button */
.close {
	position: absolute;
	top: 15px;
	right: 20px;
	font-size: 24px;
	font-weight: bold;
	color: #888;
	cursor: pointer;
}

.close-btn {
	position: absolute;
	top: 10px;
	right: 15px;
	font-size: 24px;
	font-weight: bold;
	color: #333;
	cursor: pointer;
}

.close:hover {
	color: #333;
}

/* Form groups */
.form-group {
	margin-bottom: 10px;
	text-align: left;
}

.form-group label {
	font-weight: 600;
	margin-bottom: 6px;
	color: #333;
	display: block;
}

/* Inputs and select styled like popup inputs */
.form-group input, .form-group textarea {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 6px;
	background-color: #d4fdd9;
	box-sizing: border-box;
}

/* Submit button - styled like popup buttons */
.modal-submit-btn, .cancel-btn {
	padding: 10px 20px;
	border: none;
	border-radius: 8px;
	font-weight: bold;
	cursor: pointer;
	color: white;
}

.modal-submit-btn {
	background-color: #28a745; /* green */
}

.cancel-btn {
	background-color: #dc3545; /* red */
}

.modal-submit-btn:hover {
	background-color: #4caf50; /* Slightly different hover for clarity */
}

/* Responsive modal for small screens */
@media ( max-width : 600px) {
	.modal-content {
		width: 95%;
		padding: 20px;
	}
}

/* Form styles */
.form-group {
	margin-bottom: 15px;
}

.form-actions {
	display: flex;
	justify-content: flex-end;
	gap: 14px;
	margin-top: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}
</style>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="dashboard">
		<div class="greeting" style="padding-top: 30px;">Hi Admin 👋</div>

		<div class="cards">
			<div class="card">
				<h3>Total Donors</h3>
				<p id="donor-count">Loading...</p>
			</div>
			<div class="card">
				<h3>Total Receivers</h3>
				<p id="receiver-count">Loading...</p>
			</div>
			<div class="card">
				<h3>Total Users</h3>
				<p id="user-count">Loading...</p>
			</div>
			<div class="card">
				<h3>Total Campaigns</h3>
				<p id="campaign-count">Loading...</p>
			</div>
		</div>

		<!-- Campaign Details Section -->
		<div class="section">
			<div class="section-header">
				<h2>Campaign Details</h2>
				<div class="section-header-buttons">
					<button class="btns" onclick="openAddCampaignForm()">+ Add
						Campaign</button>
					<button class="btns" onclick="openCDeletePopup()">- Delete
						Campaign</button>
				</div>
			</div>

			<table id="campaign-table">
				<tr>
					<th>Campaign ID</th>
					<th>Campaign Name</th>
					<th>Campaign Location</th>
					<th>Campaign Date</th>
					<th>Campaign Details</th>
					<th>Action</th>
				</tr>
				<%
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection conn = DbConfig.getDbConnection();
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT * FROM campaign");

					while (rs.next()) {
						out.print("<tr>");
						out.print("<td>" + rs.getInt("CampaignID") + "</td>");
						out.print("<td>" + rs.getString("CampaignName") + "</td>");
						out.print("<td>" + rs.getString("CampaignLocation") + "</td>");
						out.print("<td>" + rs.getDate("CampaignDate") + "</td>");
						out.print("<td>" + rs.getString("CampaignDetails") + "</td>");
						out.print("<td><button class='btn-update update-campaign-btn'>Update</button></td>");
						out.print("</tr>");
					}

					rs.close();
					stmt.close();
					conn.close();
				} catch (Exception e) {
					out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
				}
				%>
			</table>
		</div>

		<!-- Update Campaign Modal -->
		<div id="updateCampaignModal" class="modal">
			<div class="modal-content">
				<span class="close-btn">×</span>
				<h2>Update Campaign</h2>
				<form action="adminDashboard" method="post" id="updateCampaignForm">
					<input type="hidden" name="action" value="updateCampaign">
					<input type="hidden" name="id" id="campaignId">
					<div class="form-group">
						<label for="campaignName">Campaign Name</label> <input type="text"
							name="name" id="campaignName" required>
					</div>
					<div class="form-group">
						<label for="campaignLocation">Location</label> <input type="text"
							name="location" id="campaignLocation" required>
					</div>
					<div class="form-group">
						<label for="campaignDate">Date</label> <input type="date"
							name="date" id="campaignDate" required>
					</div>
					<div class="form-group">
						<label for="campaignDetails">Details</label>
						<textarea name="details" id="campaignDetails" rows="3" required></textarea>
					</div>
					<div class="form-actions">
						<button type="button" class="cancel-btn">Cancel</button>
						<button type="submit" class="modal-submit-btn">Update
							Campaign</button>
					</div>
				</form>
			</div>
		</div>

		<!-- User Details Section -->
		<div class="section">
			<div class="section-header">
				<h2>User Details</h2>
				<div class="section-header-buttons">
					<button class="btns" onclick="openDeletePopup()">- Delete
						User</button>
					<form action="userReport" method="get">
	


						<button class="btns">Generate Report</button>

						    
					</form>
				</div>
			</div>
			<table id="user-table">
				<tr>
				
					<th>User ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Contact</th>
					<th>Email</th>
					<th>Date of Birth</th>
					<th>Gender</th>
					<th>Blood Group</th>
					<th>Action</th>
				</tr>
				<%
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection conn = DbConfig.getDbConnection();
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT * FROM user");

					while (rs.next()) {
						out.print("<tr>");
						out.print("<td>" + rs.getInt("userID") + "</td>");
						out.print("<td>" + rs.getString("firstName") + "</td>");
						out.print("<td>" + rs.getString("lastName") + "</td>");
						out.print("<td>" + rs.getString("contact") + "</td>");
						out.print("<td>" + rs.getString("email") + "</td>");
						out.print("<td>" + rs.getString("dateOfBirth") + "</td>");
						out.print("<td>" + rs.getString("gender") + "</td>");
						out.print("<td>" + rs.getString("bloodGroup") + "</td>");
						out.print("<td><button class='btn-update update-user-btn'>Update</button></td>");
						out.print("</tr>");
					}

					rs.close();
					stmt.close();
					conn.close();
				} catch (Exception e) {
					out.println("<tr><td colspan='9'>Error: " + e.getMessage() + "</td></tr>");
				}
				%>
			</table>
		</div>

		<!-- Donor Table -->
		<div class="section">
			<div class="section-header">
				<h2>Donor Table</h2>
			</div>
			<table>
				<tr>
					<th>Donor ID</th>
					<th>User ID</th>
					<th>Campaign ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Address</th>
					<th>Age</th>
					<th>Blood Group</th>
					<th>Units Donated</th>
					<th>Update</th>
				</tr>
				<%
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection conn = DbConfig.getDbConnection();
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT * FROM donor");

					while (rs.next()) {
						int donorId = rs.getInt("donor_id");
						int userId = rs.getInt("userid");
						int campaignId = rs.getInt("campaignid");
						String name = rs.getString("name");
						String email = rs.getString("email");
						String address = rs.getString("address");
						int age = rs.getInt("age");
						String bloodGroup = rs.getString("blood_group");
						int unitsDonated = rs.getInt("units_donated");

						out.print("<form action='adminDashboard' method='post'>");
						out.print("<input type='hidden' name='action' value='updateUnits' />");
						out.print("<input type='hidden' name='donorId' value='" + donorId + "' />");
						out.print("<tr>");
						out.print("<td>" + donorId + "</td>");
						out.print("<td>" + userId + "</td>");
						out.print("<td>" + campaignId + "</td>");
						out.print("<td>" + name + "</td>");
						out.print("<td>" + email + "</td>");
						out.print("<td>" + address + "</td>");
						out.print("<td>" + age + "</td>");
						out.print("<td>" + bloodGroup + "</td>");
						out.print("<td><input type='number' name='unitsDonated' value='" + unitsDonated + "' min='0' /></td>");
						out.print("<td><button type='submit' class='btn-update'>Save</button></td>");
						out.print("</tr>");
						out.print("</form>");
					}

					rs.close();
					stmt.close();
					conn.close();
				} catch (Exception e) {
					out.println("<tr><td colspan='10'>Error: " + e.getMessage() + "</td></tr>");
				}
				%>
			</table>
		</div>

		<!-- Contact Table -->
		<div class="section">
			<div class="section-header">
				<h2>Contact Table</h2>
			</div>
			<table>
				<tr>
					<th>Name</th>
					<th>Phone</th>
					<th>Email</th>
					<th>Blood Type</th>
					<th>Message</th>
				</tr>
				<%
				try {
					Connection conn = DbConfig.getDbConnection();
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT * FROM contact");
					while (rs.next()) {
						out.print("<tr>");
						out.print("<td>" + rs.getString("name") + "</td>");
						out.print("<td>" + rs.getString("phone") + "</td>");
						out.print("<td>" + rs.getString("email") + "</td>");
						out.print("<td>" + rs.getString("bloodType") + "</td>");
						out.print("<td>" + rs.getString("message") + "</td>");
						out.print("</tr>");
					}
					rs.close();
					stmt.close();
					conn.close();
				} catch (Exception e) {
					out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
				}
				%>
			</table>
		</div>

		<!-- Blog Details -->
		<div class="section">
			<div class="section-header">
				<h2>Blog Details</h2>
				<div class="section-header-buttons">
					<button class="btns" onclick="openBlogDeletePopup()">-
						Delete Blog</button>
				</div>
			</div>
			<form id="approval-form">
				<table id="blog-table">
					<tr>
						<th>ID</th>
						<th>Blog Title</th>
						<th>Blog Story</th>
						<th>Posted Date</th>
						<th>Posted User ID</th>
						<th>Admin Approval</th>
					</tr>
					<%
					try {
						Connection conn = DbConfig.getDbConnection();
						Statement stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery("SELECT * FROM blog ORDER BY PostedDate DESC");

						while (rs.next()) {
							int blogId = rs.getInt("id");
							String blogTitle = rs.getString("BlogTitle");
							String blogStory = rs.getString("BlogStory");
							Date postedDate = rs.getDate("PostedDate");
							int postedUserId = rs.getInt("PostedUserID");
							String adminApproval = rs.getString("admin_approval");

							out.print("<tr>");
							out.print("<td>" + blogId + "</td>");
							out.print("<td>" + blogTitle + "</td>");
							out.print("<td>" + (blogStory.length() > 100 ? blogStory.substring(0, 100) + "..." : blogStory) + "</td>");
							out.print("<td>" + postedDate + "</td>");
							out.print("<td>" + postedUserId + "</td>");
							out.print("<td>");
							out.print("<select name='approval_" + blogId + "'>");
							out.print("<option value='YES'" + ("YES".equals(adminApproval) ? " selected" : "") + ">Approve</option>");
							out.print("<option value='NO'" + ("NO".equals(adminApproval) ? " selected" : "") + ">Not Approved</option>");
							out.print("</select>");
							out.print("</td>");
							out.print("</tr>");
						}

						rs.close();
						stmt.close();
						conn.close();
					} catch (Exception e) {
						out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
					}
					%>
				</table>
				<br>
				<button type="button" onclick="submitApproval()" class="btn-submit">Submit
					Changes</button>
				<div id="result-message"></div>
			</form>
		</div>

		<!-- Request Table -->
		<div class="section">
			<div class="section-header">
				<h2>Request Table</h2>
				<form action="reportController" method="get">
					<div class="section-header-buttons">

						<button class="btns">Generate Report</button>
					</div>
					    
				</form>
			</div>
			<%
			String statusMsg = request.getParameter("statusUpdate");
			if ("success".equals(statusMsg)) {
			%>
			<div style="color: green; margin-bottom: 10px; font-weight: bold;">
				✅ Status updated successfully!</div>
			<%
			}
			%>
			<form method="post" action="update-request-status">
				<table>
					<tr>
						<th>ID</th>
						<th>User ID</th>
						<th>Name</th>
						<th>Contact</th>
						<th>Blood Group</th>
						<th>Required By</th>
						<th>Units</th>
						<th>Medical Condition</th>
						<th>Status</th>
					</tr>
					<%
					try {
						Connection conn = DbConfig.getDbConnection();
						Statement stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery("SELECT * FROM blood_requests ORDER BY request_date DESC");

						while (rs.next()) {
							int id = rs.getInt("request_id");
							int userId = rs.getInt("user_id");
							String name = rs.getString("full_name");
							String contact = rs.getString("contact");
							String bloodGroup = rs.getString("blood_group");
							Date requiredBy = rs.getDate("required_by_date");
							int units = rs.getInt("unit_required");
							String condition = rs.getString("medical_condition");
							String status = rs.getString("status");

							out.print("<tr>");
							out.print("<td>" + id + "</td>");
							out.print("<td>" + userId + "</td>");
							out.print("<td>" + name + "</td>");
							out.print("<td>" + contact + "</td>");
							out.print("<td>" + bloodGroup + "</td>");
							out.print("<td>" + requiredBy + "</td>");
							out.print("<td>" + units + "</td>");
							out.print("<td>" + (condition == null || condition.isEmpty() ? "-" : condition) + "</td>");
							out.print("<td>");
							out.print("<select name='status_" + id + "'>");
							out.print("<option value='Pending'" + ("Pending".equals(status) ? " selected" : "") + ">Pending</option>");
							out.print("<option value='Approved'" + ("Approved".equals(status) ? " selected" : "") + ">Approved</option>");
							out.print("</select>");
							out.print("</td>");
							out.print("</tr>");
						}

						rs.close();
						stmt.close();
						conn.close();
					} catch (Exception e) {
						out.println("<tr><td colspan='9'>Error: " + e.getMessage() + "</td></tr>");
					}
					%>
				</table>
				<br>
				<button type="submit" class="btn-submit">Update Status</button>
			</form>
		</div>

		<!-- Delete Blog Popup -->
		<div class="popup" id="blogDeletePopup">
			<div class="popup-box">
				<h3>Delete Blog</h3>
				<form id="delete-blog-form" onsubmit="deleteBlog(event)">
					<label for="blogIdToDelete">Enter Blog ID to delete:</label> <input
						type="text" id="blogIdToDelete" name="blogIdToDelete" required />
					<p>Are you sure you want to delete this blog?</p>
					<button type="submit" class="btn-submit">Yes, Delete</button>
					<button type="button" class="btn-close"
						onclick="closeBlogDeletePopup()">Cancel</button>
				</form>
			</div>
		</div>

		<!-- Delete User Popup -->
		<div class="popup" id="delete-popup">
			<div class="popup-box">
				<h3>Delete User</h3>
				<form id="delete-popup-form" onsubmit="deleteUser(event)">
					<input type="hidden" name="action" value="deleteUser" /> <label
						for="delete-user-id">Enter User ID to delete:</label> <input
						type="text" name="userID" id="delete-user-id" required />
					<p>Are you sure you want to delete this user?</p>
					<button type="submit" class="btn-submit">Yes, Delete</button>
					<button type="button" class="btn-close"
						onclick="closeDeletePopup()">Cancel</button>
				</form>
			</div>
		</div>

		<!-- Delete Campaign Popup -->
		<div class="popup" id="delete-campaign-popup">
			<div class="popup-box">
				<h3>Delete Campaign</h3>
				<form id="delete-campaign-popup-form"
					onsubmit="deleteCampaign(event)">
					<input type="hidden" name="action" value="deleteCampaign" /> <label
						for="delete-campaign-id">Enter Campaign ID to delete:</label> <input
						type="text" name="campaignID" id="delete-campaign-id" required />
					<p>Are you sure you want to delete this campaign?</p>
					<button type="submit" class="btn-submit">Yes, Delete</button>
					<button type="button" class="btn-close"
						onclick="closeCDeletePopup()">Cancel</button>
				</form>
			</div>
		</div>

		<!-- Add Campaign Modal -->
		<div id="addCampaignModal" class="modal">
			<div class="modal-content">
				<span class="close" onclick="closeAddCampaignForm()">×</span>
				<h2>Add Campaign</h2>
				<form id="addCampaignForm" action="adminDashboard" method="POST"
					enctype="multipart/form-data">
					<input type="hidden" name="action" value="addCampaign" />
					<div class="form-group">
						<label for="addCampaignName">Campaign Name</label> <input
							type="text" id="addCampaignName" name="campaignName" required />
					</div>
					<div class="form-group">
						<label for="addCampaignLocation">Campaign Location</label> <input
							type="text" id="addCampaignLocation" name="campaignLocation"
							required />
					</div>
					<div class="form-group">
						<label for="addCampaignDate">Campaign Date</label> <input
							type="date" id="addCampaignDate" name="campaignDate" required />
					</div>
					<div class="form-group">
						<label for="addCampaignDetails">Campaign Details</label>
						<textarea id="addCampaignDetails" name="campaignDetails" required></textarea>
					</div>
					<div class="form-group">
						<label for="addCampaignImage">Campaign Image</label> <input
							type="file" id="addCampaignImage" name="campaignImageFile"
							accept="image/*" />
					</div>
					<div class="form-actions">
						<button type="button" class="cancel-btn"
							onclick="closeAddCampaignForm()">Cancel</button>
						<button type="submit" class="modal-submit-btn">Add
							Campaign</button>
					</div>
				</form>
			</div>
		</div>

		<!-- Update User Modal -->
		<div id="updateUserModal" class="modal">
			<div class="modal-content">
				<span class="close" onclick="closeUpdateUserModal()">×</span>
				<h2>Update User</h2>
				<form id="updateUserForm" method="POST" action="adminDashboard">
					<input type="hidden" id="updateUserID" name="userID"> <input
						type="hidden" name="action" value="update">
					<div class="form-group">
						<label for="updateFirstName">First Name</label> <input type="text"
							id="updateFirstName" name="firstName" required>
					</div>
					<div class="form-group">
						<label for="updateLastName">Last Name</label> <input type="text"
							id="updateLastName" name="lastName" required>
					</div>
					<div class="form-group">
						<label for="updateEmail">Email</label> <input type="email"
							id="updateEmail" name="email" required>
					</div>
					<div class="form-group">
						<label for="updateContact">Contact</label> <input type="text"
							id="updateContact" name="contact" required>
					</div>
					<div class="form-group">
						<label for="updateDOB">Date of Birth</label> <input type="date"
							id="updateDOB" name="dateOfBirth" required>
					</div>
					<div class="form-group">
						<label for="updateGender">Gender</label> <select id="updateGender"
							name="gender" required>
							<option value="Male">Male</option>
							<option value="Female">Female</option>
							<option value="Other">Other</option>
						</select>
					</div>
					<div class="form-group">
						<label for="updateBloodGroup">Blood Group</label> <select
							id="updateBloodGroup" name="bloodGroup" required>
							<option value="A+">A+</option>
							<option value="A-">A-</option>
							<option value="B+">B+</option>
							<option value="B-">B-</option>
							<option value="AB+">AB+</option>
							<option value="AB-">AB-</option>
							<option value="O+">O+</option>
							<option value="O-">O-</option>
						</select>
					</div>
					<div class="form-actions">
						<button type="button" class="cancel-btn"
							onclick="closeUpdateUserModal()">Cancel</button>
						<button type="submit" class="modal-submit-btn">Update
							User</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		const contextPath = "<%=request.getContextPath()%>";

		// Fetch dashboard data
		function fetchDashboardData() {
			fetch(contextPath + '/dashboard-data')
				.then(response => {
					if (!response.ok) throw new Error('Network response was not ok');
					return response.json();
				})
				.then(data => {
					if (data.status === 'success') {
						document.getElementById('donor-count').textContent = data.donorCount;
						document.getElementById('receiver-count').textContent = data.receiverCount;
						document.getElementById('user-count').textContent = data.userCount;
						document.getElementById('campaign-count').textContent = data.campaignCount;
					} else {
						throw new Error(data.message);
					}
				})
				.catch(error => {
					console.error('Error fetching dashboard data:', error);
					document.getElementById('donor-count').textContent = 'Error';
					document.getElementById('receiver-count').textContent = 'Error';
					document.getElementById('user-count').textContent = 'Error';
					document.getElementById('campaign-count').textContent = 'Error';
				});
		}

		// Modal and popup functions
		function openAddCampaignForm() {
			console.log('Opening add campaign modal');
			document.getElementById('addCampaignModal').style.display = 'flex';
		}

		function closeAddCampaignForm() {
			document.getElementById('addCampaignModal').style.display = 'none';
		}

		function openDeletePopup() {
			document.getElementById('delete-popup').style.display = 'flex';
			document.getElementById('delete-user-id').value = '';
			document.getElementById('delete-user-id').focus();
		}

		function closeDeletePopup() {
			document.getElementById('delete-popup').style.display = 'none';
		}

		function openCDeletePopup() {
			document.getElementById('delete-campaign-popup').style.display = 'flex';
			document.getElementById('delete-campaign-id').value = '';
			document.getElementById('delete-campaign-id').focus();
		}

		function closeCDeletePopup() {
			document.getElementById('delete-campaign-popup').style.display = 'none';
		}

		function openBlogDeletePopup() {
			document.getElementById('blogDeletePopup').style.display = 'flex';
			document.getElementById('blogIdToDelete').value = '';
			document.getElementById('blogIdToDelete').focus();
		}

		function closeBlogDeletePopup() {
			document.getElementById('blogDeletePopup').style.display = 'none';
		}

		function openUpdateUserModal(userId, firstName, lastName, email, contact, dob, gender, bloodGroup) {
			console.log('Opening update user modal for userID:', userId);
			document.getElementById('updateUserID').value = userId;
			document.getElementById('updateFirstName').value = firstName;
			document.getElementById('updateLastName').value = lastName;
			document.getElementById('updateEmail').value = email;
			document.getElementById('updateContact').value = contact;
			document.getElementById('updateDOB').value = dob;
			document.getElementById('updateGender').value = gender;
			document.getElementById('updateBloodGroup').value = bloodGroup;
			document.getElementById('updateUserModal').style.display = 'flex';
		}

		function closeUpdateUserModal() {
			document.getElementById('updateUserModal').style.display = 'none';
		}

		// AJAX functions
		function deleteUser(event) {
			event.preventDefault();
			const userId = document.getElementById('delete-user-id').value.trim();
			if (!userId) {
				alert('Please enter a User ID.');
				return;
			}
			const formData = new FormData();
			formData.append('action', 'deleteUser');
			formData.append('userID', userId);
			fetch(contextPath + '/adminDashboard', {
				method: 'POST',
				body: formData
			})
			.then(response => response.json())
			.then(data => {
				alert(data.message);
				closeDeletePopup();
				if (data.status === 'success') {
					location.reload();
				}
			})
			.catch(err => {
				alert('Error deleting user: ' + err);
				closeDeletePopup();
			});
		}

		function deleteCampaign(event) {
			event.preventDefault();
			const campaignId = document.getElementById('delete-campaign-id').value.trim();
			if (!campaignId) {
				alert('Please enter a Campaign ID.');
				return;
			}
			const formData = new FormData();
			formData.append('action', 'deleteCampaign');
			formData.append('campaignID', campaignId);
			fetch(contextPath + '/adminDashboard', {
				method: 'POST',
				body: formData
			})
			.then(response => response.json())
			.then(data => {
				alert(data.message);
				closeCDeletePopup();
				if (data.status === 'success') {
					location.reload();
				}
			})
			.catch(err => {
				alert('Error deleting campaign: ' + err);
				closeCDeletePopup();
			});
		}

		function deleteBlog(event) {
			event.preventDefault();
			const blogId = document.getElementById('blogIdToDelete').value.trim();
			if (!blogId) {
				alert('Please enter a Blog ID.');
				return;
			}
			const formData = new FormData();
			formData.append('action', 'deleteBlog');
			formData.append('id', blogId);
			fetch(contextPath + '/adminDashboard', {
				method: 'POST',
				body: formData
			})
			.then(response => response.json())
			.then(data => {
				alert(data.message);
				closeBlogDeletePopup();
				if (data.status === 'success') {
					location.reload();
				}
			})
			.catch(err => {
				alert('Error deleting blog: ' + err);
				closeBlogDeletePopup();
			});
		}

		function submitApproval() {
			const form = document.getElementById('approval-form');
			const formData = new FormData(form);
			formData.append('action', 'approveBlog');
			fetch(contextPath + '/adminDashboard', {
				method: 'POST',
				body: formData
			})
			.then(response => response.json())
			.then(data => {
				document.getElementById('result-message').textContent = data.message;
				if (data.status === 'success') {
					location.reload();
				}
			})
			.catch(error => {
				document.getElementById('result-message').textContent = 'Error: ' + error;
			});
		}

		// Event listeners
		document.addEventListener('DOMContentLoaded', function () {
			console.log('DOM loaded');
			fetchDashboardData();

			// Update campaign buttons
			const updateCampaignButtons = document.querySelectorAll('.update-campaign-btn');
			console.log('Found update campaign buttons:', updateCampaignButtons.length);
			updateCampaignButtons.forEach(button => {
				button.addEventListener('click', function () {
					console.log('Update campaign button clicked');
					const row = this.closest('tr');
					const cells = row.cells;
					document.getElementById('campaignId').value = cells[0].textContent.trim();
					document.getElementById('campaignName').value = cells[1].textContent.trim();
					document.getElementById('campaignLocation').value = cells[2].textContent.trim();
					document.getElementById('campaignDate').value = cells[3].textContent.trim();
					document.getElementById('campaignDetails').value = cells[4].textContent.trim();
					document.getElementById('updateCampaignModal').style.display = 'flex';
				});
			});

			// Update user buttons
			const updateUserButtons = document.querySelectorAll('.update-user-btn');
			console.log('Found update user buttons:', updateUserButtons.length);
			updateUserButtons.forEach(button => {
				button.addEventListener('click', function () {
					console.log('Update user button clicked');
					const row = this.closest('tr');
					const cells = row.cells;
					openUpdateUserModal(
						cells[0].textContent.trim(),
						cells[1].textContent.trim(),
						cells[2].textContent.trim(),
						cells[4].textContent.trim(),
						cells[3].textContent.trim(),
						cells[5].textContent.trim(),
						cells[6].textContent.trim(),
						cells[7].textContent.trim()
					);
				});
			});

			// Modal close handlers
			const updateCampaignModal = document.getElementById('updateCampaignModal');
			const closeCampaignBtn = updateCampaignModal.querySelector('.close-btn');
			const cancelCampaignBtn = updateCampaignModal.querySelector('.cancel-btn');
			closeCampaignBtn.addEventListener('click', () => {
				updateCampaignModal.style.display = 'none';
			});
			cancelCampaignBtn.addEventListener('click', () => {
				updateCampaignModal.style.display = 'none';
			});

			// Close modals on outside click
			window.addEventListener('click', function (event) {
				if (event.target === updateCampaignModal) {
					updateCampaignModal.style.display = 'none';
				}
				if (event.target === document.getElementById('updateUserModal')) {
					closeUpdateUserModal();
				}
				if (event.target === document.getElementById('addCampaignModal')) {
					closeAddCampaignForm();
				}
			});
		});
	</script>
</body>
</html>