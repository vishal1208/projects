<%-- 
    Document   : profile
    Created on : Jul 23, 2016, 1:06:21 PM
    Author     : Rowdy
--%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> </title>
    </head>
    <body>
    <%@include file="header.jsp" %>
<div id="page-wrapper">
    <br>
    <br>
   
        <h1>Hello <%if(session.getAttribute("uid")!=null)
 {
     out.print(session.getAttribute("uid"));
 }
%>!</h1>
</div>
<%@include file="footer.jsp" %>


    </body>
</html>