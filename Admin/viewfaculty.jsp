<%-- 
    Document   : viewfaculty
    Created on : Jul 18, 2016, 5:50:27 PM
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
        <h1> VIEW/EDIT Faculties by Faculty Name</h1>
        
        <br>
        <h4> Select Faculty Name </h4>
        
        <select style="margin-right: 45px; height: 31px" name="ddlfaculty">
          <option value="">Faculty </option>
          <%
          
            Datahelper.connect();
            ResultSet res1 =Datahelper.DQL("select * from faculty");
            while(res1.next())
            {%>
             
           <option value="<%= res1.getString(1) %>"> <%=  res1.getString(2)     %></option>          
            
            
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
         String str1=request.getParameter("ddlfaculty");
         
         
         
         if(str!=null)
         {
             
             Datahelper.connect();
            ResultSet res =Datahelper.DQL("SELECT * FROM `faculty` WHERE facultyid='"+request.getParameter("ddlfaculty")+"' ORDER BY `facultyid`");
           if(res.next())
           {
                  //out.println(str1);
         %>
         
         <table border="1">
        <tr>
             <th style="height: 40px" >Faculty ID</th>
             <th>faculty Name</th>
             <th>Faculty Mobile no.</th>
             <th>faculty Email iD</th>
             <th style="width:90px" >Date of Birth</th>
             <th>Qualification</th>
             <th>Experience</th>
             <th style="width:90px"  >Joining Date</th>
             <th>Technology</th>
             <th>Address</th>
             <th>Allotted Branch ID</th>
             
             
             <th>Operations</th>
             
             </tr>
    <%
    res.beforeFirst();
      while(res.next())
            {%>
    
    
    <tr>
        <td><input style="width:100%; height: 40px; " type="text" name="txtfacultyid" readonly="" value="<%= res.getInt(1) %>" > </td>
        <td> <input style="width:100%; height: 40px; " type="text" name="txtfacultyname" readonly="" value="<%= res.getString(2) %>" ></td>
        <td><input style="width:100%; height: 40px; " type="text" name="txtfacultyno" readonly="" value="<%= res.getString(3) %>" ></td>
        <td><input style="width:100%; height: 40px; " type="email" name="txtfacultyemailid" readonly="" value="<%= res.getString(4) %>" ></td>
        <td><input style="width:100%; height: 40px; " type="date" name="txtfacultydob" readonly="" value="<%= res.getString(5) %>" ></td>
        <td> <textarea style="width:100%; height: 40px; " readonly="" name="txtfacultyqual"> <%= res.getString(6) %>  </textarea></td>
        <td> <input style="width:100%; height: 40px; " type="number" readonly="" name="txtfacultyexp" value="<%= res.getInt(7) %>" ></td>
        <td>  <input style="width:100%; height: 40px; " type="date" readonly="" name="txtfacultyjoin" value="<%= res.getString(8) %>"  ></td>
        <td> <textarea style="width:100%; height: 40px; " readonly=""  name="txtfacultytech">  <%= res.getString(9) %>   </textarea></td>
        <td>  <textarea style="width:100%; height: 40px; "  readonly="" name="txtfacultyaddress">   <%= res.getString(10) %>  </textarea></td>
        <td> <input style="width:100%; height: 40px; " type="text" readonly="" name="txtbranchid" value="<%= res.getInt(11) %>"  ></td>
      
      
      <td><a href="editfaculty.jsp?q=<%= res.getString(1)  %>">EDIT</a>/<a href="deletefaculty.jsp?q=<%= res.getString(1)  %>">DELETE</a></td>   
    
    </tr>    
            
             
            
            <%}
           }
           else
           {
                out.print("<script>alert('No Result Exists!') </script>");
              out.println("<script>window.location.replace('viewfaculty.jsp') </script>");   
        
           }
           
           
         }  
            Datahelper.close_Conn();
    
    
    %>
    
    </table> 
    
              
              
              
              
              
              
              
              
              
              
              
          </div>
    
</div>


<%@include file="footer.jsp" %>
