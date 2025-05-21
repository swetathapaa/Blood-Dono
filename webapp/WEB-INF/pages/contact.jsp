<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8" />
    <meta name="viewport"/>
    <title>Blood Donation | Contact & FAQs</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_common.css" />
    <script>
      document.addEventListener("DOMContentLoaded", () => {
        document.querySelectorAll(".faq-question").forEach((question) => {
          question.addEventListener("click", () => {
            const item = question.parentElement;
            item.classList.toggle("active");
          });
        });
      });
    </script>
  </head>
  <body>
    <%@ include file="nav.jsp" %>
    <!-- Main Content -->
    <div class="page-wrapper">
      <div class="container">
        <!-- FAQ Section -->
        <div class="faq-section">
          <h2>FAQs About Blood Donation</h2>
          <div class="faq-item">
            <div class="faq-question">
              Who can donate blood?
              <span class="arrow">▼</span>
            </div>
            <div class="faq-answer">
              Anyone between 18–65 years old, weighing over 50kg, and in good
              health can donate blood.
            </div>
          </div>
          <div class="faq-item">
            <div class="faq-question">
              How often can I donate blood?
              <span class="arrow">▼</span>
            </div>
            <div class="faq-answer">
              You can donate whole blood every 3 months (males) and every 4
              months (females).
            </div>
          </div>
          <div class="faq-item">
            <div class="faq-question">
              Is donating blood safe?
              <span class="arrow">▼</span>
            </div>
            <div class="faq-answer">
              Yes, we use sterile equipment and trained professionals for each
              donation.
            </div>
          </div>
          <div class="faq-item">
            <div class="faq-question">
              Can I request blood for someone in need?
              <span class="arrow">▼</span>
            </div>
            <div class="faq-answer">
              Absolutely. Just fill out the contact form and mention the blood
              type and urgency.
            </div>
          </div>
          <div class="faq-item">
            <div class="faq-question">
              Do I get paid for donating?
              <span class="arrow">▼</span>
            </div>
            <div class="faq-answer">
              No, blood donation is voluntary and non-remunerated. It’s a gift
              of life.
            </div>
          </div>
        </div>

        <!-- Contact Form -->
       <div class="contact-form">
  <h2>Need Blood or Want to Donate?</h2>

  <% 
    String successMsg = (String) request.getAttribute("successMessage");
    if (successMsg != null) {
  %>
      <div class="success-msg"><%= successMsg %></div>
  <%
    } 
  %>

  <form method="post" action="contact">

            <div class="form-group">
              <label for="name">Name:</label>
              <input
                name="name"
                type="text"
                placeholder="Your Full Name"
                required
              />
            </div>
            <div class="form-group">
              <label for="phone">Phone:</label>
              <input
                name="phone"
                type="tel"
                placeholder="+977 98XXXXXXXX"
                required
              />
            </div>
            <div class="form-group">
              <label for="email">Email:</label>
              <input
                name="email"
                type="email"
                placeholder="your@email.com"
                required
              />
            </div>
            <div class="form-group">
              <label for="blood-type">Blood Type:</label>
              <input
                name="blood-type"
                type="text"
                placeholder="A+, B-, O+, etc."
              />
            </div>
            <div class="form-group">
              <label for="message">Message:</label>
              <textarea
                name="message"
                placeholder="Write your message here..."
                required
              ></textarea>
            </div>
            <button type="submit">Send Message</button>
          </form>
          <p style="margin-top: 20px; color: #555">
            Please let us know how we can help you.
          </p>
        </div>
      </div>
    </div>

 <%@ include file="footer.jsp" %>
  </body>
</html>