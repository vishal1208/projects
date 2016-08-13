<%-- 
    Document   : editbranch
    Created on : Jun 3, 2016, 10:41:11 AM
    Author     : Rowdy
--%>
<script>
    function validate()
    {
        var x=document.getElementById("txtbranchname").value.length==0;
        if(x)
        {
                   //alert("branchid is required");
                   document.getElementById("branchname").innerHTML="*Branch Name is required";
            return false;
        }
        
    }
    
    
    
</script>


<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>

<div id="page-wrapper">
    <br>
    <h1>Edit Branch From Here</h1>
    <form action="../editbranchservlet"  method="post" >
   
        <table border="5" cellpadding="1">
           
                <tr>
                    <th style="height: 32px" > Branch ID</th>
                    <th>Branch Name </th>
                </tr>
           <%
   
           Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from branchmaster where branchid='"+request.getParameter("q") +"'");
            if(res.next())
            {%>
            
            <tr><td> <input style="height: 32px" type="text" name="txtbranchid" value="<%= res.getInt(1) %>" readonly="true"  ></td> <td><input style="height: 32px" type="text" id="txtbranchname"  name="txtbranchname" value="<%=  res.getString(2)  %>" >  </td><td><input style="width: 100%;height: 32px" type="submit" name="btnUpdate" onclick="return validate()" value="Update"></td></tr>    
           
                   <%}
            
            Datahelper.close_Conn();
    
    
    %>
                 
                
        </table>

    
    
    </form>
    <div style="color: red" id="branchname" > </div>
    
    
</div>
<%@include file="footer.jsp" %>