<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    // If already logged in, go straight to profile
    if (session.getAttribute("user") != null) {
        response.sendRedirect(request.getContextPath() + "/user-profile");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login - Blood Dono</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
</head>
<body>
  <!-- background bubbles -->
  <div class="bubble bubble1"></div>
  <div class="bubble bubble2"></div>
  <div class="bubble bubble3"></div>

  <div class="container">
    <!-- Left Panel with branding -->
    <div class="left-panel">
      <div class="logo">Blood Dono</div>
      <div class="left-panel-content">
        <h2>Hey There!</h2>
        <p>Welcome back. You are just one step away to your feed.</p>
        <div class="catchy-text">Not a member yet? Join our life‑saving community today!</div>
      </div>
      <div class="button-wrapper">
        <a href="${pageContext.request.contextPath}/register">Sign Up</a>
      </div>
    </div>

    <!-- Right Panel with form -->
    <div class="right-panel">
      <form action="${pageContext.request.contextPath}/login" method="post" class="form-area">
        <h3>Sign In</h3>

        <input type="email" name="email" placeholder="Email" required />
        <input type="password" name="password" placeholder="Password" required />

        <div class="options">
          <a href="#">Forgot Password?</a>
        </div>

        <div class="button-wrapper">
          <button type="submit">Sign In</button>
        </div>

        <p class="error-message">
          <%= request.getAttribute("errorMessage") != null 
              ? request.getAttribute("errorMessage") 
              : "" %>
        </p>
      </form>
    </div>
  </div>
</body>
</html>