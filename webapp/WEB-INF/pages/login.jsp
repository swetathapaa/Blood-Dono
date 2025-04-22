<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Blood Dono Login/Register</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      background: #f8f9fa;
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      position: relative;
      overflow-x: hidden;
    }

    .bubble {
      position: absolute;
      border-radius: 50%;
      background: rgba(255, 75, 92, 0.2);
      z-index: 0;
    }

    .bubble1 {
      width: 200px;
      height: 200px;
      top: -50px;
      left: -50px;
    }

    .bubble2 {
      width: 300px;
      height: 300px;
      bottom: -100px;
      right: -100px;
    }

    .bubble3 {
      width: 150px;
      height: 150px;
      top: 20%;
      right: 10%;
    }

    .container {
      display: flex;
      background: #fff;
      border-radius: 20px;
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      width: 90%;
      max-width: 900px;
      z-index: 1;
      flex-direction: row;
    }

    .left-panel {
      background: linear-gradient(135deg, #c31432, #240b36);
      color: white;
      width: 50%;
      padding: 50px 40px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      position: relative;
    }

    .left-panel .logo {
      position: absolute;
      top: 20px;
      left: 20px;
      font-size: 22px;
      font-weight: bold;
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .left-panel .logo::before {
      content: "🩸";
      font-size: 20px;
    }

    .left-panel-content {
      text-align: center;
      margin-top: 80px;
    }

    .left-panel-content h2 {
      font-size: 28px;
      margin-bottom: 10px;
    }

    .left-panel-content p {
      font-size: 14px;
      margin-bottom: 15px;
      padding: 0 10px;
    }

    .left-panel-content .catchy-text {
      font-size: 16px;
      margin-top: 10px;
      font-style: italic;
      color: #ffbaba;
    }

    .button-wrapper {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-top: 30px;
    }

    .button-wrapper a,
    .button-wrapper button {
      display: inline-block;
      padding: 12px 30px;
      background: #ff4b5c;
      color: white;
      text-align: center;
      border: none;
      border-radius: 10px;
      font-weight: bold;
      cursor: pointer;
      font-size: 15px;
      width: 100%;
      max-width: 200px;
      text-decoration: none;
    }

    .right-panel {
      width: 50%;
      padding: 50px 40px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .form-area {
      display: flex;
      flex-direction: column;
    }

    .right-panel h3 {
      font-size: 22px;
      margin-bottom: 20px;
      color: #333;
      text-align: center;
    }

    .right-panel input {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border-radius: 10px;
      border: 1px solid #ccc;
      font-size: 14px;
    }

    .options {
      display: flex;
      justify-content: flex-end;
      font-size: 13px;
      margin: 10px 0;
      color: #777;
    }

    .options a {
      text-decoration: none;
      color: #ff4b5c;
      font-weight: bold;
    }

    .right-panel .button-wrapper button {
      background: #c31432;
    }

    @media (max-width: 768px) {
      .container {
        flex-direction: column;
        width: 95%;
        margin: 20px;
      }

      .left-panel,
      .right-panel {
        width: 100%;
        padding: 30px;
      }

      .left-panel {
        order: 2;
      }

      .right-panel {
        order: 1;
      }

      .left-panel .logo {
        top: 10px;
        left: 15px;
        font-size: 20px;
      }
    }
  </style>
</head>
<body>
  <div class="bubble bubble1"></div>
  <div class="bubble bubble2"></div>
  <div class="bubble bubble3"></div>

  <div class="container">
    <div class="left-panel">
      <div class="logo">Blood Dono</div>
      <div class="left-panel-content">
        <h2>Hey There!</h2>
        <p>Welcome back. You are just one step away to your feed.</p>
        <div class="catchy-text">Not a member yet? Join our life-saving community today!</div>
      </div>
      <div class="button-wrapper">
        <a href="${pageContext.request.contextPath}/signup">Sign Up</a>
      </div>
    </div>

    <div class="right-panel">
      <div class="form-area">
        <h3>Sign In</h3>
        <input type="email" placeholder="Email" />
        <input type="password" placeholder="Password" />
        <div class="options">
          <a href="#">Forgot Password?</a>
        </div>
      </div>
      <div class="button-wrapper">
        <button>Sign In</button>
      </div>
    </div>
  </div>
</body>
</html>
