<%-- 
    Document   : addbatch
    Created on : Jul 15, 2016, 3:19:22 PM
    Author     : Rowdy
--%>

<script>
    
    function validate()
    {
   var x=document.getElementById("txtbatchid").value.length==0;
        if(x)
        {
           document.getElementById("batch").innerHTML="*Batch Id is Required";
        }
         var y=document.getElementById("txtcourse").value.length==0;
           
         if(y)
        {
           document.getElementById("course").innerHTML="*Course is Required";
        }
         var y=document.getElementById("txtfaculty").value.length==0;
           
         if(y)
        {
           document.getElementById("faculty").innerHTML="*Faculty is Required";
           return false;
        }
        
    }    
   
</script>





<%@page import="java.sql.*"%>
<%@page import="DAL.Datahelper"%>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    
    <br>
    <h1>ADD New Batch</h1>
    <form action="../batchservlet" method="post">
        Enter Batch Id
        <br>
        <input type="text" name="txtbatchid" id="txtbatchid" required="" > 
        <br>
        <div style="color: red" id="batch" >
            
        </div>
        
        Enter Batch name
        <br>
        <input type="text" name="txtbatchname" required="" > 
        <br>
        

       Enter Batch Date
        <br>
        <input type="date" style="width: 172px;" name="txtbatchdate" >
       
        <br>
        <br>
        Select Course Name
        <br>
       
        <select style="height:33px; width:172px;" id="txtcourse" name="txtcourseid" required=""  >
          <option value="">Select Course Name</option>
          <%
          
            Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from coursemaster");
            while(res.next())
            {%>
             
           <option value="<%= res.getInt(1) %>"> <%=  res.getString(2)     %></option>          
            
            
            <%} 
          
          
          
          %>
        
      </select>
          <div id="course" style="color: red" >
              
          </div>
          
         <br>
        <br>  
          Select Faculty Name
          <br>
          <select style="height:33px; width:172px; " id="txtfaculty" name="txtfacultyid" required="" >
          <option value="">Select Faculty Name</option>
          <%
          
            Datahelper.connect();
            ResultSet res1 =Datahelper.DQL("select * from faculty");
            while(res1.next())
            {%>
             
           <option value="<%= res1.getInt(1) %>"> <%=  res1.getString(2)     %></option>          
            
            
            <%} 
          
          
          
          %>
        
      </select>
          <div style="color: red" id="faculty">
              
          </div>  
        <br>
          <br>
         Enter Batch Time
        <br>
        <input type="time" style="width: 172px;" name="txtbatchtime"  >
         <br>
         Enter Batch Duration
        <br>
        <input type="time" style="width: 172px;" name="txtbatchdur"  >
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


