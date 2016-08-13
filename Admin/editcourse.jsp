<%-- 
    Document   : editcourse
    Created on : Jun 5, 2016, 10:25:57 AM
    Author     : Rowdy
--%>

<script>
    function validate()
    {
        var x=document.getElementById("txtcoursename").value.length==0;
        if(x)
        {
                   //alert("branchid is required");
                   document.getElementById("coursename").innerHTML="*Course Name is required";
            return false;
        }
        
    }
    
    
    
</script>


<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    <br>
   <h1>Edit Course From Here</h1>
    <form action="../editcourseservlet"  method="post" >
   
        <table border="5" cellpadding="1">
           
                <tr>
                    <th style="height: 32px" > Course ID</th>
                    <th>Course Name </th>
                    <th> Course Content</th>
                    <th> Course Description</th>
                </tr>
           <%
   
           Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from coursemaster where courseid='"+request.getParameter("q") +"'");
            if(res.next())
            {%>
            
            <tr><td> <input style="height: 32px" type="text" name="txtcourseid" value="<%= res.getInt(1) %>" readonly="true"  ></td> <td><input style="height: 32px" type="text" id="txtcoursename" name="txtcoursename" value="<%=  res.getString(2)  %>" ><td><textarea style="height: 32px"  name="txtcoursecontent" ><%=  res.getString(3)  %></textarea><td><textarea style="height: 32px" name="txtcoursedesc" ><%=  res.getString(4)  %></textarea></td><td><input style="height: 32px;width'100%" type="submit" name="btnUpdate" onclick="return validate()" value="Update"></td></tr>    
           
                   <%}
            
            Datahelper.close_Conn();
    
    
    %>
                 
                
                
        </table>
    <div style="color: red"  id="coursename" >
        
        
    </div>
    
    </form>
    
</div>
<%@include file="footer.jsp" %>