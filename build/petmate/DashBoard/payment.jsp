<%@ page import="java.sql.*" %>
<%@ page import="com.net.DAO.UserDAO" %>
<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String uname = (String) session.getAttribute("uname");
    if (uname == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    int petid = Integer.parseInt(request.getParameter("petid"));
    ResultSet rs = UserDAO.getPetById(petid);
    Random rand = new Random();
    int amount = 500 + rand.nextInt(4501);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pet Adoption Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-control::placeholder {
            color: #aaa;
        }
    </style>
</head>
<body style="background-color: #f4f7fc;">
<div class="container mt-5">
    <div class="card shadow-lg">
        <div class="card-header bg-primary text-white">
            <h3>Confirm Adoption and Payment</h3>
        </div>
        <div class="card-body">
            <%
                if (rs.next()) {
            %>
            <div class="row">
                <!-- Pet details -->
                <div class="col-md-5">
                    <img src="<%= rs.getString("image") %>" class="img-fluid rounded mb-3" alt="Pet Image">
                    <h4><%= rs.getString("name") %> (<%= rs.getString("gender") %>)</h4>
                    <p><strong>Breed:</strong> <%= rs.getString("breed") %></p>
                    <p><strong>Age:</strong> <%= rs.getInt("age") %> years</p>
                    <p><strong>Description:</strong> <%= rs.getString("description") %></p>
                    <h5 class="text-success">Adoption Fee: ₹<%= amount %></h5>
                </div>

                <!-- Payment form -->
                <div class="col-md-7">
                    <h5 class="mb-3">Enter Card Details</h5>
                    <form method="post" action="adoptaction.jsp">
                        <input type="hidden" name="petid" value="<%= petid %>">
                        <input type="hidden" name="uname" value="<%= uname %>">

                        <div class="mb-3">
                            <label class="form-label">Cardholder Name</label>
                            <input type="text" class="form-control" placeholder="John Doe" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Card Number</label>
                            <input type="text" class="form-control" maxlength="16" placeholder="1234 5678 9012 3456" required>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label">Expiry Date</label>
                                <input type="text" class="form-control" placeholder="MM/YY" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">CVV</label>
                                <input type="password" class="form-control" maxlength="3" placeholder="123" required>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-success w-100 mt-2">Pay ₹<%= amount %> and Adopt</button>
                        <a href="adoptpet.jsp" class="btn btn-secondary w-100 mt-2">Cancel</a>
                    </form>
                </div>
            </div>
            <%
                } else {
                    out.print("<div class='alert alert-danger'>Pet not found!</div>");
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
