<%-- 
    Document   : managecourseassignment
    Created on : Jun 11, 2016, 9:55:06 PM
    Author     : Rowdy
--%>


<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    <br>
    <br>
    <h1>View Assigned Course From Here</h1>
    <table border="3">
        
        <tr><th style="width:100px; height:40px ">Course Assignment ID</th><th>Course Name</th><th>Branch Name</th><th>Operation</th></tr>
    <%
    
    
    
           Datahelper.connect();
            ResultSet res =Datahelper.DQL("SELECT * FROM coursemaster inner join branchmaster inner join courseassignment on coursemaster.courseid=courseassignment.courseid where courseassignment.branchid=branchmaster.branchid order by courseassignid ");
            while(res.next())
            {%>
             
        <tr style="height: 40px"  ><td><%= res.getString("courseassignid") %></td><td><%= res.getString("coursename") %></td><td><%=  res.getString("branchname")%></td><td><a href="edit_course.jsp?q=<%= res.getString("courseassignid")  %>">EDIT</a>|<a href="delete_course.jsp?q=<%= res.getString("courseassignid")  %>">DELETE</a></td></tr>    
            
            
            
            <%}
            
            Datahelper.close_Conn();
    
    
    %>
    
    </table>
    <%

   if(request.getParameter("success")!=null)   
       out.println(request.getParameter("success"));
    %>
</div>
<%@include file="footer.jsp" %>