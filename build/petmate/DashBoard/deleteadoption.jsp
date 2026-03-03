<%@ page import="com.net.DAO.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String aidStr = request.getParameter("adoption_id");
    int status = 0;

    if (aidStr != null && !aidStr.isEmpty()) {
        try {
            int adoptionId = Integer.parseInt(aidStr);
            status = UserDAO.deleteAdoption(adoptionId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<script>
    alert("<%= status > 0 ? "Adoption record deleted." : "Failed to delete adoption record." %>");
    window.location = 'viewadoptions.jsp';
</script>
