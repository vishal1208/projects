<%-- 
    Document   : managefaculty
    Created on : Jul 12, 2016, 11:36:50 AM
    Author     : Rowdy
--%>

<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>


<div id="page-wrapper">
<br>
<br>

    <h1>View Faculty</h1>

    <table border="4" style="Arial">
    
         <tr>
             <th style="height: 40px" >Faculty ID</th>
             <th>faculty Name</th>
             <th>Faculty Mobile no.</th>
             <th>faculty Email iD</th>
             <th style="width:90px" >Date of Birth</th>
             <th>Qualification</th>
             <th>Experience</th>
             <th style="width:90px"  >Joining Date</th>
             <th>Technology</th>
             <th>Address</th>
             <th>Allotted Branch Name-ID</th>
             
             
             <th>Operations</th>
             
         </tr>
         <%
         Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from faculty inner join branchmaster where faculty.branchid=branchmaster.branchid order by facultyid");
            while(res.next())
            {%>
         
            <tr style="height: 40px" ><td> <%= res.getInt(1) %></td> <td><%=  res.getString(2) %></td> <td><%=  res.getString(3) %></td><td><%=  res.getString(4) %></td><td><%=  res.getString(5) %></td><td><%=  res.getString(6) %></td><td><%=  res.getString(7) %></td><td><%=  res.getString(8) %></td><td><%=  res.getString(9) %></td><td><%=  res.getString(10) %></td><td><%=  res.getString(13) %>-<%=  res.getString(11) %></td><td><a href="editfaculty.jsp?q=<%= res.getInt(1)  %>">EDIT</a>/<a href="deletefaculty.jsp?q=<%= res.getInt(1)  %>">DELETE</a></td></tr>
         
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
