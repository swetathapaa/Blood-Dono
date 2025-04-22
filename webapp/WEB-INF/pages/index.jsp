<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<div class="gradient"></div>
	<header>
  <nav>
            <div class="nav">
                <a href="#" class="logo"><div></div> Blood Dono</a>
                <div>
                    <ul>
                        <a href="${pageContext.request.contextPath}/home">
                            <li class="selected">Home</li>
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
                            <li>Contact</li>
                        </a>
                        <a href="${pageContext.request.contextPath}/login">
                            <li>Log in</li>
                        </a>
                    </ul>
                </div>
            </div>
        </nav>

		<section class="hero-section">
			<div class="hero-content">
				<div class="hero-text">
					<h1 class="h">Donate blood, save life!</h1>
					<p>Your donation can make a lifesaving difference. Every drop
						counts in our mission to help patients in need of blood
						transfusions during emergencies, surgeries, and treatments.</p>
					<button class="donate-cta">
						Donate Now
						<div class="cta-arrow">
							<i class="fa-solid fa-arrow-right"></i>
						</div>
					</button>
				</div>
				<div class="hero-img">
					<img src="${pageContext.request.contextPath}/images/hero-img1.jpg" alt="image">
				</div>
			</div>
		</section>
	</header>

	<section class="divider">
		<div class="divider-content">
			<div class="divider-text">
				<h2 class="h">We are helping people from 10 years</h2>
				<p>For a decade, Blood Dono has been connecting generous donors
					with patients in critical need. With over 50,000 successful
					donations and countless lives saved, we continue our mission to
					ensure blood availability for everyone.</p>
			</div>
			<button class="donate-cta">
				Donate Now
				<div class="cta-arrow">
					<i class="fa-solid fa-arrow-right"></i>
				</div>
			</button>
		</div>
	</section>

	<section class="process-section">
		<div class="process-content">
			<div class="process-text">
				<h2 class="h">Donation process</h2>
				<p>
					Donating blood is a simple four-step process that takes about an
					hour of your time. <br>Follow these easy steps to make a
					difference and potentially save up to three lives with just one
					donation.
				</p>
			</div>
			<div class="cards-container-4c">
				<div class="card4c f-1">
					<div class="h">1</div>
					<h3 class="h">Registration</h3>
					<p>Complete a brief registration form with your personal
						information and medical history for our records and your safety.</p>
				</div>
				<div class="card4c f-2">
					<div class="h">2</div>
					<h3 class="h">Screening</h3>
					<p>Undergo a quick health check including blood pressure,
						pulse, temperature, and hemoglobin level to ensure safe donation.</p>
				</div>
				<div class="card4c f-3">
					<div class="h">3</div>
					<h3 class="h">Donation</h3>
					<p>The actual blood donation takes only 8-10 minutes. You'll be
						seated comfortably while our trained staff collects your blood
						donation.</p>
				</div>
				<div class="card4c f-4">
					<div class="h">4</div>
					<h3 class="h">Refreshment</h3>
					<p>Enjoy light refreshments and rest for 15 minutes before
						leaving. This helps your body adjust to the blood donation.</p>
				</div>
			</div>
		</div>
	</section>

	<section class="article-section">
		<div class="article-container">
			<div class="heading">
				<h3 class="h">Articles</h3>
				<p class="h">See all</p>
			</div>
			<div class="cards-container-3c">
				<div class="card3c t-1">
					<img src="${pageContext.request.contextPath}/images/img-1.jpg" alt="">
					<div class="card-text">
						<p>
							<i class="fa-solid fa-calendar"></i> 14 June, 2020
						</p>
						<h3 class="h">World blood donor's day</h3>
						<h6>Join us in celebrating the heroic contributions of blood
							donors worldwide and learn how you can participate...</h6>
						<h5>
							<i class="fa-solid fa-sun"></i> Pokhara, Nepal
						</h5>
					</div>
				</div>
				<div class="card3c">
					<img src="${pageContext.request.contextPath}/images/img-2.jpg" alt="">
					<div class="card-text">
						<p>
							<i class="fa-solid fa-calendar"></i> 17 June, 2020
						</p>
						<h3 class="h">Benefits of regular donation</h3>
						<h6>Discover the surprising health benefits of regular blood
							donation, from reducing iron levels to improving cardiovascular
							health...</h6>
						<h5>
							<i class="fa-solid fa-sun"></i> Kathmandu, Nepal
						</h5>
					</div>
				</div>
				<div class="card3c">
					<img src="${pageContext.request.contextPath}/images/img-3.jpg" alt="">
					<div class="card-text">
						<p>
							<i class="fa-solid fa-calendar"></i> 24 June, 2020
						</p>
						<h3 class="h">Blood types explained</h3>
						<h6>Understanding blood types is crucial for successful
							transfusions. Learn about the ABO system and why compatibility
							matters...</h6>
						<h5>
							<i class="fa-solid fa-sun"></i> Lumbini, Nepal
						</h5>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="gradient f-g">
		<div class="footer">
			<div class="footer-text">
				<h6>Appointment</h6>
				<h2 class="h">
					Good to know <br>helpful information
				</h2>
				<div>
					<div class="cta-arrow bullet">
						<i class="fa-solid fa-arrow-right"></i>
					</div>
					Maintain a healthy iron level by eating iron-rich foods like lean
					meat, beans, and leafy greens.
				</div>
				<div>
					<div class="cta-arrow bullet">
						<i class="fa-solid fa-arrow-right"></i>
					</div>
					Stay hydrated by drinking plenty of water before and after
					donation.
				</div>
				<div>
					<div class="cta-arrow bullet">
						<i class="fa-solid fa-arrow-right"></i>
					</div>
					Get a good night's sleep before donation day and avoid strenuous
					activities afterward.
				</div>
				<div>
					<div class="cta-arrow bullet">
						<i class="fa-solid fa-arrow-right"></i>
					</div>
					Bring a photo ID and list of medications you're taking to your
					appointment.
				</div>
			</div>
			<div>
				<form action="" class="footer-form">
					<input type="text" placeholder="Name"> <input type="email"
						placeholder="Email"> <input type="text"
						placeholder="Address">
					<div class="input-div">
						<input type="date" placeholder="Date" id="short"> <input
							type="time" placeholder="Time" id="short">
					</div>
					<button class="donate-cta footer-cta">
						Appointment Submit
						<div class="cta-arrow">
							<i class="fa-solid fa-arrow-right"></i>
						</div>
					</button>
				</form>
			</div>
		</div>
	</footer>
</body>
</html>