<%-- 
    Document   : deletebatch
    Created on : Jul 15, 2016, 4:30:14 PM
    Author     : Rowdy
--%>

<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>

<div id="page-wrapper">
    <script>
        function validate()
        {
            var s=confirm("Do you want to delete the Batch record or not?");
            if(s)
                return true;
            else
            {
                
                window.location='managebatch.jsp';
                return false;
                }
            
        }
        
        
        
    </script>
    
    <br>
    <br>
    <h1>Delete Batch</h1>
    <form action="../deletebatchservlet"  method="post" >
    <table border="1">
        
        <tr>
            
             
        <tr><th style="height: 32px"> Batch Id</th>
             <th> Batch Name</th>
            <th>Batch date</th>
             <th>Course Name</th>
             <th>Faculty name</th>
             <th>Batch Time</th>
             <th>batch Duration</th>
             
             
             </tr>
     <%
    
    
    
           Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from batch_master where batchid='"+request.getParameter("q") +"'");
            if(res.next())
            {
    
           String str1=res.getString(1);
           String str2=res.getString(2);
           String str3=res.getString(3);
           String str4=res.getString(4);
           String str5=res.getString(5);
           String str6=res.getString(6);
            String str7=res.getString(7);
           
          
           
    
    
         %>
             
            <tr>
                <td><input style="width:100%; height:32px;  " type="text" readonly="" name="txtbatchid" value="<%= str1 %>" > </td>
                <td><input style="width:100%; height:32px;  " type="text" name="txtbatchname" value="<%= str2 %>" > </td>
                
                <td>  <input style="width:100%; height:32px; " type="date" name="txtbatchdate" value="<%= str3 %>"  ></td>
      
       
                <td>
                              
                     <select  style="width:100%; height:32px;" name="txtcourseid"  >
        
          
            <option value="<%= str4 %>" ><%= str4 %> </option>
            
            <%
            
            ResultSet res1 =Datahelper.DQL("select * from coursemaster"); 
            while(res1.next())
            {%>
             
           <option value="<%= res1.getString(1) %>"> <%=  res1.getString(2) %></option>          
            
            
            <%}
          
          %>
          
      </select>
     
                         
                </td>
                
                
                
                
               
                <td>
                              
                     <select  style="width:100%; height:32px;" name="txtfacultyid"  >
        
          
            <option value="<%= str5 %>" ><%= str5 %> </option>
            
            <%
            
            ResultSet res2 =Datahelper.DQL("select * from faculty"); 
            while(res2.next())
            {%>
             
           <option value="<%= res2.getString(1) %>"> <%=  res2.getString(2) %></option>          
            
            
            <%}
          
          %>
          
      </select>
     
                         
                </td>
               
        
        
        
        
        
        
        
        
        
        <td><input style="width:100%; height:32px; " type="time" name="txtbatchtime" value="<%= str6 %>" ></td>
        <td><input style="width:100%; height:32px; " type="time" name="txtbatchdur" value="<%= str7 %>" ></td>
        
                
            <td><input style=" width: 100%; height: 32px" type="submit" name="btnUpdate" value="Delete" onclick="return validate()"></td></tr>    
            
            
            
            <%}
            
            Datahelper.close_Conn();
    
    
    %>
    
    </table>
   
    
</div>
<%@include file="footer.jsp" %>