<%-- 
    Document   : enquiry
    Created on : Jul 23, 2016, 1:35:18 PM
    Author     : Rowdy
--%>


<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>


<div id="page-wrapper">
<br>
<br>

    <h1>View/Edit Enquiry</h1>

    <table border="3" style="Arial">
    
         <tr style="height: 40px" >
             <th>Enquiry ID</th>
             <th>Name</th>
             <th>Father Name</th>
             <th>Mobile no.</th>
             <th>Guardians Mobile No</th>
             <th>Address</th>
             <th>Technology Known</th>
             <th>Enquiry Course</th>
             <th>Enquiry Date</th>
             <th>Enquiry Reference</th>
             
             <th>Operations</th>
             
         </tr>
         <%
         Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from enquiry inner join coursemaster where enquiry.courseid=coursemaster.courseid order by enquiry.enquiryid");
            while(res.next())
            {%>
         
            <tr style="height: 40px" ><td> <%= res.getInt(1) %></td> <td><%=  res.getString(2) %></td> <td><%=  res.getString(3) %></td><td><%=  res.getString(4) %></td><td><%=  res.getString(5) %></td><td><%=  res.getString(6) %></td><td><%=  res.getString(7) %></td><td><%=  res.getString(12) %></td><td><%=  res.getString(9) %></td><td><%=  res.getString(10) %></td><td><a href="editenquiry.jsp?q=<%= res.getInt(1)  %>">EDIT</a>/<a href="deleteenquiry.jsp?q=<%= res.getInt(1)  %>">DELETE</a></td></tr>
         
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
