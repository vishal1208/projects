<%-- 
    Document   : delete_faculty
    Created on : Jul 12, 2016, 12:25:04 PM
    Author     : Rowdy
--%>

<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>

<div id="page-wrapper">
    <script>
        function validate()
        {
            var s=confirm("Do you want to delete the Faculty record or not?");
            if(s)
                return true;
            else
            {
                
                window.location='managefaculty.jsp';
                return false;
                }
            
        }
        
        
        
    </script>
    
    <br>
    <br>
    <h1>Delete Faculty From Here</h1>
    <form action="../deletefacultyservlet"  method="post" >
    <table border="1">
        
        <tr>
            
            <th style="width:90px" >Faculty ID</th>
             <th>faculty Name</th>
             <th>Faculty Mobile no.</th>
             <th>faculty Email iD</th>
             <th>Date of Birth</th>
             <th>Qualification</th>
             <th>Experience</th>
             <th>Joining Date</th>
             <th>Technology</th>
             <th>Address</th>
             <th>Allotted Branch Name-ID</th>
            
        
        </tr>
    <%
    
    
    
           Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from faculty where facultyid='"+request.getParameter("q") +"'");
            if(res.next())
            {
    
    String str11=res.getString(11);
    
    %>
             
            <tr>
                
                <td><input style="width:100%; height: 40px; " type="text" name="txtfacultyid" value="<%= res.getInt(1) %>" > </td>
                <td> <input style="width:100%; height: 40px; " type="text" name="txtfacultyname" value="<%= res.getString(2) %>" ></td>
        <td><input style="width:100%; height: 40px; " type="text" name="txtfacultyno" value="<%= res.getString(3) %>" ></td>
       <td><input style="width:100%; height: 40px; " type="email" name="txtfacultyemailid" value="<%= res.getString(4) %>" ></td>
       <td><input style="width:140px; height: 40px; " type="date" name="txtfacultydob" value="<%= res.getDate(5) %>" ></td>
       <td> <textarea style="width:100%; height: 40px; " name="txtfacultyqual"><%= res.getString(6) %></textarea></td>
    <td> <input style="width:100%; height: 40px; " type="number" name="txtfacultyexp" value="<%= res.getInt(7) %>" ></td>
      <td>  <input style="width:140px; height: 40p; " type="date" name="txtfacultyjoin" value="<%= res.getDate(8) %>"  ></td>
      <td> <textarea style="width:100%; height: 40px; "  name="txtfacultytech"><%= res.getString(9) %></textarea></td>
      <td>  <textarea style="width:100%; height: 40px; "  name="txtfacultyaddress"><%= res.getString(10) %>  </textarea></td>
       <td> 
           
            <select  style="width:100%; height:40px;" name="txtbranchid"  >
        
          
            <option value="<%= str11 %>" ><%= str11 %> </option>
            
            <%
            
            ResultSet res2 =Datahelper.DQL("select * from branchmaster"); 
            while(res2.next())
            {%>
             
           <option value="<%= res2.getString(1) %>"> <%=  res2.getString(2) %></option>          
            
            
            <%}
          
          %>
          
      </select>
     
           
           
           
       </td>
           
            <td><input style="width:100%; height: 40px; " type="submit" name="btnUpdate" value="Delete" onclick="return validate()"></td></tr>    
            
            
            
            <%}
            
            Datahelper.close_Conn();
    
    
    %>
    
    </table>
   
    
</div>
<%@include file="footer.jsp" %>