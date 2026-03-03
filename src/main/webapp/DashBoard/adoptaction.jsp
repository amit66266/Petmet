<%@ page import="com.net.DAO.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Adopt Action</title>
</head>
<body>

<%
    String uname = request.getParameter("uname");
    int petid = Integer.parseInt(request.getParameter("petid"));

    int s = UserDAO.adoptPet(uname, petid);
    if(s > 0){
        out.print("<script>alert('Pet adopted successfully!'); window.open('UserDash.jsp','_self');</script>");
    } else {
        out.print("<script>alert('Failed to adopt pet'); window.open('UserDash.jsp','_self');</script>");
    }
%>

</body>
</html>
