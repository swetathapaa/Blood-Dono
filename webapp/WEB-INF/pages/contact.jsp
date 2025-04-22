<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Blood Donation | Contact & FAQs</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css" />
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
    <!-- Navbar -->
   <nav>
            <div class="nav">
                <a href="#" class="logo"><div></div> Blood Dono</a>
                <div>
                    <ul>
                        <a href="${pageContext.request.contextPath}/home">
                            <li>Home</li>
                        </a>
                        <a href="${pageContext.request.contextPath}/about">
                            <li>About</li>
                        </a>
                        <a href="${pageContext.request.contextPath}/campaign">
                            <li>Campaign</li>
                        </a>
                        <a href="${pageContext.request.contextPath}/blog">
                            <li>Blog</li>
                        </a>
                        <a href="${pageContext.request.contextPath}/contact">
                            <li class="selected">Contact</li>
                        </a>
                        <a href="${pageContext.request.contextPath}/login">
                            <li>Log in</li>
                        </a>
                    </ul>
                </div>
            </div>
        </nav>


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
          <form>
            <div class="form-group">
              <label for="name">Name:</label>
              <input
                id="name"
                type="text"
                placeholder="Your Full Name"
                required
              />
            </div>
            <div class="form-group">
              <label for="phone">Phone:</label>
              <input
                id="phone"
                type="tel"
                placeholder="+977 98XXXXXXXX"
                required
              />
            </div>
            <div class="form-group">
              <label for="email">Email:</label>
              <input
                id="email"
                type="email"
                placeholder="your@email.com"
                required
              />
            </div>
            <div class="form-group">
              <label for="blood-type">Blood Type:</label>
              <input
                id="blood-type"
                type="text"
                placeholder="A+, B-, O+, etc."
              />
            </div>
            <div class="form-group">
              <label for="message">Message:</label>
              <textarea
                id="message"
                placeholder="Write your message here..."
                required
              ></textarea>
            </div>
            <button type="submit">Send Message</button>
          </form>
          <p style="margin-top: 20px; color: #555">
            We will contact you within 24 hours. Thanks for your inquiry.
          </p>
        </div>
      </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
      <div class="footer-container">
        <!-- Logo + Mission -->
        <div style="flex: 1; min-width: 220px">
          <h3>Blood Dono 🩸</h3>
          <p>
            Your one drop can be someone's lifeline. Join us in saving lives.
          </p>
        </div>

        <!-- Quick Links -->
        <div
          class="footer-column"
          style="flex: 1; min-width: 100px; padding-right: 0px"
        >
          <h4>Quick Links</h4>
          <li><a href="home.jsp">Home </a></li>
          <li><a href="campaign.jsp">Campaigns</a></li>
          <li><a href="contact.jsp">FAQs</a></li>
          <li><a href="contact.jsp">Contact</a></li>
          <li><a href="blog.jsp">Success Stories</a></li>
        </div>

        <!-- Contact Info -->
        <div style="flex: 1; min-width: 300px; padding-left: 0px">
          <h4>Contact 📞</h4>
          <p>Email: support@blooddono.org</p>
          <p>Phone: +977 9800000000</p>
          <p>Location: Kathmandu, Nepal</p>
        </div>
        <div style="flex: 1; min-width: 100px; padding-bottom: 0px">
          <h4>Lets Connect</h4>
          <a href="https://facebook.com" target="_blank">
            <img
              class="icon"
              src="https://cdn-icons-png.flaticon.com/512/733/733547.png"
              alt="Facebook"
            />
          </a>
          <a href="https://instagram.com" target="_blank">
            <img
              class="icon"
              src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png"
              alt="Instagram"
            />
          </a>
          <a href="https://x.com" target="_blank">
            <img
              class="icon"
              src="https://cdn-icons-png.flaticon.com/512/5968/5968958.png"
              alt="X Twitter"
            />
          </a>
        </div>
      </div>
      <div class="footer-bottom">© 2025 Blood Dono. All rights reserved.</div>
    </footer>
  </body>
</html>