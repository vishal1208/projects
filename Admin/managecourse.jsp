<%-- 
    Document   : editcourse
    Created on : Jun 5, 2016, 9:32:55 AM
    Author     : Rowdy
--%>


<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>

<div id="page-wrapper">
<br>
<br>

    <h1>View/Edit Course</h1>

    <table border="4" style="Arial">
    
         <tr>
             <th style="height: 40px" >Course ID</th>
             <th>Course Name</th>
             <th>Course Content</th>
             <th>Course Description</th>
             <th>Operations</th>
         </tr>
         <%
         Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from coursemaster");
            while(res.next())
            {%>
         
         <tr style="height: 40px" ><td><%= res.getInt(1) %></td><td><%=  res.getString(2)%></td><td><%=  res.getString(3)%></td><td><%=  res.getString(4)%></td><td><a href="editcourse.jsp?q=<%= res.getInt(1)  %>">EDIT</a>/<a href="deletecourse.jsp?q=<%= res.getInt(1)  %>">DELETE</a></td></tr>
         
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