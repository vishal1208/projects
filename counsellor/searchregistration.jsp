<%-- 
    Document   : searchregistration
    Created on : Jul 23, 2016, 2:57:03 PM
    Author     : Rowdy
--%>


<%@page import="java.sql.*"%>
<%@page import="DAL.Datahelper"%>
<%@include file="header.jsp" %>

<div id="page-wrapper">
    
    <div>
        <br>
        <br>
        <form method="post" >
        
    <form method="post" >
    <h1> VIEW Registration Via Date</h1>
    
    <br>
    
    <h4> Select Date Interval </h5> 
    
    <input style="margin-right:30px; width: 137px " type="date" name="txtdate1" required="" >
    
    <input style="margin-right:80px; width: 137px " type="date" name="txtdate2" required="" >
    
    <input style="height:40px ; " type="submit" name="submit" value="Submit"  >
    
    <br>
    </form>
    </div>
      
             <div>
                 
                 
             
                 <br>
              <br>
                
              
         <%
         String str=request.getParameter("submit");
         
         if(str!=null)
         {
              Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from registration inner join enquiry where registration.enquiryid=enquiry.enquiryid and regdate between '"+request.getParameter("txtdate1") +"' and '"+request.getParameter("txtdate2") +"'  order by registration.regid");
         if(res.next())
         {   
      //   out.println(str1);
         %>
         
         <table border="1">
        
             <tr>
                 
                 <th style="height: 32px;"  >Registration ID</th>
             <th>Enquirer Name</th>
             <th>Registration fees</th>
             <th>Total Fees</th>
             <th>Remaining Fees</th>
             <th>Registration Date</th>
                 
             
            <th>Operations</th>
            
             
             </tr>
    <%
    
             res.beforeFirst();
       while(res.next())
            {
            %>
    
    
    <tr>
        <td><input style="width:100%; height:32px;  " type="text" name="txtbatchid" readonly="" value="<%= res.getString(1) %>" > </td>
          <td> <input style="width:100%;height:32px; " type="text" name="txtbatchname" readonly="" value="<%= res.getString(8) %>" ></td>
        <td> <input style="width:100%;height:32px; " type="text" name="txtbatchdate" readonly="" value="<%= res.getString(3) %>" ></td>
        <td><input style="width:100%; height:32px; " type="text" name="txtcourseid" readonly="" value="<%= res.getString(4) %>" ></td>
        <td><input style="width:100%; height:32px; " type="text" name="txtfacultyid" readonly="" value="<%= res.getString(5) %>" ></td>
      <td>  <textarea style="width:100%; height:32px; "  name="txtbatchtime" readonly="" ><%= res.getString(6) %></textarea></td>
     
      <td><a href="editregistration.jsp?q=<%= res.getString(1)  %>">EDIT</a>/<a href="deleteregistration.jsp?q=<%= res.getString(1)  %>">DELETE</a></td>   
    
    </tr>    
            
             
            
            <%}
         }
         else
         {
              out.print("<script>alert('No Result Exists between these dates') </script>");
              out.println("<script>window.location.replace('viewregistration.jsp') </script>");   
        
         }  
         }
         
            Datahelper.close_Conn();
    
    
    %>
    
    </table> 
    
                   
             </div>
          
              
          </div>

<%@include file="footer.jsp" %>

