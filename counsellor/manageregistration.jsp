<%-- 
    Document   : manageregistration
    Created on : Jul 23, 2016, 1:36:04 PM
    Author     : Rowdy
--%>

<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>


<div id="page-wrapper">
<br>
<br>

    <h1>View/Edit Registration</h1>

    <table border="4" style="Arial">
    
         <tr>
             <th style="height: 40px" >Registration ID</th>
             <th>Enquirer Name</th>
             <th>Registration fees</th>
             <th>Total Fees</th>
             <th>Remaining Fees</th>
             <th>Registration Date</th>
             
             <th>Operations</th>
             
         </tr>
         <%
         Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from registration inner join enquiry where registration.enquiryid=enquiry.enquiryid order by registration.regid");
            while(res.next())
            {%>
         
            <tr style="height: 40px" ><td> <%= res.getInt(1) %></td> <td><%=  res.getString(8) %></td> <td><%=  res.getString(3) %></td><td><%=  res.getString(4) %></td><td><%=  res.getString(5) %></td><td><%=  res.getString(6) %></td><td><a href="editregistration.jsp?q=<%= res.getInt(1)  %>">EDIT</a>/<a href="deleteregistration.jsp?q=<%= res.getInt(1)  %>">DELETE</a></td></tr>
         
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
