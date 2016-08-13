<%-- 
    Document   : deletebranch
    Created on : Jun 4, 2016, 9:14:21 AM
    Author     : Rowdy
--%>

<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>

<div id="page-wrapper">
    <script>
        function validate()
        {
            var s=confirm("Do you want to delete the branch record or not?");
            if(s)
                return true;
            else
            {
                
                window.location='managebranch.jsp';
                return false;
                }
            
        }
        
        
        
    </script>
    
    <br>
    <br>
    <h1>Delete Branch From Here</h1>
    <form action="../deletebranchservlet"  method="post" >
    <table border="1">
        
        <tr><th style="height:32px; " >Branch ID</th><th>Branch Name</th></tr>
    <%
    
    
    
           Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from branchmaster where branchid='"+request.getParameter("q") +"'");
            if(res.next())
            {%>
             
            <tr><td><input style="width:100%;height:32px; " type="text" value="<%= res.getInt(1) %>" readonly="true" name="txtbranchid" id="txtbranchid" ></td><td><input style="width:100%;height:32px; " type="text" name="txtbranchname" id="txtbranchname" value="<%=  res.getString(2)     %>" ></td><td><input style="width:100%;height:32px; " type="submit" name="btnUpdate" value="Delete" onclick="return validate()"></td></tr>    
            
            
            
            <%}
            
            Datahelper.close_Conn();
    
    
    %>
    
    </table>
   
    
</div>
<%@include file="footer.jsp" %>