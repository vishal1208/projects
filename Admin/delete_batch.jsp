
<%-- 
    Document   : delete_batch
    Created on : Jul 15, 2016, 4:31:57 PM
    Author     : Rowdy
--%>


<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>

<div id="page-wrapper">
    <script>
        function validate()
        {
            var s=confirm("Do you want to delete the batch Assignment record or not?");
            if(s)
                return true;
            else
            {
                
                window.location='managebatchassignment.jsp';
                return false;
                }
            
        }
        
        
        
    </script>
    
    <br>
    <br>
    <h1>Delete batch Assignment Details</h1>
    <form action="../delete_batch_assignment_servlet"  method="post" >
    <table border="1">
        
        <tr>
            <th style="height: 32px;" >Batch Assign ID</th>
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
          
           //out.println(str);
           %>
           
           
             
             
           <td> <input style="height: 32px" type="text" name="txtbatchassignid" value="<%= res.getString(1) %>" readonly="true"  >               </td>
            
            
               
                <td>
                    <input  type="hidden" name="txtbatch" value="<%= res.getString(1) %>" >
     
                    <input type="hidden" name="txtreg" value="<%= res.getString(2) %>" >
     
                    <select  style="width:100%; height: 32px" name="ddlbatchid"  >
        
          
            <option name="<%= str %>" ><%= str %> </option>
            
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
         <select style="width:100%; height: 32px " name="ddlreg" >
                      
          <option name="<%= str1 %>" ><%= str1 %></option>   
   
            
            <%
            
           
            ResultSet res2 =Datahelper.DQL("select * from registration");
            while(res2.next())
            {%>
             
           <option value="<%= res2.getInt(1) %>"> <%=  res2.getString(1)     %></option>          
            
            
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
                
                
   
            
                
                <td><input type="submit" name="btnUpdate" value="Delete" onclick="return validate()"></td></tr>    
            
            
            
            <%
            
            Datahelper.close_Conn();
    
    
    %>
    
    </table>
   
    
</div>
<%@include file="footer.jsp" %>