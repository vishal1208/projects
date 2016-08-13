<%-- 
    Document   : batchassignment
    Created on : Jul 15, 2016, 4:01:18 PM
    Author     : Rowdy
--%>

<script>
    function validate(){
    var x=document.getElementById("txtbatchassignid").value.length==0;
     var y=document.getElementById("txtbatchname").value.length==0;
    var z=document.getElementById("txtregid").value.length==0;
   
    if(x)
    {
        document.getElementById("batchassign").innerHTML="*Batch Assign ID is Required";
       
    }
    
     if(y)
    {
        document.getElementById("batchname").innerHTML="*Batch Name is Required";
        }
    if(z)
    {
        document.getElementById("regid").innerHTML="*Reg ID is Required";
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
    <h1>Assign Batches to Students</h1>
    <form action="../batchassign" method="post">
        
          Enter Batch Assignment ID
        <br>
        <input type="text" id="txtbatchassignid" name="txtbatchassignid" required="" >        
        <br>
        
        <div id="batchassign" style="color: red" > 
      
        
        
        </div>
        
            
            
        
        Select Batch Name
        <br>
        <select name="ddlbatch" id="txtbatchname" >
          <option value="">Select Batch Name</option>
          <%
          
            Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from batch_master");
            while(res.next())
            {%>
             
           <option value="<%= res.getInt(1) %>"> <%=  res.getString(2)     %></option>          
            
            
            <%} 
          
          
          
          %>
        
      </select>
           <div id="batchname" style="color: red" > 
      
        
        
        </div>
       
        <br> 
        
         Select Registration Id
        <br>
        <select name="ddlreg"  id="txtregid">
             
             <option value="">Select Reg. Id</option>
             <%
          
            Datahelper.connect();
            ResultSet res1 =Datahelper.DQL("select * from registration");
            while(res1.next())
            {%>
             
           <option value="<%= res1.getInt(1) %>"> <%=  res1.getString(1)     %></option>          
            
            
            <%} 
          
          
          
          %>
             
         </select>
         <div id="regid" style="color: red" > 
      
        
        
        </div>
       
          <br>
        <br>
        <input type="submit" name="btnSubmit" value="Submit" onclick="return validate()" ></input>
         <br>
         
        
    </form>
    

  
    
    <%

   if(request.getParameter("success")!=null)   
       out.println(request.getParameter("success"));
    
  %>
</div>

<%@include file="footer.jsp" %>