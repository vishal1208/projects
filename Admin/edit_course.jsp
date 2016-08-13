<%-- 
    Document   : edit_course
    Created on : Jul 15, 2016, 4:31:28 PM
    Author     : Rowdy
--%>

<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    <br>
    <h1>Edit Course Assignment Details </h1>
    <form action="../edit_course_assignment_servlet"  method="post" >
    <table border="1">
        
        <tr>
            <th style="height: 32px">Course Assignment ID</th>
            <th>Course Name</th>
             <th>Branch Name</th>
             
             </tr>
             
            <tr> 
             
    <%
    
    try{
        Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from courseassignment where courseassignid='"+request.getParameter("q") +"'");
          
            if(res.next()){
            String str2=res.getString(2);
             String str3=res.getString(3);
           %>
           
           
           <td> <input style="height: 32px" type="text" name="txtcourseassignid" value="<%= res.getString(1) %>" readonly="true"  >               </td>
            
               
                <td>
      <select  style="width:100%;height: 32px" name="ddlcoursename"  >
        
             <%
           
     
           
            ResultSet res3 =Datahelper.DQL("select * from coursemaster where courseid='"+str2+"'");
            
           if(res3.next())
            {
             
             %>
        
          
            <option value="<%= res3.getString(1) %>" ><%= res3.getString(2) %> </option>
            
            <%
            }
            
            ResultSet res1 =Datahelper.DQL("select * from coursemaster"); 
            while(res1.next())
            {%>
             
           <option value="<%= res1.getString(1) %>"> <%=  res1.getString(2) %></option>          
            
            
            <%}
          
          
          
          %>
          
      </select>
          </td>
         
          <td>
         <select style="width:100%; height: 32px" name="ddlbranch" >
          
             <%
          
             
            
           ResultSet res4 =Datahelper.DQL("select * from branchmaster where branchid='"+str3+"'");
          
           if(res4.next())
            {
          
             %>
            
            
                      
          <option value="<%= res4.getString(1) %>" ><%= res4.getString(2) %></option>   
   
            
            <%
            }
           
            ResultSet res2 =Datahelper.DQL("select * from branchmaster");
            while(res2.next())
            {%>
             
           <option value="<%= res2.getString(1) %>"> <%=  res2.getString(2)     %></option>          
            
            
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
                
                
                
                
          
        <td><input style="height: 32px;width: 100%" type="submit" name="btnUpdate" value="Update"></td>
       </tr>    
            
            
            
            <%
            
            Datahelper.close_Conn();
    
    %>
    
    
    
    
    </table>
    </form>
    
</div>
<%@include file="footer.jsp" %>