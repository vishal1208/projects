<%-- 
    Document   : logout
    Created on : Jul 23, 2016, 3:10:07 PM
    Author     : Rowdy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

session.removeAttribute("uid");
session.invalidate();
response.sendRedirect("index.jsp");


%>
