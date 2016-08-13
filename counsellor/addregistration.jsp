<%-- 
    Document   : addregistration
    Created on : Jul 23, 2016, 1:35:51 PM
    Author     : Rowdy
--%>

<script>
    function validate(){
        
        
        var x=document.getElementById("txtregid").value.length==0;
        if(x)
        {
            document.getElementById("reg").innerHTML="*Registration ID is Required";
        }
         var b=document.getElementById("txtenquiryname").value.length==0;
           
         if(b)
        {
           document.getElementById("txtenquiry").innerHTML="*Enquirer Name is Required";
        }
        
        
    }
    function sum()
    {
         var y=document.getElementById("txtregfees").value;
         var z=document.getElementById("txttotalfees").value;
         var a=document.getElementById("txtremainfees").value;
        
        var result=document.getElementById("txttotalfees").value-document.getElementById("txtregfees").value;
        
        
        if(!isNaN(result))
        {
            document.getElementById("txtremainfees").value=result;
        }
        
        
        
    }
    
    
    
</script>




<%@page import="java.sql.*"%>
<%@page import="DAL.Datahelper"%>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    
    <br>
    <h1>ADD New Registration</h1>
    <form action="../counregistration" method="post">
        Enter Registration Id
        <br>
        <input type="text" name="txtregid" id="txtregid" required="" > 
        <br>
        
        <div id="reg" style="color: red">
            
            
        </div>
        
        
         <br>
         Select Enquirer Name
        <br>
       
        <select style="height:33px; width:172px; " id="txtenquiryname" name="txtenquiryid" required=""  >
          <option value="">Select Enquirer Name</option>
          <%
          
            Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from Enquiry");
            while(res.next())
            {%>
             
           <option value="<%= res.getInt(1) %>"> <%=  res.getString(2)     %></option>          
            
            
            <%} 
          
          
          
          %>
        
      </select>
          <div id="txtenquiry" style="color: red" >
          </div>
         <br>
          <br>
         
        Enter Registration Fees
        <br>
        <input type="text" id="txtregfees" name="txtregfees" onkeyup="sum()">
         <br>
         
         Enter Total Fees
        <br>
        <input type="text" name="txttotalfees" id="txttotalfees" required="" onkeyup="sum()" >
         <br>
         
         Enter Remaining Fees
        <br>
        <input type="text" id="txtremainfees"  name="txtremainfees"  >
         <br>
         
        Enter Registration Date
        <br>
        <input style="width: 172px;" type="date" name="txtregdate" >
         <br>
         
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
