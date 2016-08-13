<%-- 
    Document   : managebranch
    Created on : Jun 2, 2016, 5:24:44 PM
    Author     : Rowdy
--%>

<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>


<div id="page-wrapper">
<br>
<br>

    <h1>View Branch</h1>

    <table border="4" style="Arial">
    
         <tr>
             <th style="height: 40px" >Branch ID</th>
             <th>Branch Name</th>
             <th>Operations</th>
         </tr>
         <%
         Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from branchmaster");
            while(res.next())
            {%>
         
            <tr style="height: 40px" ><td> <%= res.getInt(1) %></td> <td><%=  res.getString(2) %></td> <td><a href="editbranch.jsp?q=<%= res.getInt(1)  %>">EDIT</a>/<a href="deletebranch.jsp?q=<%= res.getInt(1)  %>">DELETE</a></td></tr>
         
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