<%@ page import="com.net.DAO.UserDAO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Record Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" />
    <link rel="stylesheet" href="styles/styles.css">
</head>
<body>

	<% 
		String un = request.getParameter("un");
		java.sql.ResultSet rs = UserDAO.ShowUpdate(un);
		
		rs.next();
		String uname= rs.getString(2);
		String password= rs.getString(3);
        String name = rs.getString(4);
        String email = rs.getString(5);
        String dob = rs.getString(6);
        String city = rs.getString(7); 
	
	%>


<section class="h-100 gradient-form" style="background-color: #eee;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-xl-10">
                <div class="card rounded-3 text-black">
                    <div class="row g-0">
                        <div class="col-lg-6">
                            <div class="card-body p-md-5 mx-md-4">

                                <div class="text-center">
                                    <img src="images/paw.png" 
     style="width: 120px;" alt="PetMate Paw Logo">
                                    <h4 class="mt-1 mb-5 pb-1">PetMate - Update</h4>
                                </div>

                                <form method="post" action="updt.jsp">
                                    <p>Please edit your records</p>

                                    <div class="form-outline mb-4">
                                        <input type="text" id="username" name="uname" class="form-control" value="<%= uname %>" required minlength="3" maxlength="20" />
                                        <label class="form-label" for="username">Username</label>
                                    </div>
                                    
                                    <div class="form-outline mb-4">
                                        <input type="password" id="password" name="password" class="form-control" value="<%= password %>" minlength="6" maxlength="20" />
                                        <label class="form-label" for="password">Password</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="text" id="name" name="name" class="form-control" value="<%= name %>" required minlength="2" maxlength="50" />
                                        <label class="form-label" for="name">Name</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="email" id="email" name="email" class="form-control" value="<%= email %>" required maxlength="100" />
                                        <label class="form-label" for="email">Email Address</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="date" id="dob" name="dob" class="form-control" value="<%= dob %>" required />
                                        <label class="form-label" for="dob">DOB</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="text" id="city" name="city" class="form-control" value="<%= city %>" required minlength="2" maxlength="50" />
                                        <label class="form-label" for="city">City</label>
                                    </div>

                                    <div class="text-center pt-1 mb-5 pb-1">
                                        <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit">Update</button>
                                        <a class="text-muted" href="#!">Forgot password?</a>
                                    </div>

                                    <div class="d-flex align-items-center justify-content-center pb-4">
                                        <p class="mb-0 me-2">Have an account?</p>
                                        <button onClick="login()" type="button" class="btn btn-outline-danger">Login</button>
                                    </div>

                                </form>

                            </div>
                        </div>
                        <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                            <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                                <h4 class="mb-4">We are more than just a company.</h4>
                                <p class="small mb-0">Petmate is a simple web-based system that helps users find and adopt pets easily. Built with JSP and MySQL, it allows shelters to list pets and manage adoption requests, making the process smooth and efficient for both adopters and shelters.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    function login() {
        location.href = "./login.jsp";
    }
</script>


<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>

<script>
    
    document.addEventListener('DOMContentLoaded', function () {
        mdb.Input.init();
    });
</script>
</body>
</html>
