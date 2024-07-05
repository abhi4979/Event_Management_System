<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eventify - Event Management System</title>

<style>
/* Existing CSS here */

body {
    font-family: Arial, sans-serif;
    background-color: #fff;
    color: #333;
    margin: 0;
    padding: 0;
    text-align: center;
    position: relative;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    background-size: cover;
    background-position: center;
}

header {
    height: 28px;
    padding: 20px 0;
    color: white;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.8);
    background-color: #87CEFA;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.logo-container {
    display: flex;
    align-items: center;
    margin-left: 20px;
}

.logo {
    font-size: 45px;
    font-weight: bold;
    color: black;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.logo-highlight {
    color: #ffc107; 
}

.nav {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 30px;
    flex-grow: 1;
}

.nav a {
    font-size: 23px;
    text-decoration: none;
    color: black;
    margin: 0 10px;
}

.nav a:hover {
    text-decoration: underline;
}

.project {
    position: relative;
    margin: 20px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    width: 70px;
    height: 15px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    transition: transform 0.2s;
    background-color: none;
}

.project:hover {
    transform: scale(1.05);
}

.project p {
    font-size: 23px;
    height: 20px;
    margin: 0;
    color: black;
}

.project:hover .options {
    display: block;
}

.options {
    display: none;
    position: absolute;
    width: 250px;
    height: 170px;
    background-color: #fff;
    padding: 10px;
    text-align: left;
    top: 100%;
    left: 0;
    border-radius: 0 0 10px 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    z-index: 1;
    background-color: #87CEFA;
}

.options a {
    display: block;
    text-decoration: none;
    color: black;
    margin: 5px 0;
    font-size: 20px;
}

.options a:hover {
    text-decoration: underline;
}

#d2 {
    width: 150px;
    height: 160px;
}

#d3 {
    width: 150px;
    height: 160px;
}

#d4 {
    width: 150px;
    height: 80px;
}

#restaurant {
    width: 210px;
}

.btn {
    border-radius: 7%;
    margin-left: 20px;
    text-decoration: none;
    transition: transform 0.2s;
}

.btn:hover {
    transform: scale(1.05);
}
#main_container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 600px;
    width: 93%;
    margin-top: 10px;
    margin-left: 50px;
}

#main_container .content {
    width: 60%;
    text-align: left;
}

#main_container h1 {
    font-size: 50px;
    animation: fadeIn 3s ease-in-out;
}

#main_container p {
    font-size: 30px;
    font-family: Copperplate, Papyrus, fantasy;
}

#main_container button {
    border-radius: 7%;
   
    transition: transform 0.2s;
    font-size: 30px;
    background-color: #0066cc;
    
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    margin-left: 30px;
}
#main_container button a{
color: black;
 text-decoration: none;
}

#main_container button:hover {
    transform: scale(1.05);
}

#evnt {
    width: 35%;
}

.event-image {
    width: 100%;
    height: auto;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.event-image:hover {
    transform: scale(1.05);
}

.new-section {
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 600px;
    width: 93%;
    margin-top: 10px;
    margin-left: 10px;
    
   
}

.new-section .content {
    width: 400px; 
    text-align: left;
    padding: 60px; 
   border-radius: 0 0 10px 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    z-index: 1;
}

.new-section img {
    width: 500px; 
    height: 300px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    
    margin-left: 80px; 
}


.new-section h2,
.new-section p,
.new-section button {
    opacity: 1;
    transform: translateY(20px);
    transition: opacity 1s ease, transform 1s ease;
}

.new-section.visible h2,
.new-section.visible p,
.new-section.visible button {
    opacity: 1;
    transform: translateY(0);
}


@keyframes fadeIn {
    0% {
        opacity: 0;
        transform: translateY(-20px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}
 .six-div-section {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin-top: 50px;
  }

  .upper-row,
  .lower-row {
    display: flex;
    justify-content: space-around;
    width: 80%; 
    margin-bottom: 20px; 
  }

  .container {
    width: 30%; 
    margin: 0 10px;
    text-align: center;
  }

  .container img {
    width: 100%;
    height: auto;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s;
  }

  .container img:hover {
    transform: scale(1.05);
  }

footer {
    background-color: #778899;
    color: #333;
    padding: 20px;
    text-align: center;
    width: 100%;
    box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.2);
    font-size: 14px;
    margin-top: 400px;
}

footer a {
    color: #fff;
    text-decoration: none;
}

footer a:hover {
    text-decoration: underline;
}

.footer-links {
    margin-top: 10px;
    display: flex;
    justify-content: center;
    gap: 20px;
    font-size: 16px;
}

</style>
</head>
<body>
    <header>
        <div class="logo-container">
            <!-- Updated logo with a styled text -->
            <span class="logo">Event<span class="logo-highlight">ify</span></span>
        </div>
        <div class="nav">
            <a href="HomeProject.jsp" id="home">Home</a>
            <div class="project">
                <p>Resources</p>
                <div class="options" id="d1">
                    <a href="https://www.cvent.com/en/resources">All Resources</a>
                    <a href="https://www.cvent.com/en/blog">Blog</a>
                    <a href="https://web.cvent.com/eventsplus/0a191bdc-46ea-47bb-921a-69d252ad21e3/upcomingevents?cvt_cal_calendarId=2402d010-8588-4fba-a3fc-e684ce562ab7">Event</a>
                    <a href="https://www.cvent.com/en/podcast">Podcasts</a>
                    <a href="https://web.cvent.com/eventsplus/0a191bdc-46ea-47bb-921a-69d252ad21e3/upcomingevents?cvt_cal_calendarId=2402d010-8588-4fba-a3fc-e684ce562ab7&cvt_cal_filters=%5B%7B%22type%22%3A%22checkbox%22%2C%22field%22%3A%22f92543ff-cabd-454e-b582-65df803329ac%22%2C%22values%22%3A%5B%22Webinar%22%5D%7D%5D">Webinar</a>
                </div>
            </div>
            <div class="project">
                <p>Company</p>
                <div class="options" id="d2">
                    <a href="https://www.cvent.com/en/company-overview">About Us</a>
                    <a href="https://careers.cvent.com/">Career</a>
                    <a href="https://www.cvent.com/en/contact-us">Contact</a>
                    <a href="https://www.cvent.com/en/become-partner">Partner</a>
                    <a href="https://www.cvent.com/en/security">Security</a>
                </div>
            </div>
            <div class="project">
                <p>Support</p>
                <div class="options" id="d3">
                    <a href="https://community.cvent.com/home">Course</a>
                    <a href="https://support.cvent.com/s/knowledgebase">Knowledge base</a>
                    <a href="https://www.cvent.com/en/support/event-services">Services</a>
                    <a href="https://www.cvent.com/en/academy">Training</a>
                    <a href="https://www.cvent.com/en/cvent-certification">Certification</a>
                </div>
            </div>
            <div class="project" id="restaurant">
                <p>Event Organizer</p>
                <div class="options" id="d4">
                    <a href="addorganizer">Register</a>
                    <a href="OrganizerLogin.jsp">Login</a>
                </div>
            </div>
            <div class="project" id="restaurant">
                <p>Admin</p>
                <div class="options" id="d4">
                    <a href="addadmin">Register</a>
                    <a href="adminlogin.jsp">Login</a>
                </div>
            </div>
        </div>
    </header>
    <main>
        <div id="main_container">
            <div class="content">
                <h1>Welcome to Eventify</h1>
                <p><b>Welcome to Eventify, your go-to platform for organizing and managing all types of events seamlessly.
                    Whether you're planning a corporate conference, a wedding, a concert, or a small gathering, Eventify is here to help you every step of the way.</b>
                </p>
                <button><a href="adduser">Explore this Platform</a></button>
            </div>
            <div id="evnt">
                <img src="https://th.bing.com/th/id/R.56ac6d95682bb1f12ba4e4f2112de3c5?rik=xgWGgRaSIO7ZkQ&riu=http%3a%2f%2fhighflyerindia.com%2fimages%2fcorporate-events.jpg&ehk=2dN1cNc4h6F8qFg7SNlQtKARnX5jCbc4JmKDgtyDUpQ%3d&risl=&pid=ImgRaw&r=0"
                alt="Event Image" class="event-image">
            </div>
        </div>
        <div class="new-section">
            <div>
                <img src="https://th.bing.com/th/id/OIP.azYmJPLML7WlexFNH9xVagHaE7?rs=1&pid=ImgDetMain"    alt="Event Image" class="event-image">
            </div>
            <div class="content">
                <h1>Plan Your Event with Ease</h1>
                <p>Our platform provides all the tools you need to create a successful event, from start to finish. 
                   Register now to get started!</p>
            </div>
        </div>
        
        <div class="six-div-section">
          <h1>Here Are Some Events</h1>
    <div class="upper-row">
      <div class="container">
        <img src="https://th.bing.com/th/id/OIP.Sp0x8v2KE4MQVyFDXzWRgAHaE7?rs=1&pid=ImgDetMain"  alt="Image 1">
      </div>
      <div class="container">
        <img src="https://glenreceptions.com/wp-content/uploads/2020/10/corporate-events.jpg"  alt="Image 2">
      </div>
      <div class="container">
        <img src="https://th.bing.com/th/id/OIP.JfNyWBy7gabXSOmA2NHTrgHaE7?rs=1&pid=ImgDetMain"  alt="Image 3">
      </div>
    </div>
    <div class="lower-row">
      <div class="container">
        <img src="https://i.pinimg.com/originals/8e/07/80/8e078013204d0cc9876e9edbb1fd3f85.jpg"  alt="Image 4">
      </div>
      <div class="container">
        <img src="https://www.focuseventphotography.com/wp-content/uploads/2019/12/corporate-events-photographer-mirage-las-vegas.jpg" alt="Image 5">
      </div>
      <div class="container">
        <img src="https://th.bing.com/th/id/OIP.cqQIlc_vHUrWiuRoYLn_mAHaE8?w=600&h=400&rs=1&pid=ImgDetMain"  alt="Image 6">
      </div>
    </div>
  </div>
        
    </main>
    <footer>
        <div class="footer-links">
            <a href="https://www.cvent.com/en/contact-us">Contact</a>
            <a href="mailto:support@bitebuddy.com">Email</a>
            <a href="https://www.cvent.com/en/company-overview">About Us</a>
        </div>
        <p><b>© 2024 Condé Nast. All rights reserved. The New Yorker may earn a portion of sales from products that are purchased through our site as part of our Affiliate Partnerships with retailers. The material on this site may not be reproduced, distributed, transmitted, cached or otherwise used, except with the prior written permission of Condé Nast.</b></p>
        <p><a href="https://www.cvent.com/en/privacy-policy">Privacy Policy</a> | <a href="https://www.cvent.com/en/product-terms-of-use">Terms and Conditions</a></p>
    </footer>
    
</body>
</html>
