<%-- 
    Document   : searchenquiry
    Created on : Jul 23, 2016, 2:56:46 PM
    Author     : Rowdy
--%>


<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    
    <div>
    <br>
    
    <form method="post" >
    <h1> VIEW Enquiries Via Date</h1>
    
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
         {%>
         
         <table border="1">
        
             <tr><th style="height: 32px">enquiry ID</th>
             <th>Name</th>
             <th>Fathers Name</th>
             <th>Contact no.</th>
            <th>Fathers Contact no.</th>
            <th>Address</th>
            <th>Technology Awared </th> 
            <th>Enquiry Course</th>
            <th>Enquiry Date</th>
            <th>Enquiry Reference</th>
            <th>Operations</th>
            
             
             </tr>
    <%
    
     Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from enquiry where enquirydate between '"+request.getParameter("txtdate1") +"' and '"+request.getParameter("txtdate2") +"'");
            while(res.next())
            {%>
    
    
    <tr>
        <td><input style="width:100%; height:32px;  " type="text" name="txtenquiryid" readonly="" value="<%= res.getString(1) %>" > </td>
          <td> <input style="width:100%;height:32px; " type="text" name="txtenquiryname" readonly="" value="<%= res.getString(2) %>" ></td>
        <td> <input style="width:100%;height:32px; " type="text" name="txtfathername" readonly="" value="<%= res.getString(3) %>" ></td>
        <td><input style="width:100%; height:32px; " type="text" name="txtmob" readonly="" value="<%= res.getString(4) %>" ></td>
        <td><input style="width:100%; height:32px; " type="text" name="txtfathermob" readonly="" value="<%= res.getString(5) %>" ></td>
      <td>  <textarea style="width:100%; height:32px; "  name="txtenquiryaddress" readonly="" ><%= res.getString(6) %></textarea></td>
     <td>  <textarea style="width:100%; height:32px; "  name="txtenquirytech" readonly="" ><%= res.getString(7) %></textarea></td>
      <td> <input style="width:100%; height:32px; " type="text" name="txtenquirycourse" readonly="" value="<%= res.getString(8) %>"  ></td>
      <td>  <input style="width:100%; height:32px; " type="date" name="txtenquirydate" readonly="" value="<%= res.getString(9) %>"  ></td>
       <td> <input style="width:100%; height:32px; " type="text" name="txtenquiryref" readonly="" value="<%= res.getString(10) %>"  ></td>
        
      <td><a href="editenquiry.jsp?q=<%= res.getInt(1)  %>">EDIT</a>/<a href="deleteenquiry.jsp?q=<%= res.getInt(1)  %>">DELETE</a></td>   
    
    </tr>    
            
             
            
            <%}
         }  
            Datahelper.close_Conn();
    
    
    %>
    
    </table> 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        
    </div>
    
    
    
    
</div>

<%@include file="footer.jsp" %>