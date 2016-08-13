<%-- 
    Document   : managebatchassignment
    Created on : Jul 15, 2016, 4:12:28 PM
    Author     : Rowdy
--%>


<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    <br>
    <br>
    <h1>View/Edit Assigned Batches</h1>
    <table border="3">
        
        <tr> <th style="height: 40px" >Batch Assign Id</th> <th>Batch Name</th><th>Registration ID</th><th>Operation</th></tr>
    <%
    
    
    
           Datahelper.connect();
            ResultSet res =Datahelper.DQL("SELECT * FROM batch_master inner join registration inner join batch_assignment on batch_master.batchid=batch_assignment.batchid where batch_assignment.regid=registration.regid order by batchassignid ");
            while(res.next())
            {%>
             
        <tr style="height: 40px" >
            
            <td><%= res.getString("batchassignid") %></td><td><%= res.getString("batchname") %></td><td><%=  res.getString("regid")%></td><td><a href="edit_batch.jsp?q=<%= res.getString("batchassignid")  %>">EDIT</a>|<a href="delete_batch.jsp?q=<%= res.getString("batchassignid")  %>">DELETE</a></td></tr>    
            
            
            
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