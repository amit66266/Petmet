<%@ page import="java.sql.*" %>
<%@ page import="com.net.DAO.UserDAO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetMate - Find Your Perfect Companion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c5aa0;
            --secondary-color: #f8a419;
            --accent-color: #e74c3c;
        }
        
        .hero-section {
            background: linear-gradient(135deg, var(--primary-color) 0%, #1e3a5f 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            color: white;
        }
        
        .btn-primary-custom {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            color: #333;
            font-weight: 600;
            padding: 12px 30px;
            border-radius: 50px;
            transition: all 0.3s ease;
        }
        
        .btn-primary-custom:hover {
            background-color: #e6940e;
            border-color: #e6940e;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(248, 164, 25, 0.4);
        }
        
        .btn-outline-custom {
            border: 2px solid white;
            color: white;
            font-weight: 600;
            padding: 12px 30px;
            border-radius: 50px;
            transition: all 0.3s ease;
        }
        
        .btn-outline-custom:hover {
            background-color: white;
            color: var(--primary-color);
            transform: translateY(-2px);
        }
        
        .section-padding {
            padding: 80px 0;
        }
        
        .pet-card {
            border: none;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            height: 100%;
        }
        
        .pet-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }
        
        .pet-card img {
            height: 250px;
            object-fit: cover;
        }
        
        .stats-section {
            background: linear-gradient(135deg, var(--secondary-color) 0%, #f39c12 100%);
            color: white;
        }
        
        .stat-item {
            text-align: center;
            padding: 20px;
        }
        
        .stat-number {
            font-size: 3rem;
            font-weight: bold;
            display: block;
        }
        
        .process-step {
            text-align: center;
            padding: 30px 20px;
            border-radius: 15px;
            background: white;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            height: 100%;
            transition: all 0.3s ease;
        }
        
        .process-step:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
        }
        
        .process-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, var(--primary-color), #1e3a5f);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            color: white;
            font-size: 2rem;
        }
        
        .testimonial-card {
            background: white;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            text-align: center;
            height: 100%;
        }
        
        .testimonial-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin: 0 auto 20px;
            object-fit: cover;
        }
        
        .cta-section {
            background: linear-gradient(135deg, var(--accent-color) 0%, #c0392b 100%);
            color: white;
        }
        
        footer {
            background-color: #2c3e50;
            color: white;
        }
        
        .social-links a {
            color: white;
            font-size: 1.5rem;
            margin: 0 10px;
            transition: color 0.3s ease;
        }
        
        .social-links a:hover {
            color: var(--secondary-color);
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: rgba(44, 90, 160, 0.95); backdrop-filter: blur(10px);">
        <div class="container">
            <a class="navbar-brand fw-bold fs-3" href="#">
                <i class="fas fa-paw me-2"></i>PetMate
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#pets">Pets</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#process">Process</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#about">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Contact</a>
                    </li>
                    <li class="nav-item">
          			<button onClick="login()" type="button" class="btn btn-outline-light">Login</button>
        </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section id="home" class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h1 class="display-3 fw-bold mb-4">Find Your Perfect Furry Companion</h1>
                    <p class="lead mb-4">Give a loving home to pets in need. Browse our adorable animals waiting for their forever families and make a difference in their lives today.</p>
                    <div class="d-flex flex-wrap gap-3">
                        <a href="#pets" class="btn btn-primary-custom btn-lg">
                            <i class="fas fa-search me-2"></i>Browse Pets
                        </a>
                        <a href="#process" class="btn btn-outline-custom btn-lg">
                            <i class="fas fa-info-circle me-2"></i>Learn More
                        </a>
                    </div>
                </div>
                <div class="col-lg-6 text-center">
                    <img src="https://static.vecteezy.com/system/resources/thumbnails/046/300/723/small_2x/cats-and-dog-friends-isolated-on-transparent-background-png.png" alt="Happy pets" class="img-fluid rounded-circle shadow-lg">
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section section-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <span class="stat-number">2,500+</span>
                        <span class="stat-label">Pets Adopted</span>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <span class="stat-number">150+</span>
                        <span class="stat-label">Available Pets</span>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <span class="stat-number">98%</span>
                        <span class="stat-label">Success Rate</span>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <span class="stat-number">5</span>
                        <span class="stat-label">Years Experience</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Pets Section -->
    <section id="pets" class="section-padding bg-light">
        <div class="container">
            <div class="row mb-5">
                <div class="col-lg-8 mx-auto text-center">
                    <h2 class="display-4 fw-bold mb-3">Meet Our Adorable Friends</h2>
                    <p class="lead text-muted">These loving pets are looking for their forever homes. Each one has been cared for and is ready to bring joy to your family.</p>
                </div>
            </div>
            <div class="row row-cols-1 row-cols-md-3 g-4">
	    <%
	        ResultSet rs = UserDAO.getAllPets();
	        while(rs.next()){
	            int id = rs.getInt("id");
	            String name = rs.getString("name");
	            String breed = rs.getString("breed");
	            int age = rs.getInt("age");
	            String gender = rs.getString("gender");
	            String description = rs.getString("description");
	            String image = rs.getString("image");
	    %>
	        <div class="col">
	            <div class="card h-100 shadow-sm">
	                <img src="<%= image %>" class="card-img-top" alt="<%= name %>" style="height: 250px; object-fit: cover;">
	                <div class="card-body">
	                    <h5 class="card-title"><%= name %> - <%= breed %></h5>
	                    <p class="card-text"><%= description %></p>
	                    <p class="card-text">
	                        <small class="text-muted">Age: <%= age %> | Gender: <%= gender %></small>
	                    </p>
	                    <a href="DashBoard/petdetails.jsp?id=<%= id %>" class="btn btn-primary w-100">View Details</a>
	                </div>
	            </div>
	        </div>
	    <%
	        }
	    %>
	    </div>
            <div class="text-center mt-5">
                <a href="login.jsp" class="btn btn-primary-custom btn-lg">
                    <i class="fas fa-paw me-2"></i>View All Pets
                </a>
            </div>
        </div>
    </section>

    <!-- Process Section -->
    <section id="process" class="section-padding">
        <div class="container">
            <div class="row mb-5">
                <div class="col-lg-8 mx-auto text-center">
                    <h2 class="display-4 fw-bold mb-3">Simple Adoption Process</h2>
                    <p class="lead text-muted">We've made pet adoption easy and straightforward. Follow these simple steps to welcome your new family member home.</p>
                </div>
            </div>
            <div class="row g-4">
                <div class="col-lg-3 col-md-6">
                    <div class="process-step">
                        <div class="process-icon">
                            <i class="fas fa-search"></i>
                        </div>
                        <h4 class="fw-bold mb-3">Browse Pets</h4>
                        <p class="text-muted">Explore our available pets and find the perfect match for your lifestyle and preferences.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="process-step">
                        <div class="process-icon">
                            <i class="fas fa-file-alt"></i>
                        </div>
                        <h4 class="fw-bold mb-3">Apply Online</h4>
                        <p class="text-muted">Just click on Adopt and Pay and you're good to meet your pet.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="process-step">
                        <div class="process-icon">
                            <i class="fas fa-handshake"></i>
                        </div>
                        <h4 class="fw-bold mb-3">Meet & Greet</h4>
                        <p class="text-muted">Schedule a visit to meet your potential new pet and see if you're a perfect match.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="process-step">
                        <div class="process-icon">
                            <i class="fas fa-home"></i>
                        </div>
                        <h4 class="fw-bold mb-3">Take Home</h4>
                        <p class="text-muted">Complete the adoption process and welcome your new furry family member home!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="section-padding bg-light">
        <div class="container">
            <div class="row mb-5">
                <div class="col-lg-8 mx-auto text-center">
                    <h2 class="display-4 fw-bold mb-3">Happy Families</h2>
                    <p class="lead text-muted">Read what our adopters have to say about their experience with PetMate and their new furry family members.</p>
                </div>
            </div>
            <div class="row g-4">
                <div class="col-lg-4 col-md-6">
                    <div class="testimonial-card">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF3ybAhk6n7cpR12bUV1OVlk2UKIXefW8kDg&sheight=80&width=80" alt="Sarah Johnson" class="testimonial-avatar">
                        <h5 class="fw-bold mb-2">Sarah Johnson</h5>
                        <div class="text-warning mb-3">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <p class="text-muted">"The adoption process was so smooth and the staff was incredibly helpful. Our new dog Luna has brought so much joy to our family!"</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="testimonial-card">
                        <img src="https://www.famousbirthdays.com/headshots/mike-chen-1.jpg?height=80&width=80" alt="Mike Chen" class="testimonial-avatar">
                        <h5 class="fw-bold mb-2">Mike Chen</h5>
                        <div class="text-warning mb-3">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <p class="text-muted">"PetMate helped us find the perfect cat for our apartment. Mittens is exactly what we were looking for - calm and loving!"</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="testimonial-card">
                        <img src="https://images.squarespace-cdn.com/content/v1/5da74c3f60e88671cdfabe9c/78360e94-e737-4ad4-bf7f-743b81ff1ed7/Emily+headshot+JLSF.jpg?height=80&width=80" alt="Emily Rodriguez" class="testimonial-avatar">
                        <h5 class="fw-bold mb-2">Emily Rodriguez</h5>
                        <div class="text-warning mb-3">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <p class="text-muted">"Amazing organization! They really care about matching pets with the right families. Our rescue dog Charlie is thriving!"</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="section-padding">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <img src="https://static.toiimg.com/thumb/msid-113499597,width-1280,height-720,imgsize-131660,resizemode-6,overlay-toi_sw,pt-32,y_pad-40/photo.jpg" alt="Our mission" class="img-fluid rounded shadow">
                </div>
                <div class="col-lg-6">
                    <h2 class="display-4 fw-bold mb-4">Our Mission</h2>
                    <p class="lead mb-4">At PetMate, we believe every pet deserves a loving home. We're dedicated to connecting abandoned and rescued animals with caring families who will provide them with the love and care they deserve.</p>
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <div class="d-flex align-items-center">
                                <div class="bg-primary rounded-circle p-2 me-3">
                                    <i class="fas fa-heart text-white"></i>
                                </div>
                                <span class="fw-semibold">Compassionate Care</span>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="d-flex align-items-center">
                                <div class="bg-primary rounded-circle p-2 me-3">
                                    <i class="fas fa-shield-alt text-white"></i>
                                </div>
                                <span class="fw-semibold">Health Guaranteed</span>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="d-flex align-items-center">
                                <div class="bg-primary rounded-circle p-2 me-3">
                                    <i class="fas fa-users text-white"></i>
                                </div>
                                <span class="fw-semibold">Perfect Matching</span>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="d-flex align-items-center">
                                <div class="bg-primary rounded-circle p-2 me-3">
                                    <i class="fas fa-clock text-white"></i>
                                </div>
                                <span class="fw-semibold">24/7 Support</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto text-center">
                    <h2 class="display-4 fw-bold mb-4">Ready to Find Your New Best Friend?</h2>
                    <p class="lead mb-4">Join thousands of happy families who have found their perfect pet companion through PetMate. Start your adoption journey today!</p>
                    <div class="d-flex flex-wrap justify-content-center gap-3">
                        <a href="#pets" class="btn btn-light btn-lg">
                            <i class="fas fa-paw me-2"></i>Start Adopting
                        </a>
                        <a href="#contact" class="btn btn-outline-light btn-lg">
                            <i class="fas fa-phone me-2"></i>Contact Us
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="section-padding bg-light">
        <div class="container">
            <div class="row mb-5">
                <div class="col-lg-8 mx-auto text-center">
                    <h2 class="display-4 fw-bold mb-3">Get In Touch</h2>
                    <p class="lead text-muted">Have questions about adoption or want to learn more? We're here to help you every step of the way.</p>
                </div>
            </div>
            <div class="row g-4">
                <div class="col-lg-4">
                    <div class="text-center p-4">
                        <div class="bg-primary rounded-circle p-3 d-inline-flex mb-3">
                            <i class="fas fa-map-marker-alt text-white fs-4"></i>
                        </div>
                        <h5 class="fw-bold">Visit Us</h5>
                        <p class="text-muted">123 Pet Street<br>Animal City, AC 12345</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="text-center p-4">
                        <div class="bg-primary rounded-circle p-3 d-inline-flex mb-3">
                            <i class="fas fa-phone text-white fs-4"></i>
                        </div>
                        <h5 class="fw-bold">Call Us</h5>
                        <p class="text-muted">(555) 123-PETS<br>Mon-Sat: 9AM-6PM</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="text-center p-4">
                        <div class="bg-primary rounded-circle p-3 d-inline-flex mb-3">
                            <i class="fas fa-envelope text-white fs-4"></i>
                        </div>
                        <h5 class="fw-bold">Email Us</h5>
                        <p class="text-muted">amolguptaid@gmail.com<br>amrita98shalu@gmail.com</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="py-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-4">
                    <h5 class="fw-bold mb-3">
                        <i class="fas fa-paw me-2"></i>PetMate
                    </h5>
                    <p class="text">Connecting loving families with pets in need. Every adoption saves a life and creates a forever bond.</p>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6">
                    <h6 class="fw-bold mb-3">Quick Links</h6>
                    <ul class="list-unstyled">
                        <li><a href="#home" class="text text-decoration-none">Home</a></li>
                        <li><a href="#pets" class="text text-decoration-none">Browse Pets</a></li>
                        <li><a href="#process" class="text text-decoration-none">Adoption Process</a></li>
                        <li><a href="#about" class="text text-decoration-none">About Us</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-6">
                    <h6 class="fw-bold mb-3">Services</h6>
                    <ul class="list-unstyled">
                        <li><a href="login.jsp" class="text text-decoration-none">Pet Adoption</a></li>
                        <li><a href="login.jsp" class="text text-decoration-none">Payment</a></li>
                        <li><a href="register.jsp" class="text text-decoration-none">Register</a></li>
                        <li><a href="login.jsp" class="text text-decoration-none">Login</a></li>
                    </ul>
                </div>
            </div>
            <hr class="my-4">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <p class="text mb-0">&copy; 2025 PetMate. All rights reserved.</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <p class="text mb-0">Made with <i class="fas fa-heart text-danger"></i> for pets in need
                    by Amit Singh.</p>
                </div>
            </div>
        </div>
    </footer>
    
    <script>
    function login() {
        location.href = "./login.jsp";
    }
</script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Smooth scrolling for navigation links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });

        // Navbar background on scroll
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.style.backgroundColor = 'rgba(44, 90, 160, 0.95)';
            } else {
                navbar.style.backgroundColor = 'rgba(44, 90, 160, 0.95)';
            }
        });
    </script>
</body>
</html>