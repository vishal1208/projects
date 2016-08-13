<%-- 
    Document   : deleteenquiryremark
    Created on : Jul 23, 2016, 4:08:01 PM
    Author     : Rowdy
--%>



<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    
      <script>
        function validate()
        {
            var s=confirm("Do you want to delete the Enquiry-Remark record or not?");
            if(s)
                return true;
            else
            {
                
                window.location='enquiryremark.jsp';
                return false;
                }
            
        }
        
        
        
    </script>
    
    <br>
    <h1>Delete Enquiry-Remark Details</h1>
    <form action="../deleteenquiryremark"  method="post" >
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
                 
                
          
       
    
    
    
                <td><input style="width:100%;height:32px; " type="submit" name="btnUpdate" value="Delete" onclick="return validate()" ></td>
       </tr>    
            
            
            
            <%}
            
            Datahelper.close_Conn();
    
    
    %>
    
    </table>
    </form>
    
</div>
<%@include file="footer.jsp" %>