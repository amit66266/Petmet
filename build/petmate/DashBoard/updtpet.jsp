<%@ page import="com.net.DAO.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Pet</title>
</head>
<body>

<jsp:useBean id="obj" class="com.net.bean.PetBean" />
<jsp:setProperty property="*" name="obj"/>

<%
    int s = UserDAO.updatePet(obj);
    if(s > 0){
        out.print("<script> alert('Pet Record Updated Successfully!'); window.open('admin_adoptpet.jsp','_self'); </script>");
    } else {
        out.print("<script> alert('Failed to Update Pet Record.'); window.open('admin_adoptpet.jsp','_self'); </script>");
    }
%>

</body>
</html>
