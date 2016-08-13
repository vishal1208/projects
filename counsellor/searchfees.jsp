<%-- 
    Document   : searchfees
    Created on : Jul 23, 2016, 2:57:20 PM
    Author     : Rowdy
--%>
<%@page  import="java.sql.*" %>
<%@page import="DAL.Datahelper" %>
<%@include file="header.jsp" %>
<div id="page-wrapper">
    
    <div>
        <br>
        <br>
        <form>
        <table>
            
            <tr><td><h1>How To Search </h1></td></tr> 
            <tr><td><h4>By Name </h> <input type="radio" name="rdo" value="m" /> </td></tr> 
            <tr><td><h4> By Date </h>  <input type="radio" name="rdo" value="f" /></td></tr>
     
<tr><td> <input type="submit" name="sbt" value="Submit"  > </td>  </tr>           
 
        </table> 

        </form>
    </div>
    
    
    <div>
    <br>
    
    <%
     String s=request.getParameter("sbt");
     String r1=request.getParameter("rdo");
   
     if(s!=null){
     
         if(r1.equals("f")){
    %>
    <form method="post" >
    <h1> VIEW Fees Details Via Date</h1>
    
    <br>
    
    <h4> Select Date Interval </h5> 
    
    <input style="margin-right:30px; width: 137px " type="date" name="txtdate1" required="" >
    
    <input style="margin-right:80px; width: 137px " type="date" name="txtdate2" required="" >
    
    <input style="height:40px ; " type="submit" name="submit" value="Submit"  >
    
    <br>
    </form>
    </div>
    
    
    <div>
       
         <br>
         <br>
         
         
         <%
         String str=request.getParameter("submit");
             
         if(str!=null)
         {
         
          Datahelper.connect();
            ResultSet res =Datahelper.DQL("select registration.regid,name,installment,installmentfee,date from fees inner join registration inner join enquiry where registration.regid=fees.regid and enquiry.enquiryid=registration.enquiryid and date between '"+request.getParameter("txtdate1")+"' and  '"+request.getParameter("txtdate2")+"' order by registration.regid");
         if(res.next())
         {
    
         
         %>
         
         <table border="1">
        
             <tr><th style="height: 32px;">Registration ID</th>
             <th>Enquirers Name</th>
            <th>Installments </th>
             <th>Installment Fees </th>
             <th>Date </th>
             
             
             
             
             <th>Operations</th>
            
             
             </tr>
    <%
             res.beforeFirst();
             while(res.next())
            {
         %>
    
    
    <tr>
        <td><input style="width:100%; height:32px;  " type="text" name="txtregid" readonly="" value="<%= res.getString(1) %>" > </td>
          <td> <input style="width:100%;height:32px; " type="text" name="txtenquiryname" readonly="" value="<%= res.getString(2) %>" ></td>
        <td> <input style="width:100%;height:32px; " type="text" name="txtinstallmentfees" readonly="" value="<%= res.getString(3) %>" ></td>
        <td><input style="width:100%; height:32px; " type="text" name="txtdat" readonly="" value="<%= res.getString(4) %>" ></td>
        <td><input style="width:100%; height:32px; " type="text" name="txtdate" readonly="" value="<%= res.getString(5) %>" ></td>
        
      <td><a href="editfees.jsp?q=<%= res.getInt(1)  %>">EDIT</a>/<a href="deletefees.jsp?q=<%= res.getInt(1)  %>">DELETE</a></td>   
    
    </tr>    
            
             
            
            <%}
         }
         else{
             
             out.print("<script>alert('No Result Exists between these dates') </script>");
              out.println("<script>window.location.replace('searchfees.jsp') </script>");   
        
         }
         
         }  
         }
         
         
         
     }
            Datahelper.close_Conn();
    
    
    %>
    
    </table> 
    
        
    
    
    
    
    
    
    
    
    
    
    
    </div>
    
    
    
    
    
    
    <div>
    <br>
    
    <%
     if(s!=null){
     
         if(r1.equals("m")){
    %>
    <form method="post" >
    <h1> VIEW Fees Details Via Name</h1>
    
    <br>
    
    <h4> Select Enquirer Name </h5> 
    
      <select style="margin-right: 45px; height: 31px" name="ddlenq">
          <option value="">Enquirer </option>
          <%
          
            Datahelper.connect();
            ResultSet res2 =Datahelper.DQL("select * from enquiry");
            while(res2.next())
            {%>
             
           <option value="<%= res2.getString(1) %>"> <%=  res2.getString(2)     %></option>          
            
            
            <%} 
          
          
          
          %>
        
      </select>
      
    
    
    
    
    <input style="height:40px ; " type="submit" name="submit1" value="Submit"  >
    
    <br>
    </form>
    </div>
    
    
    <div>
       
         <br>
         <br>
         
         
         <%
         String str4=request.getParameter("submit1");
         String str6=request.getParameter("ddlenq");
         
         if(str4!=null)
         {
             
             //out.println(str6);
           Datahelper.connect();
           // out.print(str6);
            ResultSet res1 =Datahelper.DQL("select registration.regid,name,installment,installmentfee,date from fees inner join registration inner join enquiry where fees.regid=registration.regid and registration.enquiryid=enquiry.enquiryid and enquiry.enquiryid='"+ str6+"' ORDER BY registration.regid");
           if(res1.next())      
           {
         %>
         
         <table border="1">
        
             <tr><th style="height: 32px;">Registration ID</th>
             <th>Enquirers Name</th>
            <th>Installments </th>
             <th>Installment Fees </th>
             <th>Date </th>
             
             
             
             
             <th>Operations</th>
            
             
             </tr>
    <%
    
           res1.beforeFirst();
           while(res1.next())
           {
                //out.print(str6);  
         %>
    
    
    <tr>
        <td><input style="width:100%; height:32px;  " type="text" name="txtregid" readonly="" value="<%= res1.getString(1) %>" > </td>
          <td> <input style="width:100%;height:32px; " type="text" name="txtenquiryname" readonly="" value="<%= res1.getString(2) %>" ></td>
        <td> <input style="width:100%;height:32px; " type="text" name="txtinstallmentfees" readonly="" value="<%= res1.getString(3) %>" ></td>
        <td><input style="width:100%; height:32px; " type="text" name="txtdat" readonly="" value="<%= res1.getString(4) %>" ></td>
        <td><input style="width:100%; height:32px; " type="text" name="txtdate" readonly="" value="<%= res1.getString(5) %>" ></td>
        
      <td><a href="editfees.jsp?q=<%= res1.getString(1)  %>">EDIT</a>/<a href="deletefees.jsp?q=<%= res1.getString(1)  %>">DELETE</a></td>   
    
    </tr>    
            
             
            
            <%}
           } 
         else
           {
               
                    out.print("<script>alert('No Result Exist for Enquired Name') </script>");
              out.println("<script>window.location.replace('searchfees.jsp') </script>");   
        
               
           }
            
           
         }
     }
     }
            Datahelper.close_Conn();
    
    
    %>
    
    </table> 
    
        
        
    </div>

    
</div>

<%@include file="footer.jsp" %>