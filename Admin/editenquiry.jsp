<%-- 
    Document   : editenquiry
    Created on : Jul 14, 2016, 9:25:41 AM
    Author     : Rowdy
--%>


<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    <br>
    <h1>Edit Enquirer Details From Here</h1>
    <form action="../editenquiryservlet"  method="post" >
    <table border="1">
        
        <tr><th style="height:32px" >enquiry ID</th>
             <th>Name</th>
             <th>Fathers Name</th>
             <th>Contact no.</th>
            <th>Fathers Contact no.</th>
            <th>Address</th>
            <th>Technology Awared </th> 
            <th>Enquiry Course</th>
            <th>Enquiry Date</th>
            <th>Enquiry Reference</th>
             
             </tr>
    <%
    
    
    
           Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from enquiry where enquiryid='"+request.getParameter("q") +"'");
            if(res.next())
            {
    
         String str8=res.getString(8);
         String str9=res.getString(9);
         String str10=res.getString(10);
    %>
             
            <tr>
                <td><input style="width:100%; height:32px;  " type="text" name="txtenquiryid" value="<%=res.getInt(1)%>" > </td>
                <td> <input style="width:100%;height:32px; " type="text" name="txtenquiryname" value="<%=res.getString(2)%>" ></td>
        <td> <input style="width:100%;height:32px; " type="text" name="txtfathername" value="<%=res.getString(3)%>" ></td>
        <td><input style="width:100%; height:32px; " type="text" name="txtmob" value="<%=res.getString(4)%>" ></td>
        <td><input style="width:100%; height:32px; " type="text" name="txtfathermob" value="<%=res.getString(5)%>" ></td>
      <td>  <textarea style="width:100%; height:32px; "  name="txtenquiryaddress"><%=res.getString(6)%></textarea></td>
     <td>  <textarea style="width:100%; height:32px; "  name="txtenquirytech"><%=res.getString(7)%></textarea></td>
      <td>
            <select  style="width:100%; height:32px;" name="txtcourseid"  >
        
          
            <option value="<%= str8 %>" ><%= str8 %> </option>
            
            <%
            
            ResultSet res2 =Datahelper.DQL("select * from coursemaster"); 
            while(res2.next())
            {%>
             
           <option value="<%= res2.getString(1) %>"> <%=  res2.getString(2) %></option>          
            
            
            <%}
          
          %>
          
      </select>
     
      
      </td>   
      
      
      <td>  <input style="width:100%; height:32px;" type="date" name="txtenquirydate" value="<%= str9 %>"  ></td>
       <td> <input style="width:100%; height:32px;" type="text" name="txtenquiryref" value="<%= str10 %>"  ></td>
      <td><input style="width:100%; height:32px;" type="submit" name="btnUpdate" value="Update"></td>
       
            </tr>    
      
       
            
            
            <%}
            
            Datahelper.close_Conn();
    
    
    %>
    
    </table>
    </form>
    
</div>
<%@include file="footer.jsp" %>