<%@ page import="com.net.DAO.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Pet</title>
</head>
<body>

<%
    String idStr = request.getParameter("id");
    int id = Integer.parseInt(idStr);
    int s = UserDAO.deletePet(id);

    if(s > 0){
        out.print("<script> alert('Pet Record Deleted Successfully!'); window.open('admin_adoptpet.jsp','_self'); </script>");
    } else {
        out.print("<script> alert('Failed to Delete Pet Record.'); window.open('admin_adoptpet.jsp','_self'); </script>");
    }
%>

</body>
</html>
