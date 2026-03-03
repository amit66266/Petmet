<%@ page import="com.net.DAO.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PetMate Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #f4f7fc;
        }
        .card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            transition: 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>

<%
String uname = (String) session.getAttribute("uname");
if (uname == null) {
    out.print("<script>alert('Session Timed Out...'); window.open('../login.jsp','_self');</script>");
}
int adoptionCount = UserDAO.getAdoptionCount(uname);
%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: rgba(44, 90, 160, 0.95);">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold fs-3" href="#"><i class="fas fa-paw me-2"></i>PetMate</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="adoptpet.jsp">Adopt</a></li>
        <li class="nav-item"><a class="nav-link" href="feedback.jsp">Feedbacks</a></li>
        <li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-user me-1"></i> <%= uname %></a></li>
        <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container mt-5">
    <h2 class="mb-4 text-center">Welcome, <%= uname %> 🐾</h2>

    <div class="row g-4">

        <div class="col-md-4">
            <div class="card text-white bg-success h-100">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-heart me-2"></i>Your Adoptions</h5>
                    <p class="display-6 fw-bold"><%= adoptionCount %></p>
                    <a href="viewadoptions.jsp" class="btn btn-light mt-2">View</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card text-white bg-warning h-100">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-comment-dots me-2"></i>Give Feedback</h5>
                    <p class="text-light">Share your experience with us. Since, your feedback matters.</p>
                    <a href="feedback.jsp" class="btn btn-light mt-2">Write Now</a>
                </div>
            </div>
        </div>

		<div class="col-md-4">
    <div class="card text-white bg-info h-100 shadow">
        <div class="card-body">
            <h5 class="card-title"><i class="fas fa-paw me-2"></i>Adopt a Pet</h5>
            <p class="text-light">Find your perfect companion and give them a loving home.</p>
            <a href="adoptpet.jsp" class="btn btn-light mt-2">Adopt Now</a>
        </div>
    </div>
</div>
		
       

    </div>

    <div class="mt-5 text-center">
        <a href="adoptpet.jsp" class="btn btn-outline-primary me-3"><i class="fas fa-search"></i> Browse Pets</a>
    </div>
</div>
<div class="container" style="
    height: 100px;"></div>
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
                        <li><a href="../index.jsp" class="text text-decoration-none">Home</a></li>
                        <li><a href="../index.jsp#pets" class="text text-decoration-none">Browse Pets</a></li>
                        <li><a href="../index.jsp#process" class="text text-decoration-none">Adoption Process</a></li>
                        <li><a href="../index.jsp#about" class="text text-decoration-none">About Us</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-6">
                    <h6 class="fw-bold mb-3">Services</h6>
                    <ul class="list-unstyled">
                        <li><a href="adoptpet.jsp" class="text text-decoration-none">Pet Adoption</a></li>
                        <li><a href="adoptpet.jsp" class="text text-decoration-none">Adopt</a></li>
                        <li><a href="../register.jsp" class="text text-decoration-none">Register</a></li>
                        <li><a href="../login.jsp" class="text text-decoration-none">Login</a></li>
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
