<%-- 
    Document   : delenquiry
    Created on : Jul 21, 2016, 6:43:09 PM
    Author     : Rowdy
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            String str= request.getParameter("q");
           Class.forName("com.mysql.jdbc.Driver");  
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/batc_assign","root","");
        Statement st=con.createStatement();
        
        ResultSet res= st.executeQuery("select * from registration where enquiryid='"+str+"'");
        
        if(res.next())
        {%>
        <br>
        <br>
        
        <p>
            References With Registration..      
        </p>  
       <p>
           Cannot Delete...      
        </p>  
       <p>
           First Delete Enquiry table from Registration    
        </p>  
       
        
        <%}
        else{
        
        }  
         %>
    </body>
</html>
