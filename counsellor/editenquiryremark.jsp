<%-- 
    Document   : editenquiryremark
    Created on : Jul 23, 2016, 4:07:49 PM
    Author     : Rowdy
--%>


<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    <br>
    <h1>Edit Enquiry-Remark Details</h1>
    <form action="../editenquiryremark"  method="post" >
    <table border="1">
        
        <tr>
             <th style="height:32px; " >Enquiry ID</th>
             <th>Remark</th>
            
        </tr>
    <%
    
    
    
           Datahelper.connect();
            ResultSet res =Datahelper.DQL("select * from enquiry_remark where enquiryid='"+request.getParameter("q") +"'");
            if(res.next())
            {
          String str1=res.getString(1);
           String str2=res.getString(2);
          
    %>
             
            <tr>
                <td><input style="width:100%; height:32px;  " type="text" name="txtenquiryid" readonly="" value="<%= str1 %>" > </td>
               
                <td><textarea style="width:100%; height:32px;  " name="txtremark" ><%= str2 %></textarea> </td>
                 
                
          
                <td><input style="width:100%;height:32px; " type="submit" name="btnUpdate" value="Update"></td>
       </tr>    
            
            
            
            <%}
            
            Datahelper.close_Conn();
    
    
    %>
    
    </table>
    </form>
    
</div>
<%@include file="footer.jsp" %>