<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Request Blood</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css" />
  <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_common.css">
  <style>
    body {
      background-color: #f2f2f2;
    }

    .container {
      display: flex;
      justify-content: center;
      gap: 50px;
      padding: 40px;
      max-width: 1200px;
      margin: auto;
    }

    .info-box {
      flex: 1;
      background-color: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
    }

    .info-box h3 {
      font-size: 22px;
      color: #c82333;
      margin-bottom: 20px;
    }

    .tip {
      background-color: #f8f9fa;
      border-left: 5px solid #dc3545;
      padding: 12px 15px;
      margin-bottom: 12px;
      border-radius: 6px;
      font-size: 15px;
      color: #333;
    }

    .form-box {
      flex: 1;
      background-color: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
    }

    .form-box h2 {
      font-size: 24px;
      margin-bottom: 20px;
      color: #333;
      text-align: center;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      font-weight: 600;
      margin-bottom: 8px;
      display: block;
    }

    .form-group input,
    .form-group textarea {
      width: 100%;
      padding: 10px;
      font-size: 15px;
      border-radius: 6px;
      border: 1px solid #ccc;
    }

    .form-group textarea {
      height: 120px;
    }

    button {
      width: 100%;
      padding: 12px;
      background-color: #dc3545;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
    }

    button:hover {
      background-color: #c82333;
    }

    .alert {
      padding: 10px;
      color: #fff;
      background-color: #28a745;
      border-radius: 5px;
      margin-bottom: 20px;
    }

    @media screen and (max-width: 768px) {
      .container {
        flex-direction: column;
        padding: 20px;
      }
    }
  </style>
</head>
<body>
  <%@ include file="nav.jsp" %>

  <div class="container">
    <!-- Left Info Section -->
    <div class="info-box">
      <h3>Things to Know Before Requesting</h3>
      <div class="tip">✅ Ensure you have a valid medical reason.</div>
      <div class="tip">📄 Hospital reports should be ready if required.</div>
      <div class="tip">🔐 Only verified users can make urgent requests.</div>
      <div class="tip">💉 Each unit typically equals 450ml of blood.</div>
      <div class="tip"> <strong> 🩸 Blood Information</strong> <br><br> <strong>O-</strong> is the universal donor and can give blood to any group. <br><br>
       <strong>AB+</strong> is the universal recipient and can receive any blood type</div>
 
    </div>

    <!-- Right Form Section -->
    <div class="form-box">
      <h2>Request Blood</h2>

      <!-- Display Success Message -->
      <% if (request.getAttribute("successMessage") != null) { %>
        <div class="alert">
          <%= request.getAttribute("successMessage") %>
        </div>
      <% } %>

      <form method="post" action="request-blood">
        <div class="form-group">
          <label for="request_blood_group">Request Blood Group:</label>
          <input type="text" name="request_blood_group" placeholder="e.g. A+, O-, AB+" required />
        </div>

        <div class="form-group">
          <label for="required_by_date">Required By Date:</label>
          <input type="date" name="required_by_date" required />
        </div>

        <div class="form-group">
          <label for="hospital_reports">Medical Conditions (explain):</label>
          <textarea name="hospital_reports" placeholder="Explain medical conditions here..."></textarea>
        </div>

        <div class="form-group">
          <label for="unit_required">Unit Required:</label>
          <input type="number" name="unit_required" min="1" placeholder="e.g. 2, 3" required />
        </div>

        <button type="submit">Submit Request</button>
      </form>
    </div>
  </div>
  <%@ include file="footer.jsp" %>
</body>
</html>