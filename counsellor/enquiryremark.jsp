<%-- 
    Document   : enquiryremark
    Created on : Jul 23, 2016, 4:06:57 PM
    Author     : Rowdy
--%>

<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>


<div id="page-wrapper">
<br>
<br>

    <h1>View/Edit Enquiry-Remark</h1>

    <table border="3" style="Arial">
    
         <tr style="height: 40px" >
             <th>Enquiry ID</th>
             <th>Enquirer Name</th>
             <th>Remark</th>         
             <th>Operations</th>
             
         </tr>
         <%
         Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from enquiry_remark inner join enquiry where enquiry.enquiryid=enquiry_remark.enquiryid order by enquiry.enquiryid");
            while(res.next())
            {%>
         
            <tr style="height: 40px" ><td> <%= res.getInt(1) %></td> <td><%=  res.getString(4) %></td> <td><%=  res.getString(2) %></td><td><a href="editenquiryremark.jsp?q=<%= res.getString(1)  %>">EDIT</a>/<a href="deleteenquiryremark.jsp?q=<%= res.getString(1)  %>">DELETE</a></td></tr>
         
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
