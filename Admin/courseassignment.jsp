<%-- 
    Document   : courseassignment
    Created on : Jun 11, 2016, 9:52:53 PM
    Author     : Rowdy
--%>
<script>
    function validate(){
    var x=document.getElementById("txtcourseassignid").value.length==0;
    var y=document.getElementById("txtcoursename").value.length==0;
    var z=document.getElementById("txtbranchname").value.length==0;
    if(x)
    {
        document.getElementById("courseassign").innerHTML="*Course Assign ID is Required";
         }
    if(y)
    {
        document.getElementById("coursename").innerHTML="*Course Name is Required";
        }
    if(z)
    {
        document.getElementById("branchname").innerHTML="*Branch Name is Required";
        return false;
    }
   
    }
</script>



<%@include file="header.jsp" %>
<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<div id="page-wrapper">
    <br>
    <br>
    <h1>Assign Course to Branch</h1>
    <form action="../courseassign" method="post">
        
        Enter Course Assignment ID
        <br>
        <input type="text" name="txtcourseassignid" id="txtcourseassignid" required="" >        
        <br>
        
        <div style="color: red" id="courseassign">
           
        </div> 
        
        Enter Course Name
        <br>
        <select style="width: 172px" id="txtcoursename" name="ddlcoursename"  >
          <option value="">Select Course</option>
          <%
          
            Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from coursemaster");
            while(res.next())
            {%>
             
           <option value="<%= res.getInt(1) %>"> <%=  res.getString(2)     %></option>          
            
            
            <%} 
          
          
          
          %>
          
      </select>
        <div style="color: red" id="coursename">
           
        </div> 
       
          <br>
         Enter Branch Name
        <br>
        <select style="width: 172px;" id="txtbranchname" name="ddlbranch" >
             
             <option value="">Select Branch</option>
             <%
          
            Datahelper.connect();
            ResultSet res1 =Datahelper.DQL("select * from branchmaster");
            while(res1.next())
            {%>
             
           <option value="<%= res1.getInt(1) %>"> <%=  res1.getString(2)     %></option>          
            
            
            <%} 
          
          
          
          %>
             
         </select>
         <div style="color: red" id="branchname">
           
        </div> 
       
          <br>
        <br>
        <input type="submit" name="btnSubmit" onclick="return validate()" value="Submit" >
         <br>
         
        
    </form>
    

  
    
    <%

   if(request.getParameter("success")!=null)   
       out.println(request.getParameter("success"));
    
  %>
</div>

<%@include file="footer.jsp" %>