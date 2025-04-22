<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Info</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_info.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                            <li class="selected">About</li>
                        </a>
                        <a href="${pageContext.request.contextPath}/campaign">
                            <li class="selected">Campaign</li>
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
    <section class="main">
        <div class="msg">
            <button onclick="closeMsg()"><i class="fa-solid fa-xmark"></i></button>
            <p><i class="fa-solid fa-circle-check"></i> Appointment registration successful!</p>
        </div>
        <div class="main-container">
            <div class="slider">
                <div class="slide-container">
                    <button class="switch prev" onclick="prevSlide()">&#10094</button>
                    <button class="switch next" onclick="nextSlide()">&#10095</button>
                    <img src="${pageContext.request.contextPath}/images/Newroad.jpg" alt="slide" class="slides" id="s-1">
                    <img src="${pageContext.request.contextPath}/images/hero-img1.jpg" alt="slide" class="slides">
                    <img src="${pageContext.request.contextPath}/images/img-1.jpg" alt="slide" class="slides">
                </div>
                <div class="preview-container">
                    <div><img src="${pageContext.request.contextPath}/images/Newroad.jpg" alt=""></div>
                    <div><img src="${pageContext.request.contextPath}/images/hero-img1.jpg" alt=""></div>
                    <div><img src="${pageContext.request.contextPath}/images/img-1.jpg" alt=""></div>
                </div>
            </div>
            <div class="info">
                <div class="d-t">
                    <h5 class="h"><i class="fa-solid fa-sun"></i> Newroad, Kathmandu</h5>
                    <p class="h"><i class="fa-solid fa-calendar"></i> 14 June, 2020</p>
                </div>
                <div class="appointment">
                    <h2 class="h">Set an Appointment</h2>
                    <div class="form">
                        <input type="text" placeholder="Name">
                        <input type="email" placeholder="Email">
                        <input type="text" placeholder="Address">
                        <div class="info-div">
                            <input type="number" placeholder="Age" id="info-short">
                            <input type="text" placeholder="Blood group" id="info-short">
                        </div>
                            <button class="donate-cta footer-cta" onclick="submit()">Appointment Submit <div class="cta-arrow"><i class="fa-solid fa-arrow-right"></i></div></button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="requirements-section">
        <div class="requirements">
            <h3 class="h">Basic requirements</h3>
            <div><div class="cta-arrow bullet"><i class="fa-solid fa-arrow-right"></i></div> Donors must be at least 16 years old, weigh at least 110 pounds, and be in good health.</div>
            <div><div class="cta-arrow bullet"><i class="fa-solid fa-arrow-right"></i></div> You must not be pregnant or breastfeeding, and must have had at least 8 days since the start of your recent menstruation.</div>
            <div><div class="cta-arrow bullet"><i class="fa-solid fa-arrow-right"></i></div> Donors must also have a hemoglobin level of at least 12.5 g/dL for women and 13.0 g/dL for men, and it cannot be greater than 20 g/dL.</div>
            <div><div class="cta-arrow bullet"><i class="fa-solid fa-arrow-right"></i></div> For males, the minimum height is typically 5'1" and for females, it is 5'3", with a weight of at least 130 pounds and 150 pounds.</div>
            <div><div class="cta-arrow bullet"><i class="fa-solid fa-arrow-right"></i></div> For Power Reds donation, a hemoglobin level of 13.3 g/dL is required regardless of gender.</div>
        </div>
    </section>

    <section class="upcoming-campaigns-section">
        <div class="upcoming-campaigns">
            <div class="h heading-uc">Upcoming Campaigns</div>
            <a href="./campaign.jsp"><div class="cover h">See more</div></a>
                <div class="grid-container">
                    <div class="grid-ele t-1">
                        <img src="${pageContext.request.contextPath}/images/Newroad.jpg" alt="Newroad">
                        <div class="card-text">
                            <p><i class="fa-solid fa-calendar"></i> 14 June, 2020</p>
                            <h6>Emergency blood drive at Newroad community center. All blood types urgently needed...</h6>
                            <h5><i class="fa-solid fa-sun"></i> Newroad, Kathmandu</h5>
                        </div>
                    </div>
                    <div class="grid-ele">
                        <img src="${pageContext.request.contextPath}/images/kathmandu.jpg" alt="Kathmandu">
                        <div class="card-text">
                            <p><i class="fa-solid fa-calendar"></i> 17 June, 2020</p>
                            <h6>World Blood Donor Day special event at Durbar Square. Free health checkups for all donors...</h6>
                            <h5><i class="fa-solid fa-sun"></i> Kathmandu, Nepal</h5>
                        </div>
                    </div>
                    <div class="grid-ele">
                        <img src="${pageContext.request.contextPath}/images/Bhaktapur.jpg" alt="Bhaktapur">
                        <div class="card-text">
                            <p><i class="fa-solid fa-calendar"></i> 24 June, 2020</p>
                            <h6>College students donation drive at Bhaktapur Durbar Square. Special focus on O- blood type...</h6>
                            <h5><i class="fa-solid fa-sun"></i> Bhaktapur, Nepal</h5>
                        </div>
                    </div>
                </div>
        </div>
    </section>

    <footer class="gradient f-g">
        <div class="footer">
            <div class="footer-text">
                <h6>Appointment</h6>
                <h2 class="h">Good to know <br>helpful information</h2>
                <div><div class="cta-arrow bullet"><i class="fa-solid fa-arrow-right"></i></div> Maintain a healthy iron level by eating iron-rich foods like lentils, spinach, and meat.</div>
                <div><div class="cta-arrow bullet"><i class="fa-solid fa-arrow-right"></i></div> Stay hydrated by drinking plenty of water before and after donation.</div>
                <div><div class="cta-arrow bullet"><i class="fa-solid fa-arrow-right"></i></div> Get a good night's sleep before donation day and avoid strenuous activities afterward.</div>
                <div><div class="cta-arrow bullet"><i class="fa-solid fa-arrow-right"></i></div> Bring a photo ID and list of medications you're taking to your appointment.</div>
            </div>
            <div>
                <form action="" class="footer-form">
                    <input type="text" placeholder="Name">
                    <input type="email" placeholder="Email">
                    <input type="text" placeholder="Address">
                    <div class="input-div">
                        <input type="date" placeholder="Date" id="short">
                        <input type="time" placeholder="Time" id="short">
                    </div>
                        <button class="donate-cta footer-cta">Appointment Submit <div class="cta-arrow"><i class="fa-solid fa-arrow-right"></i></div></button>
                </form>
            </div>
        </div>
    </footer>

    <script src="../Js/index.js"></script>
</body>
</html>