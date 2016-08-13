<%-- 
    Document   : managefees
    Created on : Jul 23, 2016, 3:03:19 PM
    Author     : Rowdy
--%>

<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>


<div id="page-wrapper">
<br>
<br>

    <h1>View/Edit Fees</h1>

    <table border="4" style="Arial">
    
         <tr>
             <th style="height: 40px" >Registration ID  </th>
             <th>Enquirer Name</th>
             <th>installments</th>
             <th>installment fees</th>
             <th>Date</th>
             
             
             <th>Operations</th>
             
         </tr>
         <%
         Datahelper.connect();
            ResultSet res =Datahelper.DQL("select registration.regid,name,installment,installmentfee,date from fees inner join registration inner join enquiry where fees.regid=registration.regid and registration.enquiryid=enquiry.enquiryid ORDER BY registration.regid");
            while(res.next())
            {%>
         
            <tr style="height: 40px" > <td> <%= res.getString(1) %></td> <td> <%= res.getString(2) %></td> <td><%=  res.getString(3) %></td> <td><%=  res.getString(4) %></td><td><%=  res.getString(5) %></td><td><a href="editfees.jsp?q=<%= res.getString(1)  %>&r=<%= res.getString(3) %>">EDIT</a>/<a href="deletefees.jsp?q=<%= res.getInt(1)  %>&r=<%= res.getString(3) %>">DELETE</a></td></tr>
         
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
