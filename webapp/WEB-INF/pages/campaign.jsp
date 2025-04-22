<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Campaign</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_campaign.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
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
                            <li>About</li>
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

    <a href="./campaign.jsp">
        <div class="sticky-events">
            <div class="cover">See more</div>
            <h4 class="h">Upcoming Events</h4>
            <div class="t-1 sticky-events-card">
                <img src="${pageContext.request.contextPath}/images/Newroad.jpg" alt="Newroad">
                <div class="sticky-text">
                    <p><i class="fa-solid fa-calendar"></i> 14 June, 2020</p>
                    <h6>Emergency blood drive at Newroad community center. All blood types urgently needed...</h6>
                    <h5><i class="fa-solid fa-sun"></i> Newroad, Kathmandu</h5>
                </div>
            </div>
        </div>
    </a>

    <section class="grid">
        <div class="grid-container">
                <div class="grid-ele info">
                        <div class="grid-ele heading">
                            <h2 class="h">Upcoming Campaigns</h2>
                            <p>Join our life-saving blood donation campaigns across Nepal. Every donation can save up to three lives. Check our schedule below and find a donation event near you. No appointment needed—just walk in with your ID card.</p>
                        </div>
                    <a href="${pageContext.request.contextPath}/index.jsp">
                        <div class="grid-ele learn-more">
                            <h2 class="h">Learn more</h2>
                            <p>Discover eligibility requirements and prepare for your donation with our helpful resources.</p>
                        </div>
                    </a>
                    <a href="#contact">
                        <div class="grid-ele contact">
                            <h2 class="h">Contact us</h2>
                            <p>Questions about our campaigns? Reach out to our team for assistance.
                            </p>
                            <p>
                                email : blooddono@abc.np
                            </p>
                            <p>Phone No. 09127830</p>
                        </div>
                    </a>
                </div>
                <a href="./campaign_info.jsp">
                    <div class="grid-ele t-1">
                        <img src="${pageContext.request.contextPath}/images/Newroad.jpg" alt="Newroad">
                        <div class="card-text">
                            <p><i class="fa-solid fa-calendar"></i> 14 June, 2020</p>
                            <h6>Emergency blood drive at Newroad community center. All blood types urgently needed...</h6>
                            <h5><i class="fa-solid fa-sun"></i> Newroad, Kathmandu</h5>
                        </div>
                    </div>
                </a>
                <a href="./campaign_info.jsp">
                    <div class="grid-ele">
                        <img src="${pageContext.request.contextPath}/images/kathmandu.jpg" alt="Kathmandu">
                        <div class="card-text">
                            <p><i class="fa-solid fa-calendar"></i> 17 June, 2020</p>
                            <h6>World Blood Donor Day special event at Durbar Square. Free health checkups for all donors...</h6>
                            <h5><i class="fa-solid fa-sun"></i> Kathmandu, Nepal</h5>
                        </div>
                    </div>
                </a>
                <a href="./campaign_info.jsp">
                    <div class="grid-ele">
                        <img src="${pageContext.request.contextPath}/images/Bhaktapur.jpg" alt="Bhaktapur">
                        <div class="card-text">
                            <p><i class="fa-solid fa-calendar"></i> 24 June, 2020</p>
                            <h6>College students donation drive at Bhaktapur Durbar Square. Special focus on O- blood type...</h6>
                            <h5><i class="fa-solid fa-sun"></i> Bhaktapur, Nepal</h5>
                        </div>
                    </div>
                </a>
                <a href="./campaign_info.jsp">
                    <div class="grid-ele">
                        <img src="${pageContext.request.contextPath}/images/thamel.jpg" alt="Thamel">
                        <div class="card-text">
                            <p><i class="fa-solid fa-calendar"></i> 14 June, 2020</p>
                            <h6>Tourist-friendly donation center in Thamel. International visitors welcome with passport...</h6>
                            <h5><i class="fa-solid fa-sun"></i> Thamel, Kathmandu</h5>
                        </div>
                    </div>
                </a>
                <a href="./campaign_info.jsp">
                    <div class="grid-ele">
                        <img src="${pageContext.request.contextPath}/images/Lalitpur.jpg" alt="Lalitpur">
                        <div class="card-text">
                            <p><i class="fa-solid fa-calendar"></i> 17 June, 2020</p>
                            <h6>Corporate blood donation day at Lalitpur business hub. Refreshments and souvenirs provided...</h6>
                            <h5><i class="fa-solid fa-sun"></i> Lalitpur, Nepal</h5>
                        </div>
                    </div>
                </a>
                <a href="./campaign_info.jsp">
                    <div class="grid-ele">
                        <img src="${pageContext.request.contextPath}/images/Dhangadi.jpeg" alt="Dhangadi">
                        <div class="card-text">
                            <p><i class="fa-solid fa-calendar"></i> 24 June, 2020</p>
                            <h6>Rural healthcare initiative bringing blood donation services to Dhangadi community center...</h6>
                            <h5><i class="fa-solid fa-sun"></i> Dhangadi, Nepal</h5>
                        </div>
                    </div>
                </a>
                <a href="./campaign_info.jsp">
                    <div class="grid-ele">
                        <img src="${pageContext.request.contextPath}/images/Pokhara.jpg" alt="Pokhara">
                        <div class="card-text">
                            <p><i class="fa-solid fa-calendar"></i> 14 June, 2020</p>
                            <h6>Lakeside donation event with free boat rides for donors. Family-friendly event with activities...</h6>
                            <h5><i class="fa-solid fa-sun"></i> Pokhara, Nepal</h5>
                        </div>
                    </div>
                </a>
                <a href="./campaign_info.jsp">
                    <div class="grid-ele">
                        <img src="${pageContext.request.contextPath}/images/Ilam.jpg" alt="Ilam">
                        <div class="card-text">
                            <p><i class="fa-solid fa-calendar"></i> 17 June, 2020</p>
                            <h6>Tea plantation special event. Donors receive exclusive tea samples from local estates...</h6>
                            <h5><i class="fa-solid fa-sun"></i> Ilam, Nepal</h5>
                        </div>
                    </div>
                </a>
                <a href="./campaign_info.jsp">
                    <div class="grid-ele">
                        <img src="${pageContext.request.contextPath}/images/Lumbini.jpg" alt="Lumbini">
                        <div class="card-text">
                            <p><i class="fa-solid fa-calendar"></i> 24 June, 2020</p>
                            <h6>Peace and compassion donation drive at Lumbini gardens. Meditation session for donors...</h6>
                            <h5><i class="fa-solid fa-sun"></i> Lumbini, Nepal</h5>
                        </div>
                    </div>
                </a>
                <a href="./campaign_info.jsp">
                    <div class="grid-ele">
                        <img src="${pageContext.request.contextPath}/images/Dolpa.jpeg" alt="Dolpa">
                        <div class="card-text">
                            <p><i class="fa-solid fa-calendar"></i> 24 June, 2020</p>
                            <h6>Remote area medical camp with blood donation services. Helicopter transport of donations...</h6>
                            <h5><i class="fa-solid fa-sun"></i> Dolpa, Nepal</h5>
                        </div>
                    </div>
                </a>
        </div>
    </section>

    <footer class="gradient f-g" id="contact">
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
</body>
</html>