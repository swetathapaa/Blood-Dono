<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/blogstyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <title>Blood Donation Blog</title>
</head>
<body>
  <nav>
            <div class="nav">
                <a href="#" class="logo"><div></div> Blood Dono</a>
                <div>
                    <ul>
                        <a href="${pageContext.request.contextPath}/home">
                            <li>Home</li>
                        </a>
                        <a href="${pageContext.request.contextPath}/about">
                            <li >About</li>
                        </a>
                        <a href="${pageContext.request.contextPath}/campaign">
                            <li>Campaign</li>
                        </a>
                        <a href="${pageContext.request.contextPath}/blog">
                            <li class="selected">Blog</li>
                        </a>
                        <a href="${pageContext.request.contextPath}/contact">
                            <li>Contact</li>
                        </a>
                        <a href="${pageContext.request.contextPath}/login">
                            <li>Log in</li>
                        </a>
                    </ul>
                </div>
            </div>
        </nav>

  <section class="hero">
  <div class="hero-card">
    <div class="hero-content">
      <div class="hero-text">
        <h1>Life in Every Drop:<br> Real Stories of Blood Donation</h1>
       </div>
        <div class="slider">
          <div class="slide"><img src="${pageContext.request.contextPath}/images/img-2.jpg" alt="Image 1" class="active"></div>
          <div class="slide"><img src="${pageContext.request.contextPath}/images/img-1.jpg" alt="Image 2"></div>
          <div class="slide"><img src="${pageContext.request.contextPath}/images/hero-img1.jpg" alt="Image 3"></div>
        </div>



    </div>
  </div>
</section>



  <section class="cards-container-3c">
  <div class="card3c">
    <div class="card3c-image">
      <img src="${pageContext.request.contextPath}/images/story1.jpg" alt="Story 1" />
    </div>
    <div class="card3c-content">
      <h2>“The Day a Stranger Saved My Mom”</h2><h5>Posted on March 5, 2022 by Aanvi Khatiwada</h5>
      <p style="text-align: justify;">I never knew how crucial blood donation was until the night my mother was rushed into emergency surgery after a stroke. The hospital told us she needed four units of O-negative blood immediately. We panicked. None of us were a match. It was 11 PM. We called every contact, searched social media, even begged people in the hospital lobby. Within 40 minutes, a complete stranger a 20-year-old engineering student showed up. He had seen our plea on Instagram. He donated without a second thought. That donation saved my mother’s life. Now, I donate every three months. I can’t always return the favor to the same person but I can pay it forward.</p>
    </div>
  </div>

  <div class="card3c reverse">
    <div class="card3c-image">
      <img src="${pageContext.request.contextPath}/images/story2.jpg" alt="Story 2" />
    </div>
    <div class="card3c-content">
      <h2>“My First Blood Donation And Why I’ll Keep Doing It”<br><h5>Posted on September 3, 2022 by Sanjeev Khadka</h5></h2>
      <p style="text-align: justify;">I used to be terrified of needles. For years, I avoided blood drives at my university, even though I knew people needed it. Then, one day, I read a post: “A 7-year-old girl with leukemia needs 3 platelet donors this week. She’s fighting. Are you?” That hit me. I took a deep breath, booked an appointment, and went in. The nurses were incredibly kind. It didn’t hurt nearly as much as I feared. And when it was over, I felt... proud. Someone out there would get better because of me. Since then, I’ve donated four times. I even convinced my friends to join in. If you're nervous I get it. But I promise, it's easier than you think, and more powerful than you know.</p>
    </div>
  </div>

  <div class="card3c">
    <div class="card3c-image">
      <img src="${pageContext.request.contextPath}/images/story3.jpeg" alt="Story 3" />
    </div>
    <div class="card3c-content">
      <h2>“Losing My Brother Made Me a Lifelong Donor”<br><h5>Posted on January 13, 2024 by Bristi Bansyal</h5></h2>
      <p style="text-align: justify;">Two years ago, I lost my younger brother, Sameer, in a motorbike accident. The hospital tried everything, but he lost too much blood on the way. The doctors said, “If we had more O+ units on hand, maybe…”. That “maybe” still haunts me. It made me realize how fragile life is and how something as small as a blood bag can change everything. Since then, I’ve made a promise to donate in Sameer’s name every 90 days. I also organize blood camps every year on his birthday. It helps me heal. It helps others live. So many lives are saved by people who never meet, strangers connected through compassion.</p>
    </div>
  </div>

  <div class="card3c reverse">
    <div class="card3c-image">
      <img src="${pageContext.request.contextPath}/images/story4.jpeg" alt="Story 4" />
    </div>
    <div class="card3c-content">
      <h2>“A Stranger Saved My Daughter<br><h5>Posted on April 13, 2020 by Priya Shah</h5></h2>
      <p style="text-align: justify;">My daughter was only 5 when she was diagnosed with a rare blood disorder. We were devastated, watching her grow weaker each day, her smile fading a little more with every hospital visit. She needed regular transfusions, but one time, her blood type was in critically low supply. We waited anxiously, hours felt like days, every second a heavy weight on our hearts. Just when we were losing hope, we got the call: a donor had just given blood that matched. It felt like a miracle, a complete stranger had saved my little girl. Today, she’s 10 and thriving, full of life, laughter, and dreams. We may never meet her donor, but their selfless act gave us our daughter back. We are forever grateful. Please, donate. You could be someone’s miracle.</p>
    </div>
  </div>

  <div class="card3c">
    <div class="card3c-image">
      <img src="${pageContext.request.contextPath}/images/story5.jpeg" alt="Story 5" />
    </div>
    <div class="card3c-content">
      <h2>“From Patient to Donor”<br><h5>Posted on February 1, 2025 by Priya Shah</h5></h2>
      <p style="text-align: justify;">I was in a terrible accident three years ago. I lost a massive amount of blood and needed multiple emergency transfusions just to survive. Everything was a blur—I drifted in and out, clinging to life. I don’t remember much from those days, but I’ll never forget the nurse who leaned in and whispered, ‘Someone donated so you could live.’ That sentence echoed in my soul. A stranger's quiet act of kindness had saved me. As soon as I recovered and was eligible, I became a donor myself. Giving blood now feels like a full-circle moment—like I'm passing on the second chance I was given. Every time I donate, I imagine the person out there who might get to hug their child, chase their dreams, or simply see another day because of it. If you can donate, please do. You might be saving someone just like me.</p>
    </div>
  </div>
</section>

<section class="donation-tips">
  <h2>Before Your Donation</h2>
  <div class="tips-container">
    <div class="tip-card">
      <img src="${pageContext.request.contextPath}/images/Calendar.png" alt="Calendar Icon" class="tip-icon">
      <h3>Make an <br>Appointment</h3>
      <p>Select a donation type and find a convenient time that works best for you.</p>
    </div>
    <div class="tip-card">
      <img src="${pageContext.request.contextPath}/images/food.png" alt="Fish Icon" class="tip-icon">
      <h3>Get the Dish on <br>Nutrition</h3>
      <p>Have iron-rich foods, such as red meat, fish, poultry, beans, spinach, iron-fortified cereals or raisins.</p>
    </div>
    <div class="tip-card">
      <img src="${pageContext.request.contextPath}/images/bed.png" alt="Bed Icon" class="tip-icon">
      <h3>Be Well Rested <br>and Hydrate</h3>
      <p>Get a good night's sleep the night before your donation, eat healthy foods and drink extra liquids.</p>
    </div>
  </div>
</section>
<section class="donation-day">
  <h2>On the Day of Your Donation</h2>
  <div class="donation-items">
    <div class="donation-item">
      <img src="${pageContext.request.contextPath}/images/appointment.png" alt="Appointment Icon" class="donation-icon">
      <h3>Appointment Information</h3>
      <p>Bring your appointment confirmation (printed or on your phone) for quick check-in.</p>
    </div>
    <div class="donation-item">
      <img src="${pageContext.request.contextPath}/images/photoid.png" alt="Photo ID Icon" class="donation-icon">
      <h3>Photo ID</h3>
      <p>Please bring your donor card, driver’s license or two other forms of identification.</p>
    </div>
    <div class="donation-item">
      <img src="${pageContext.request.contextPath}/images/medication.png" alt="Medication Icon" class="donation-icon">
      <h3>Medication List</h3>
      <p>We’ll need to know about all prescription and over-the-counter medications you’re taking.</p>
    </div>
  </div>
</section>

<section class="donation-after">
  <h2>After Your Donation</h2>
  <div class="donation-items">
    <div class="donation-item">
      <img src="${pageContext.request.contextPath}/images/snack.png" alt="Snack Icon" class="donation-icon">
      <h3>Enjoy a Snack</h3>
      <p>Relax for a few minutes in our refreshment & recovery area — have some cookies or other snacks — you’ve earned it!</p>
    </div>
    <div class="donation-item">
      <img src="${pageContext.request.contextPath}/images/share.png" alt="Tell Others Icon" class="donation-icon">
      <h3>Tell Others About<br>Your Good Deed</h3>
      <p>The gratification of giving blood is a feeling you'll want to share.</p>
    </div>
    <div class="donation-item">
      <img src="${pageContext.request.contextPath}/images/drink.png" alt="Drink Icon" class="donation-icon">
      <h3>Drink Extra<br>Liquids</h3>
      <p>Drink an extra four (8 oz.) glasses of liquids and avoid alcohol over the next 24 hours.</p>
    </div>
  </div>
</section>
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
<script src="${pageContext.request.contextPath}/js/blog.js"></script>
</body>
</html>
