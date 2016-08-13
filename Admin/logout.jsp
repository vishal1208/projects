<%-- 
    Document   : logout
    Created on : Jun 4, 2016, 9:40:12 AM
    Author     : Rowdy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

session.removeAttribute("uid");
session.invalidate();
response.sendRedirect("index.jsp");


%>
