<%-- 
    Document   : deletefees
    Created on : Jul 15, 2016, 4:30:33 PM
    Author     : Rowdy
--%>

<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>

<div id="page-wrapper">
    <script>
        function validate()
        {
            var s=confirm("Do you want to delete the Fee record or not?");
            if(s)
                return true;
            else
            {
                
                window.location='managefees.jsp';
                return false;
                }
            
        }
        
        
        
    </script>
    
    <br>
    <br>
    <h1>Delete Fees Detail</h1>
    <form action="../deletefeesservlet"  method="post" >
    <table border="1">
        
        <tr>
            
             
        <tr><th style="height:32px; " >Registration ID</th>
             <th>Installments</th>
             <th>Installment Fees</th>
             <th>Date</th>
             
             </tr>
    <%
    
    
    
           Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from fees where regid='"+request.getParameter("q") +"' and Installment='"+request.getParameter("r")+"'");
            if(res.next())
            {%>
             
      
               
            <td><input style="width:100%; height:32px " type="text" name="txtregid" readonly="" value="<%= res.getInt(1) %>" > </td>
             <td> <input style="width:100%;height:32px; " type="text" name="txtinstallment" value="<%= res.getString(2) %>" ></td>
                  
            <td> <input style="width:100%;height:32px; " type="text" name="txtinstallmentfees" value="<%= res.getString(2) %>" ></td>
                <td> <input style="width:100%;height:32px; " type="date" name="txtdate" value="<%= res.getString(4) %>" ></td>
        
                
            <td><input style="width:100%;height:32px; " type="submit" name="btnUpdate" value="Delete" onclick="return validate()"></td></tr>    
            
            
            
            <%}
            
            Datahelper.close_Conn();
    
    
    %>
    
    </table>
   
    
</div>
<%@include file="footer.jsp" %>