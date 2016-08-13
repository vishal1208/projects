<%-- 
    Document   : viewbatch
    Created on : Jul 23, 2016, 1:28:30 PM
    Author     : Rowdy
--%>


<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>


<div id="page-wrapper">
<br>
<br>

    <h1>View Batches</h1>

    <table border="3" style="Arial">
    
         <tr>
             <th style="height: 40px" > Batch Id</th>
             <th> Batch Name</th>
             <th>Batch Date</th>
             <th>Course Name</th>
             <th>Faculty Name</th>
             <th>Batch Time</th>
             <th>Batch Duration</th>
             
             
             
         </tr>
         <%
         Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from batch_master inner join coursemaster inner join faculty where batch_master.courseid=coursemaster.courseid and batch_master.facultyid=faculty.facultyid ORDER BY `batch_master`.`batchid` ASC");
            while(res.next())
            {%>
         
            <tr style="height: 40px" ><td> <%= res.getInt(1) %></td> <td><%=  res.getString(2) %></td> <td><%=  res.getString(3) %></td><td><%=  res.getString(9) %></td><td><%=  res.getString(13) %></td><td><%=  res.getString(6) %></td><td><%=  res.getString(7) %></td></tr>
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
