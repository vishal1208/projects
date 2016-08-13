<%-- 
    Document   : addenquiryremark
    Created on : Jul 23, 2016, 4:07:11 PM
    Author     : Rowdy
--%>

<script>
    function validate(){
        
       
         var b=document.getElementById("txtenquiryid").value.length==0;
           
         if(b)
        {
           document.getElementById("txtenquiry").innerHTML="*Enquirer Name is Required";
        }
        
        
    }
    
</script>




<%@page import="java.sql.*"%>
<%@page import="DAL.Datahelper"%>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    
    <br>
    <h1>ADD New Registration</h1>
    <form action="../enquiryremark" method="post">
        
         <br>
         Select Enquirer Name
        <br>
       
        <select style="height:33px; width:172px; " id="txtenquiryid" name="txtenquiryid" required=""  >
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
          
         
         Remark
        <br>
        <textarea style="height:100px ; width: 172px; resize: vertical;"  name="txtremark"  ></textarea>
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


         