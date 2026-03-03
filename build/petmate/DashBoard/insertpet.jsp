<%@ page import="com.net.DAO.UserDAO" %>
<%@ page import="com.net.bean.PetBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Pet</title>
</head>
<body>

<jsp:useBean id="obj" class="com.net.bean.PetBean" />
<jsp:setProperty property="*" name="obj"/>

<%
    int s = UserDAO.insertPet(obj);
    if(s > 0){
        out.print("<script> alert('Pet Added Successfully!'); window.open('admin_adoptpet.jsp','_self'); </script>");
    } else {
        out.print("<script> alert('Failed to Add Pet.'); window.open('admin_adoptpet.jsp','_self'); </script>");
    }
%>

</body>
</html>
