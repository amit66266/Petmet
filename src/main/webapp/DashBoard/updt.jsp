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
    int s=UserDAO.Update(obj);
    if(s>0){
    	out.print("<script> alert('Record Update Success...'); window.open('viewrecord.jsp','_self'); </script>");
    }
    else{
    	out.print("<script> alert('User Registration Fail...'); window.open('viewrecord.jsp','_self'); </script>");
    }
%>

</body>
</html>
