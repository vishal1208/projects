<%-- 
    Document   : addbranch
    Created on : Jun 2, 2016, 5:22:21 PM
    Author     : Rowdy
--%>
<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper"%>
<%@include file="header.jsp" %>
<script>
    function validate()
    {
      var x=document.getElementById("txtbranchid").value.length==0;
      var y=document.getElementById("txtbranchname").value.length==0;
       
      if(x)
    {
        document.getElementById("branchid").innerHTML="*Branch ID is required";
    }
    if(y)
    {
        document.getElementById("branchname").innerHTML="*Branch Name is required";
    }
    
        
    }
    
    </script>
<div id="page-wrapper">
    
    <br>
    <h1>ADD New Branch</h1>
    <form action="../branchservlet" method="post">
        Enter Branch Id
        <br>
        <input type="text" id="txtbranchid" name="txtbranchid" required="" > 
        
        
        
        
        <div style="color: red;" id="branchid">
        </div>
        <br>
        Enter Branch Name
        <br>
        <input type="text" id="txtbranchname" name="txtbranchname" required="" >
       
        <br>
         <div style="color: red;" id="branchname">
        </div>
       
        <br>
         <input type="submit" value="Add" name="btnsubmit" onclick="return validate()" />
         <br>
         
    </form>
    
    <br>
    
       
     
    <%
      
          if(request.getParameter("success")!=null)
              out.println(request.getParameter("success"));
          
      %>
</div>
<%@include file="footer.jsp" %>
