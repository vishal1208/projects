<%-- 
    Document   : faculty
    Created on : Jul 12, 2016, 11:34:06 AM
    Author     : Rowdy
--%>
<script>
    
    
    function validate(){
    var x=document.getElementById("txtfacultyid").value.length==0;
    if(x)
    {
        document.getElementById("faculty").innerHTML="*Faculty ID is required";
    }
    
    var y=document.getElementById("txtbranchid").value.length==0;
    if(y)
    {
        document.getElementById("txtbranch").innerHTML="*Branch Name is required";
    }
    
    
    }
</script>


<%@page import="java.sql.ResultSet"%>
<%@page import="DAL.Datahelper"%>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    
    <br>
    <h1>ADD New Faculty</h1>
    <form action="../facultyservlet" method="post">
        Enter Faculty Id
        <br>
        <input type="text" id="txtfacultyid" name="txtfacultyid" required="" > 
        <br>
        
        <div style="color: red" id="faculty" > 
        
        
        </div>
        
            
        
        Enter Faculty Name
        <br>
        <input type="text" name="txtfacultyname" required="" >
         <br>
        Enter Faculty Mobile NO.
        <br>
        <input type="text" name="txtfacultyno" required="" >
         <br>
         
        Enter Faculty Email ID
        <br>
        <input type="email" name="txtfacultyemailid" required="" >
         <br>
        Enter Date Of Birth
        <br>
        <input type="date" style="width: 172px;" name="txtfacultydob" required="" >
         <br>
        Enter Qualification
        <br>
        <textarea style="height:100px ; width: 172px; resize: vertical;" name="txtfacultyqual">     </textarea>
         <br>
         
        Enter Faculty Experience(in yrs)
        <br>
        <input type="number" name="txtfacultyexp" >
         <br>
       Enter Joining Date
        <br>
        <input type="date" style="width: 172px;" name="txtfacultyjoin" required="" >
         <br>
        Enter Technology
        <br>
        <textarea style="height:60px ; width: 172px; resize: vertical;" name="txtfacultytech">     </textarea>
         <br>
         Enter Address
        <br>
        <textarea style="height:100px ; width: 172px;  resize: vertical;" name="txtfacultyaddress">     </textarea>
         <br>
         
         
         
        Enter Allotted Branch Name(via Branch ID)
        <br>
        <select style="height:33px; width:172px; " id="txtbranchid" name="txtbranchid" required=""  >
          <option value="">Select Branch Name</option>
          <%
          
            Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from branchmaster");
            while(res.next())
            {%>
             
           <option value="<%= res.getInt(1) %>"> <%=  res.getString(2)     %></option>          
            
            
            <%} 
          
          
          
          %>
        
      </select>
          <div id="txtbranch" style="color: red" >
          </div> 
         <br>
       
         
         
         
         
         
         
         <br>
       
         <input type="submit" onclick="return validate()" value="Add" name="btnsubmit" />
         <br>
         
    </form>
    
    <br>
    <%
      
          if(request.getParameter("success")!=null)
              out.println(request.getParameter("success"));
          
      %>
</div>
<%@include file="footer.jsp" %>
