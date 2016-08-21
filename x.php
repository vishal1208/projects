 <html>
 <head>
 
 </head>
 <body>
 <div>
  <?php
                     
          
$host='localhost';
$user='root';
$pass='';
$db='food_portal';

$conn= @mysqli_connect($host,$user,$pass,$db) or die("Can't connect to database");

     session_start();

    $qry="Select * from items order by item_code";
    $rs=mysqli_query($conn,$qry);
    
    $count=mysqli_num_fields($rs);
              
                     
                     
                     
                     
                                     echo "<form action='xhandler.php' ><table>";
                                     
                                       while( $row=mysqli_fetch_row($rs))
                                        {
                                            echo"<tr>";
                                            
                                            for($i=1;$i<$count+1;$i++)
                                            {
                                             
                                            if($i==$count)
                                              echo "<td style='width: 20%;border:none;'><input type='hidden' name='no$row[0]' value='$row[0]' /> <input type='number' name='qty$row[0]' value='0' /></td>" ;
                                           
                                              else if($i==$count-1)
                                                echo "<td style='width: 20%; border: none;'><img width='150px' height='120px' src='$row[3]' /></td>";
                                        
                                            
                                            else    
                                               echo "<td style='font-size: large;border: none;'>$row[$i]</td>";   
                                              
                                             
                                            }
                                             
                                            echo"</tr>";
                                        }
                                       
                                        
                                     echo "</table>";
                                                                   
                            echo "<input type='submit' name='sbt' value='submit'/></form>"          
?> 
 </body>
 
 </html>
  