<%-- 
    Document   : addfees
    Created on : Jul 15, 2016, 3:26:01 PM
    Author     : Rowdy
--%>
<script>
    
    
    function validate(){
       
    var x=document.getElementById("txtregid").value;
    if(x=="0")
    {
        document.getElementById("reg").innerHTML="*Enquirer Name is required";
    }
    
    }
</script>




<%@page import="java.sql.*"%>
<%@page import="DAL.Datahelper"%>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    
    <br>
    <h1>ADD New fees Table</h1>
    <form action="../feesservlet" method="post">
        
        
         Select Enquirer name(Via Reg ID)
        <br>
       
        <select style="height:33px; width:172px; " id="txtregid" name="txtregid" required=""  >
          <option value="0">Select Enquirer Name</option>
          <%
          
            Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from registration inner join enquiry where registration.enquiryid=enquiry.enquiryid order by regid ");
            while(res.next())
            {%>
             
           <option value="<%= res.getInt(1) %>"> <%=  res.getString(8)     %></option>          
            
            
            <%} 
          
          
          
          %>
        
      </select>
         <br>
         <div style="color: red" id="reg" >
             
         </div>   
             
         
        <br>
        
       Installment 
        <br>
        <input type="text" name="txtinstallment" >
        <br>
       <br>
        Installment Fees
        <br>
        <input type="text" name="txtinstallmentfees" >
        <br>
        <br>
       Enter Date
        <br>
        <input style="width: 172px" type="date"  name="txtdate" required="" >
         <br>
        
        <br>
        <input type="submit" value="Add" onclick="return validate()" name="btnsubmit" />
         <br>
         
    </form>
    
    <br>
    <%
      
          if(request.getParameter("success")!=null)
              out.println(request.getParameter("success"));
          
      %>
</div>
<%@include file="footer.jsp" %>


