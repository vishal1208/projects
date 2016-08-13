<%-- 
    Document   : viewbatch
    Created on : Jul 16, 2016, 5:52:23 PM
    Author     : Rowdy
--%>

<%@page import="java.sql.*"%>
<%@page import="DAL.Datahelper"%>
<%@include file="header.jsp" %>

<div id="page-wrapper">
    
    <div>
        <br>
        <br>
        <form method="post" >
        <h1> VIEW/EDIT Batches by Batch Name</h1>
        
        <br>
        <h4> Select Batch Name </h4>
        
        <select style="margin-right: 45px; height: 31px" name="ddlbatch">
          <option value="">Batch </option>
          <%
          
            Datahelper.connect();
            ResultSet res1 =Datahelper.DQL("select * from batch_master");
            while(res1.next())
            {%>
             
           <option value="<%= res1.getString(2) %>"> <%=  res1.getString(2)     %></option>          
            
            
            <%} 
          
          
          
          %>
        
      </select>
          <input style="height: 31px;" type="submit" name="submit" value="Submit"  >
        
        </form>
        
    </div>
    
          <div>
              <br>
              <br>
              
              
              
              
              
              
         <%
         String str=request.getParameter("submit");
         String str1=request.getParameter("ddlbatch");
         
         
         
         if(str!=null)
         {
              Datahelper.connect();
            ResultSet res =Datahelper.DQL("SELECT * FROM `batch_master` WHERE batchname='"+request.getParameter("ddlbatch")+"' ORDER BY `batchid`");
          if(res.next())
          {
         //out.println(str1);
         %>
         
         <table border="1">
        
             <tr><th style="height: 32px">Batch ID</th>
             <th>Batch Name</th>
       
             <th>Batch Date</th>
            <th>Course ID</th>
            <th>Faculty ID</th>
            <th>Batch Time</th> 
            <th>Batch Duration</th>
            <th>Operations</th>
            
             
             </tr>
    <%
    res.beforeFirst();
      while(res.next())
            {%>
    
    
    <tr>
        <td><input style="width:100%; height:32px;  " type="text" name="txtbatchid" readonly="" value="<%= res.getString(1) %>" > </td>
          <td> <input style="width:100%;height:32px; " type="text" name="txtbatchname" readonly="" value="<%= res.getString(2) %>" ></td>
        <td> <input style="width:100%;height:32px; " type="text" name="txtbatchdate" readonly="" value="<%= res.getString(3) %>" ></td>
        <td><input style="width:100%; height:32px; " type="text" name="txtcourseid" readonly="" value="<%= res.getString(4) %>" ></td>
        <td><input style="width:100%; height:32px; " type="text" name="txtfacultyid" readonly="" value="<%= res.getString(5) %>" ></td>
      <td>  <textarea style="width:100%; height:32px; "  name="txtbatchtime" readonly="" ><%= res.getString(6) %></textarea></td>
     <td>  <textarea style="width:100%; height:32px; "  name="txtbatchdur" readonly="" ><%= res.getString(7) %></textarea></td>
      
      
      <td><a href="editbatch.jsp?q=<%= res.getString(1)  %>">EDIT</a>/<a href="deletebatch.jsp?q=<%= res.getString(1)  %>">DELETE</a></td>   
    
    </tr>    
            
             
            
            <%}
          }
          else{
              
               out.print("<script>alert('No Result Exists') </script>");
              out.println("<script>window.location.replace('viewbatch.jsp') </script>");   
        
          }
          
          
         }  
            Datahelper.close_Conn();
    
    
    %>
    
    </table> 
    
              
              
              
              
              
              
              
              
              
              
              
          </div>
    
</div>


<%@include file="footer.jsp" %>
