<%@ page import="com.net.DAO.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reg</title>
</head>
<body>

<jsp:useBean id="obj" class="com.net.bean.UserBean" />
<jsp:setProperty property="*" name="obj"/>

<%
    out.print("Hello");
    out.print("<hr>Username: " + obj.getUname());
    out.print("<hr>Password: " + obj.getPassword());
    
    int s=UserDAO.Register(obj);
    out.print(s);
    if(s>0){
    	out.println();
    	out.print("Register Success");
    	out.print("<script> alert('User Registration Success...'); window.open('login.jsp','_self'); </script>");
    }
    else{
    	out.print("<script> alert('User Registration Fail...'); window.open('registration.jsp','_self'); </script>");
    }
%>

</body>
</html>
