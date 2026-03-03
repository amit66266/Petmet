<%@ page import="com.net.DAO.UserDAO" %>
<%@ page import="com.net.bean.UserBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log</title>
</head>
<body>

<jsp:useBean id="obj" class="com.net.bean.UserBean" />
<jsp:setProperty property="*" name="obj"/>

<%
UserBean user = UserDAO.Login(obj);

if(user != null){
    session.setAttribute("uname", user.getUname());
    session.setAttribute("role", user.getRole());

    if ("admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("DashBoard/AdminDash.jsp");
    } else {
        response.sendRedirect("DashBoard/UserDash.jsp");
    }
} else {
    out.print("<script>alert('Login Failed...'); window.open('login.jsp','_self');</script>");
}
%>

</body>
</html>
