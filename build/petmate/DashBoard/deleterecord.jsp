<%@ page import="com.net.DAO.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Del</title>
</head>
<body>

<jsp:useBean id="obj" class="com.net.bean.UserBean" />
<jsp:setProperty property="*" name="obj"/>

<%
	String un=request.getParameter("un");
    int s=UserDAO.Delete(un);
    if(s>0){
    	out.println();
    	out.print("Register Success");
    	out.print("<script> alert('Record Delete Success...'); window.open('viewrecord.jsp','_self'); </script>");
    }
    else{
    	out.print("<script> alert('User Delete Fail...'); window.open('viewrecord.jsp','_self'); </script>");
    }
%>

</body>
</html>
