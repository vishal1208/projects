<%-- 
    Document   : edit_batch
    Created on : Jul 15, 2016, 4:31:46 PM
    Author     : Rowdy
--%>

<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    <br>
    <h1>Edit Batch Detail</h1>
    <form action="../edit_batch_assignment_servlet"  method="post" >
    <table border="1">
        
        <tr>
            <th style="height: 32px">Batch Assign ID</th>
            <th>Batch ID</th>
             <th>Registration ID</th>
             
             </tr>
             
            <tr> 
             
    <%
    
    try{
        Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from batch_assignment where batchassignid='"+request.getParameter("q") +"'");
          
            if(res.next()){
            String str=res.getString(2);
          String str1=res.getString(3);
          
           // out.println(str+"  "+str1 );
           
    %>
           
           
             
             <td> <input style="height: 32px" type="text" name="txtbatchassignid" value="<%= res.getString(1) %>" readonly="true"  > 
             </td>
            
               
                <td>
      <select  style="width:100%; height: 32px" name="ddlbatchid"  >
        
          
            <option value="<%= res.getString(2) %>" ><%= res.getString(2) %> </option>
            
            <%
            
            ResultSet res1 =Datahelper.DQL("select * from batch_master"); 
            while(res1.next())
            {%>
             
           <option value="<%= res1.getString(1) %>"> <%=  res1.getString(2) %></option>          
            
            
            <%}
          
          
          
          %>
          
      </select>
          </td>
         
          <td>
         <select style="width:100%; height: 32px" name="ddlreg" >
                      
             <option value="<%= str1 %>" ><%= str1 %></option>   
   
            
            <%
            
           
            ResultSet res2 =Datahelper.DQL("select * from registration");
            while(res2.next())
            {%>
             
           <option value="<%= res2.getString(1) %>"> <%=  res2.getString(1)     %></option>          
            
            
            <%
            } 
          
            }
            
            
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
    
          
          %>
             
         </select>
        </td>
                
                
                
                
          
        <td><input style="width:100%; height: 32px; " type="submit" name="btnUpdate" value="Update"></td>
       </tr>    
            
            
            
            <%
            
            Datahelper.close_Conn();
    
    %>
    
    
    
    
    </table>
    </form>
    
</div>
<%@include file="footer.jsp" %>