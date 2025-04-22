<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Blood Donation - Sign Up</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Segoe UI", sans-serif;
    }

    html, body {
      height: 100%;
      overflow: hidden;
      background-color: #fffafc;
    }

    .container {
      position: relative;
      height: 100vh;
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
      overflow: hidden;
    }

    .bubble {
      position: absolute;
      border-radius: 50%;
      background: rgba(255, 105, 105, 0.2);
      z-index: 0;
    }

    .bubble1 {
      width: 180px;
      height: 180px;
      top: -40px;
      left: -40px;
    }

    .bubble2 {
      width: 250px;
      height: 250px;
      bottom: -100px;
      right: -100px;
    }

    .bubble3 {
      width: 100px;
      height: 100px;
      top: 15%;
      right: 8%;
    }

    .bubble4 {
      width: 130px;
      height: 130px;
      bottom: 20%;
      left: 10%;
      background: rgba(255, 105, 105, 0.15);
    }

    .signup-box {
      background: white;
      border-radius: 18px;
      box-shadow: 0 12px 32px rgba(0, 0, 0, 0.15);
      padding: 40px 30px;
      width: 100%;
      max-width: 600px;
      z-index: 1;
    }

    .signup-box h2 {
      text-align: center;
      margin-bottom: 25px;
      color: #c82333;
      font-size: 22px;
      font-weight: 600;
      font-family: 'Noticia Text', serif;
    }

    .form-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 15px 25px;
    }

    .signup-box input,
    .signup-box select {
      width: 100%;
      padding: 10px 15px;
      border: 1px solid #ccc;
      border-radius: 25px;
      font-size: 14px;
      background-color: #f9f9f9;
    }

    .signup-box input:focus,
    .signup-box select:focus {
      outline: none;
      border-color: #ff4b5c;
      background-color: #fff;
    }

    .signup-box select {
      appearance: none;
      background: #f9f9f9 url('data:image/svg+xml;utf8,<svg fill="%23c82333" height="18" viewBox="0 0 24 24" width="18" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/></svg>') no-repeat right 14px center;
      background-size: 12px;
    }

    .signup-box button {
      grid-column: span 2;
      padding: 12px;
      border: none;
      border-radius: 25px;
      background-color: #c82333;
      color: white;
      font-weight: bold;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s ease;
      margin-top: 10px;
    }

    .signup-box button:hover {
      background-color: #a71d2a;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="bubble bubble1"></div>
    <div class="bubble bubble2"></div>
    <div class="bubble bubble3"></div>
    <div class="bubble bubble4"></div>

    <div class="signup-box">
      <h2>Sign Up & Become a Lifesaver</h2>
      <form id="signupForm">
        <div class="form-grid">
          <input type="text" placeholder="First Name" name="firstName" required />
          <input type="text" placeholder="Last Name" name="lastName" required />
          <input type="tel" placeholder="Contact Number" name="contact" required pattern="[0-9]{10}" maxlength="10" title="Please enter a 10-digit phone number" />
          <input type="email" placeholder="Email Address" name="email" required />
          <input type="date" placeholder="Date of Birth" name="dob" required />
          <select name="gender" required>
            <option value="" disabled selected>Select Gender</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
            <option value="other">Other</option>
          </select>
          <input type="password" placeholder="Password" name="password" required />
          <input type="password" placeholder="Confirm Password" name="confirmPassword" required />
          <select name="role" required>
            <option value="" disabled selected>Select Role</option>
            <option value="donor">Blood Donor/Receiver</option>
            <option value="receiver">Admin</option>
          </select>
          <div></div>
          <button type="submit">Register Now</button>
        </div>
      </form>
    </div>
  </div>

  <script>
    document.getElementById("signupForm").addEventListener("submit", function (e) {
      e.preventDefault();

      const form = e.target;
      const email = form.email.value.trim();
      const password = form.password.value;
      const confirmPassword = form.confirmPassword.value;

      if (!email.includes("@") || !email.includes(".")) {
        alert("Please enter a valid email address.");
        return;
      }

      if (password !== confirmPassword) {
        alert("Passwords do not match.");
        return;
      }

      // ✅ All validations passed
      alert("✅ Registration successful!");
      window.location.href = "./login.jsp";
    });
  </script>
</body>
</html>
