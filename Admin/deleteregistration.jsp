<%-- 
    Document   : deleteregistration
    Created on : Jul 14, 2016, 11:43:38 AM
    Author     : Rowdy
--%>

<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>

<div id="page-wrapper">
    <script>
        function validate()
        {
            var s=confirm("Do you want to delete the Registration record or not?");
            if(s)
                return true;
            else
            {
                
                window.location='manageregistration.jsp';
                return false;
                }
            
        }
        
        
        
    </script>
    
    <br>
    <br>
    <h1>Delete Registration From Here</h1>
    <form action="../deleteregistrationservlet"  method="post" >
    <table border="1">
        
        <tr>
            
          
             <th style="height:32px; " >Registration ID</th>
             <th>Enquiry ID</th>
             <th>Registration fees</th>
             <th>Total Fees</th>
             <th>Remaining Fees</th>
             <th>Registration Date</th>
            
        
        </tr>
    <%
    
    
    
           Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from registration where regid='"+request.getParameter("q") +"'");
            if(res.next())
            {
           String str1=res.getString(1);
           String str2=res.getString(2);
           String str3=res.getString(3);
           String str4=res.getString(4);
           String str5=res.getString(5);
           String str6=res.getString(6);
          
    %>
             
            <tr>
                <td><input style="width:100%; height:32px;  " type="text" readonly="" name="txtregid" value="<%= str1 %>" > </td>
               
                 
                
                
                <td>
      
                  <select  style="width:100%; height:32px;" name="txtenquiryid"  >
        
          
            <option value="<%= str2 %>" ><%= str2 %> </option>
            
            <%
            
            ResultSet res1 =Datahelper.DQL("select * from enquiry"); 
            while(res1.next())
            {%>
             
           <option value="<%= res1.getString(1) %>"> <%=  res1.getString(2) %></option>          
            
            
            <%
            }
          
          %>
          
      </select>
     
                          
                </td>
                
                
                <td> <input style="width:100%;height:32px; " type="text" name="txtregfees" value="<%= str3 %>" ></td>
                
                <td> <input style="width:100%;height:32px; " type="text" name="txttotalfees" value="<%= str4 %>" ></td>
                <td> <input style="width:100%;height:32px; " type="text" name="txtremainfees" value="<%= str5 %>" ></td>
                <td>  <input style="width:100%; height:32px; " type="date" name="txtregdate" value="<%= str6 %>"  ></td>
             
                
            <td><input style="width:100%;height:32px; " type="submit" name="btnUpdate" value="Delete" onclick="return validate()"></td></tr>    
            
            
            
            <%}
            
            Datahelper.close_Conn();
    
    
    %>
    
    </table>
   
    
</div>
<%@include file="footer.jsp" %>