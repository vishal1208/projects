<%-- 
    Document   : editregistration
    Created on : Jul 23, 2016, 2:23:22 PM
    Author     : Rowdy
--%>

<script>
    
    function sum()
    {
        var x=document.getElementById("txtregfees").value;
        var y=document.getElementById("txttotalfees").value;
        var z=document.getElementById("txtremainfees").value;
       
       var result=document.getElementById("txttotalfees").value-document.getElementById("txtregfees").value;
       if(!isNaN(result))
       {
           document.getElementById("txtremainfees").value=result;
       
           
       }
       
       
    }
    
    
</script>




<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    <br>
    <h1>Edit Registration Details</h1>
    <form action="../couneditregistration"  method="post" >
    <table border="1">
        
        <tr>
             <th style="height:32px; " >Registration ID</th>
             <th>Enquiry Name</th>
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
                <td><input style="width:100%; height:32px;  " type="text" name="txtregid" readonly="" value="<%= str1 %>" > </td>
               
                 
                
                
                <td>
      
                  <select  style="width:100%; height:32px;" name="txtenquiryid"  >
        
          
            <option value="<%= str2 %>" ><%= str2 %> </option>
            
            <%
            
            ResultSet res1 =Datahelper.DQL("select * from enquiry"); 
            while(res1.next())
            {%>
             
           <option value="<%= res1.getString(1) %>"> <%=  res1.getString(2) %></option>          
            
            
            <%}
          
          %>
          
      </select>
     
                    
                    
                
                
                
                </td>
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                <td> <input style="width:100%;height:32px; " type="text" id="txtregfees" name="txtregfees" value="<%= str3 %>" onkeyup="sum()" ></td>
                
                <td> <input style="width:100%;height:32px; " type="text" id="txttotalfees" name="txttotalfees" value="<%= str4 %>" onkeyup="sum()" ></td>
                <td> <input style="width:100%;height:32px " type="text" name="txtremainfees" id="txtremainfees" value="<%= str5 %>" ></td>
                <td>  <input style="width:100%; height:32px; " type="date" name="txtregdate" value="<%= str6 %>"  ></td>
             
                <td><input style="width:100%;height:32px; " type="submit" name="btnUpdate" value="Update"></td>
       </tr>    
            
            
            
            <%}
            
            Datahelper.close_Conn();
    
    
    %>
    
    </table>
    </form>
    
</div>
<%@include file="footer.jsp" %>