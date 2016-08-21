<?php

          
$host='localhost';
$user='root';
$pass='';
$db='food_portal';

$conn= @mysqli_connect($host,$user,$pass,$db) or die("Can't connect to database");

     session_start();

if(isset($_GET['sbt']))
{
    $qry="Select * from items order by item_code";
    
    $rs=mysqli_query($conn,$qry);
    $row=mysqli_num_rows($rs); 
  $x=0;
   for($i=1;$i<=$row;$i++)
    {
        
        if($_GET["qty$i"]>0)
        {
        $rn[$i]=$_GET["no$i"];
        $qty[$i]=$_GET["qty$i"];
   
       $qry1="select item_name,item_price*$qty[$i] from items where item_code=$rn[$i]"; 
        
        $rs=mysqli_query($conn,$qry1);
        $row1=mysqli_fetch_row($rs); 
        
        $x=$x+ $row1[1];   
       // echo $x;
        
        echo $row1[0]."  ".$row1[1]."<br/>";
         
        }
      
    }
    echo $x;
  
  
  
  
  
 
 }  
   
?>