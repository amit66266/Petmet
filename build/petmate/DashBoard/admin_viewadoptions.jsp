<%@ page import="com.net.DAO.UserDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Adopted Pets - Admin</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>

<%
String uname = (String) session.getAttribute("uname");
if (uname == null) {
    out.print("<script>alert('Session Timed Out...'); window.open('../login.jsp','_self');</script>");
    return;
}

ResultSet rs = UserDAO.getAdoptedPets(); 
%>

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: rgba(44, 90, 160, 0.95); backdrop-filter: blur(10px);">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold fs-3" href="#">
        <i class="fas fa-paw me-2"></i>PetMate - Details
    </a>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
	        <li class="nav-item">
	          <a class="nav-link" href="AdminDash.jsp">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="admin_adoptpet.jsp">Adopt</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="viewrecord.jsp">View Record</a>
	        </li>
	        <li class="nav-item"><a class="nav-link" href="admin_feedback.jsp">Feedbacks</a></li>
	        <li class="nav-item">
	          <a class="nav-link">
	          <%= 
	          session.getAttribute("uname")%>
	          </a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="logout.jsp">Logout</a>
	        </li>
	      </ul>
    </div>
  </div>
</nav>

<div class="container mt-5">
    <h2 class="mb-4 text-center">All Adopted Pets</h2>
    <div class="row">
        <%
            boolean hasData = false;
            while (rs != null && rs.next()) {
                hasData = true;
        %>
        <div class="col-md-4 mb-4">
            <div class="card shadow">
                <img src="<%= rs.getString("image") %>" class="card-img-top" alt="Pet Image" style="height:250px; object-fit:cover;">
                <div class="card-body">
                    <h5 class="card-title"><%= rs.getString("name") %></h5>
                    <p class="card-text"><%= rs.getString("description") %></p>
                    <p class="card-text"><strong>Breed:</strong> <%= rs.getString("breed") %></p>
                    <p class="card-text"><strong>Age:</strong> <%= rs.getInt("age") %> years</p>
                    <p class="card-text"><strong>Gender:</strong> <%= rs.getString("gender") %></p>
                    <p class="card-text text-success fw-bold">
                        Adopted by <%= rs.getString("adopter_name") %> (<%= rs.getString("username") %>)
                    </p>

                    <form action="admin_deleteadoption.jsp" method="post" onsubmit="return confirm('Are you sure you want to delete this adoption record?');">
                        <input type="hidden" name="adoption_id" value="<%= rs.getInt("adoption_id") %>">
                        <button type="submit" class="btn btn-danger btn-sm mt-2">Delete</button>
                    </form>
                </div>
            </div>
        </div>
        <%
            }
            if (!hasData) {
        %>
        <div class="col-12">
            <div class="alert alert-info text-center">
                No adopted pets found.
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
