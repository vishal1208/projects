<%-- 
    Document   : addenquiry
    Created on : Jul 12, 2016, 10:31:04 PM
    Author     : Rowdy
--%>

<script>
    
    function validate()
    {
   var x=document.getElementById("txtenquiryid").value.length==0;
        if(x)
        {
           document.getElementById("enquiry").innerHTML="*Enquirer Id is Required";
        }
    var y=document.getElementById("txtenquirycourse").value.length==0;
           
         if(y)
        {
           document.getElementById("enquirycourse").innerHTML="*Enquirer Course is Required";
        }
        
        
        
    }    
   
</script>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAL.Datahelper"%>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    
    <br>
    <h1>ADD New Enquirer</h1>
    <form action="../enquiryservlet" method="post">
        Enter Enquirer Id
        <br>
        <input type="text" name="txtenquiryid" id="txtenquiryid" required="" > 
        <br>
        <div id="enquiry" style="color: red">
            
        </div>   
        Enter Enquirer Name
        <br>
        <input type="text" name="txtenquiryname" required="" >
         <br>
        Enter Father's Name
        <br>
        <input type="text" name="txtfathername" required="" >
         <br>
         
         Enter Contact no.
        <br>
        <input type="text" name="txtmob" required="" >
         <br>
         
         Enter Father's Contact no.
        <br>
        <input type="text" name="txtfathermob" required="" >
         <br>
         
         
         Enter Address
        <br>
        <textarea style="height:100px ; width: 172px; resize: vertical;" name="txtenquiryaddress"></textarea>
         <br>
         
         
        Enter Technology Known
        <br>
        <textarea style="height:60px; width: 172px;  resize: vertical;" name="txtenquirytech"></textarea>
         <br>
        
          
         Enter Enquirer's Course(Via Course ID)
     <br>
     <select style="height:33px; width:172px; " id="txtenquirycourse" name="txtcourseid" required=""  >
          <option value="">Select Course</option>
          <%
          
            Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from coursemaster");
            while(res.next())
            {%>
             
           <option value="<%= res.getString(1) %>"><%=  res.getString(2)     %></option>          
            
            
            <%} 
          
          
          
          %>
        
      </select>
          <div id="enquirycourse" style="color: red">
              
          </div>
         
         
         
         <br>
     
         
         
         
         
         
         Enter Enquiry Date
        <br>
        <input type="date" style="width: 172px;" name="txtenquirydate" >
       
        <br>
        
         Enter Enquirer Reference
        <br>
        <input type="text" name="txtenquiryref"  >
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



