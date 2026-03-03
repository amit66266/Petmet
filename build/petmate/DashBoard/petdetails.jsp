<%@ page import="java.sql.*" %>
<%@ page import="com.net.DAO.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Details</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<%
    String idStr = request.getParameter("id");
    int id = (idStr != null) ? Integer.parseInt(idStr) : -1;
    ResultSet rs = UserDAO.getPetById(id);
    if (rs != null && rs.next()) {
        String name = rs.getString("name");
        String breed = rs.getString("breed");
        int age = rs.getInt("age");
        String gender = rs.getString("gender");
        String description = rs.getString("description");
        String image = rs.getString("image");
        
        String uname = (String) session.getAttribute("uname");
        if (uname == null) {
            out.print("<script>alert('Session Timed Out...'); window.open('../login.jsp','_self');</script>");
        }
%>

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: rgba(44, 90, 160, 0.95); backdrop-filter: blur(10px);">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold fs-3" href="#">
        <i class="fas fa-paw me-2"></i>PetMate - Details
    </a>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="UserDash.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="adoptpet.jsp">Adopt</a></li>
        <li class="nav-item"><a class="nav-link" href="feedback.jsp">Feedbacks</a></li>
        <li class="nav-item">
	          <a class="nav-link">
	          <%= 
	          session.getAttribute("uname")%>
	          </a>
	        </li>
        <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container mt-5">
    <div class="card mb-3 shadow" style="max-width: 900px; margin: auto;">
      <div class="row g-0">
        <div class="col-md-5">
          <img src="<%= image %>" class="img-fluid rounded-start" alt="<%= name %>">
        </div>
        <div class="col-md-7">
          <div class="card-body">
            <h3 class="card-title"><%= name %></h3>
            <p class="card-text"><strong>Breed:</strong> <%= breed %></p>
            <p class="card-text"><strong>Age:</strong> <%= age %> years</p>
            <p class="card-text"><strong>Gender:</strong> <%= gender %></p>
            <p class="card-text"><strong>Description:</strong> <%= description %></p>

            <div class="mt-4 d-flex gap-2">
              
              <a href="feedback.jsp" class="btn btn-warning"><i class="fas fa-edit me-1"></i>Feedback</a>
            </div>
            <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSet" %>
<%
int adoptedStatus = UserDAO.isPetAlreadyAdopted(id);
String adopter = UserDAO.getPetAdopter(id);
%>

<% if (adoptedStatus == 1) { %>
    <button class="btn btn-secondary mt-3" disabled>Adopted by <%= adopter %></button>
<% } else if (adoptedStatus == 0) { %>
    <form method="get" action="payment.jsp?petid=<%= id %>">
        <input type="hidden" name="petid" value="<%= id %>">
        <input type="hidden" name="uname" value="<%= session.getAttribute("uname") %>">
        <button type="submit" class="btn btn-success mt-3">Adopt</button>
    </form>
<% } else { %>
    <p class="text-danger">Error checking adoption status.</p>
<% } %>



          </div>
        </div>
      </div>
    </div>
</div>

<%
    } else {
%>
    <div class="container mt-5 text-center">
        <h3 class="text-danger">Pet not found!</h3>
    </div>
<%
    }
%>

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
