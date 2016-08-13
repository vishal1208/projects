<%-- 
    Document   : viewcourseassign
    Created on : Jul 23, 2016, 1:22:37 PM
    Author     : Rowdy
--%>


<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    <br>
    <br>
    <h1>View Assigned Courses</h1>
    <table border="3">
        
        <tr><th style="width:100px; height:40px ">Course Assignment ID</th><th>Course Name</th><th>Branch Name</th></tr>
    <%
    
    
    
           Datahelper.connect();
            ResultSet res =Datahelper.DQL("SELECT * FROM coursemaster inner join branchmaster inner join courseassignment on coursemaster.courseid=courseassignment.courseid where courseassignment.branchid=branchmaster.branchid order by courseassignid ");
            while(res.next())
            {%>
             
        <tr style="height: 40px"  ><td><%= res.getString("courseassignid") %></td><td><%= res.getString("coursename") %></td><td><%=  res.getString("branchname")%></td></tr>    
            
            
            
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