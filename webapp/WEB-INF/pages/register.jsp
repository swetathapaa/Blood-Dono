<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Blood Donation - Sign Up</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css" />
</head>
<body>
  <div class="container">
    <div class="bubble bubble1"></div>
    <div class="bubble bubble2"></div>
    <div class="bubble bubble3"></div>
    <div class="bubble bubble4"></div>

    <div class="signup-box">
      <h2>Sign Up and Become a Lifesaver</h2>

      <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
      </c:if>

      <c:if test="${not empty success}">
        <div class="success-message">${success}</div>
      </c:if>

      <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">
        <div class="form-grid">

          <div class="image-upload">
            <label for="profilePic">Upload Profile Picture</label>
            <input type="file" id="profilePic" name="profilePic" accept="image/*" required />
          </div>

          <input type="text" id="firstName" name="firstName" value="${firstName}" placeholder="First Name" required />
          <input type="text" id="lastName" name="lastName" value="${lastName}" placeholder="Last Name" required />
          <input type="text" id="bloodGroup" name="bloodGroup" value="${bloodGroup}" placeholder="Blood Group (e.g. A+)" required />
          <input type="date" id="dob" name="dob" value="${dob}" placeholder="Date of Birth" required />

          <select id="gender" name="gender" required>
            <option value="" disabled ${empty gender ? "selected" : ""}>Select Gender</option>
            <option value="male" ${gender == 'male' ? 'selected' : ''}>Male</option>
            <option value="female" ${gender == 'female' ? 'selected' : ''}>Female</option>
            <option value="other" ${gender == 'other' ? 'selected' : ''}>Other</option>
          </select>

          <input type="email" id="email" name="email" value="${email}" placeholder="Email Address" required />
          <input type="tel" id="contact" name="contact" value="${contact}" placeholder="Contact Number" pattern="9[0-9]{9}" maxlength="10" required />

          <input type="password" id="password" name="password" placeholder="Password" required />
          <input type="password" id="retypePassword" name="retypePassword" placeholder="Confirm Password" required />

          <div></div>
          <button type="submit">Register Now</button>
        </div>
      </form>
    </div>
  </div>
</body>
</html>
