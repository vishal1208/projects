<%-- 
    Document   : coursemaster
    Created on : Jun 4, 2016, 12:10:34 PM
    Author     : Rowdy
--%>
<script>
    
    
    function validate(){
    var x=document.getElementById("txtcourseid").value.length==0;
    var y=document.getElementById("txtcoursename").value.length==0;
    
    if(x)
    {
        document.getElementById("courseid").innerHTML="*Course ID is required";
    }
    if(y)
    {
        document.getElementById("coursename").innerHTML="*Course Name is required";
    }
    
    
    }
</script>


<%@include file="header.jsp" %>
<div id="page-wrapper">
    
    <br>
    <br>
    <h1>ADD New Course From Here</h1>
    <form action="../courseservlet" method="post">
        Enter Course Id
        <br>
        <input type="text" id="txtcourseid" name="txtcourseid" required="" > 
        <br>
     
        <div style="color: red" id="courseid">
            
        </div>
        
        Enter Course Name
        <br>
        
        <input type="text" id="txtcoursename" name="txtcoursename" required="" >
        <div style="color: red" id="coursename">
            
        </div>
        
        
        <br>
         Enter Course Content
        <br>
        <textarea name="txtcoursecontent" style="height:100px ; width: 172px; resize: vertical;" ></textarea>
         <br>
         Enter Course Description
        <br>
        <textarea name="txtcoursedesc" style="height:100px ; width: 172px; resize: vertical;" ></textarea>
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
