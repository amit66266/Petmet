<%@ page import="com.net.DAO.UserDAO" %>
<%
    String uname = request.getParameter("uname");
    if (uname != null && !uname.isEmpty()) {
        int status = UserDAO.makeAdmin(uname);
        if (status > 0) {
            out.print("<script>alert('User promoted to Admin!'); window.location='viewrecord.jsp';</script>");
        } else {
            out.print("<script>alert('Failed to promote.'); window.location='viewrecord.jsp';</script>");
        }
    } else {
        out.print("<script>alert('Invalid user.'); window.location='viewrecord.jsp';</script>");
    }
%>
