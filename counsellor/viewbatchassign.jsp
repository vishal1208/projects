<%-- 
    Document   : viewbatchassign
    Created on : Jul 23, 2016, 1:31:12 PM
    Author     : Rowdy
--%>

<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    <br>
    <br>
    <h1>View Assigned Batches</h1>
    <table border="3">
        
        <tr> <th style="height: 40px" >Batch Assign Id</th> <th>Batch Name</th><th>Registration ID</th></tr>
    <%
    
    
    
           Datahelper.connect();
            ResultSet res =Datahelper.DQL("SELECT * FROM batch_master inner join registration inner join batch_assignment on batch_master.batchid=batch_assignment.batchid where batch_assignment.regid=registration.regid order by batchassignid ");
            while(res.next())
            {%>
             
        <tr style="height: 40px" >
            
            <td><%= res.getString("batchassignid") %></td><td><%= res.getString("batchname") %></td><td><%=  res.getString("regid")%></td></tr>    
            
            
            
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