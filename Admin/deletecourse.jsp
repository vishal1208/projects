<%-- 
    Document   : deletecourse
    Created on : Jun 5, 2016, 10:26:13 AM
    Author     : Rowdy
--%>

<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>

<div id="page-wrapper">
    <script>
        function validate()
        {
            var s=confirm("Do you want to delete the course record or not?");
            if(s)
                return true;
            else
            {
                
                window.location='managecourse.jsp';
                return false;
                }
            
        }
        
        
        
    </script>
    
    <br>
    <br>
    <h1>Delete Course From Here</h1>
    <form action="../deletecourseservlet"  method="post" >
    <table border="1">
        
        <tr>
            <th style="height: 32px">Course ID</th>
            <th>Course Name</th>
            <th>Course Content</th>  
            <th>Course Description</th>
             
        </tr>
    <%
    
    
    
           Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from coursemaster where courseid='"+request.getParameter("q") +"'");
            if(res.next())
            {%>
             
        <tr><td><input style="height: 32px" type="text" value="<%= res.getInt(1) %>" readonly="true" name="txtcourseid" id="txtcourseid" ></td><td><input style="height: 32px" type="text" name="txtcoursename" id="txtcoursename" value="<%=  res.getString(2)     %>" ></td><td><textarea style="height: 32px"  name="txtcoursecontent" ><%=  res.getString(3)  %></textarea></td><td><textarea style="height: 32px" name="txtcoursedesc" ><%=  res.getString(4)  %></textarea></td><td><input style="height: 32px;width: 100%" type="submit" name="btnUpdate" value="Delete" onclick="return validate()"></td></tr>    
            
            
            
            <%}
            
            Datahelper.close_Conn();
    
    
    %>
    
    </table>
   
    
</div>
<%@include file="footer.jsp" %>