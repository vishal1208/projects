<%-- 
    Document   : editfees
    Created on : Jul 23, 2016, 3:03:32 PM
    Author     : Rowdy
--%>

<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    <br>
    <h1>Edit Fee Detail</h1>
    <form action="../couneditfees"  method="post" >
    <table border="1">
        
        <tr><th style="height:32px; ">Registration ID</th>
             <th>Installments</th>            
            <th>Installment Fees</th>
             <th>Date</th>
            
             </tr>
    <%
    
    
    
           Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from fees where regid='"+request.getParameter("q") +"' and Installment='"+request.getParameter("r")+"'");
            if(res.next())
            {%>
             
            <tr>
                <td><input style="width:100%; height:32px;  " type="text" name="txtregid" readonly="" value="<%= res.getInt(1) %>" > </td>
                <td> <input style="width:100%;height:32px; " type="text" name="txtinstallment" value="<%= res.getString(2) %>" ></td>
                
                <td> <input style="width:100%;height:32px; " type="text" name="txtinstallmentfees" value="<%= res.getString(3) %>" ></td>
                <td> <input style="width:100%;height:32px; " type="date" name="txtdate" value="<%= res.getString(4) %>" ></td>
        
        
        <td><input style="width:100%;height:32px; " type="submit" name="btnUpdate" value="Update"></td>
       </tr>    
            
            
            
            <%}
            
            Datahelper.close_Conn();
    
    
    %>
    
    </table>
    </form>
    
</div>
<%@include file="footer.jsp" %>