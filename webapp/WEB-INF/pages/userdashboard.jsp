<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>User Dashboard - Blood Dono</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css" />
</head>
<body>
  <div class="bubble bubble1"></div>
  <div class="bubble bubble2"></div>
  <div class="bubble bubble3"></div>

  <div class="container">
    <div class="left-panel">
      <div class="left-panel-content">
        <h2>Welcome!</h2>
        <p>Manage and update your profile here.</p>
        <div class="catchy-text">Keep your info up to date to help save lives!</div>
      </div>
    </div>

    <div class="right-panel">
      <form id="profileForm" action="${pageContext.request.contextPath}/updateProfile" method="post" class="form-area">
        <h3>Update Profile</h3>

        <input type="text" name="first_name" value="${user.firstName}" placeholder="First Name" required />
        <input type="text" name="last_name" value="${user.lastName}" placeholder="Last Name" required />
        <input type="text" name="blood_group" value="${user.bloodGroup}" placeholder="Blood Group (e.g. A+)" required />
        <input type="date" name="dob" value="${user.dob}" required />

        <select name="gender" required>
          <option value="" disabled>Select Gender</option>
          <option value="male"   ${user.gender == 'male'   ? 'selected' : ''}>Male</option>
          <option value="female" ${user.gender == 'female' ? 'selected' : ''}>Female</option>
          <option value="other"  ${user.gender == 'other'  ? 'selected' : ''}>Other</option>
        </select>

        <input type="email" name="email" value="${user.email}" placeholder="Email Address" readonly />
        <input type="tel" name="contact" value="${user.contact}" placeholder="Contact Number"
               pattern="[0-9]{10}" maxlength="10" required />

        <input type="password" id="password" name="password" placeholder="New Password (optional)" />
        <input type="password" id="retypePassword" name="retypePassword" placeholder="Confirm New Password" />

        <div class="button-wrapper">
          <button type="submit">Update Profile</button>
        </div>
      </form>
    </div>
  </div>

  <script>
    document.getElementById("profileForm").addEventListener("submit", function(event) {
      const password = document.getElementById("password").value.trim();
      const retypePassword = document.getElementById("retypePassword").value.trim();

      // Only validate if user is trying to change password
      if (password || retypePassword) {
        if (password !== retypePassword) {
          alert("Passwords do not match. Please try again.");
          event.preventDefault();
        }
      }
    });
  </script>
</body>
</html>
