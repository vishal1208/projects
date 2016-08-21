<?php

$host='localhost';
$user='root';
$pass='';
$db='food_portal';
session_start();
$conn= @mysqli_connect($host,$user,$pass,$db) or die("Can't connect to database");

if(isset($_SESSION['username']))
                {
                    
                 $ui=$_SESSION['username'];
}
else
{
    header("location:login.php");
}

if(isset($_POST['up']))
{
    $ic=$_SESSION['item_code'];
    
       
    $itemid=$_POST['txtid'];
    $itemname=$_POST['txtun'];
    $itemprice=$_POST['txtnumber'];
    
    
      $name=$_FILES['fil']['name'];
     $tname=$_FILES['fil']['tmp_name'];
      $type=$_FILES['fil']['type'];
       $size=$_FILES['fil']['size'];
        $error=$_FILES['fil']['error'];
        
      
       /* echo $itemid." ".$itemname." ".$itemprice."<br/>";
        
        echo $name." ".$tname." ".$type." ".$size." ".$error;
        */
       
       $img="./images/".$name;
       move_uploaded_file($tname,$img);
     
       echo "<br/>".$img;
      
       $query1="UPDATE `items` SET `item_code`=$itemid,`item_name`='$itemname',`item_price`=$itemprice,`item_image_url`='$img' WHERE `item_code`=$ic";
      
      $rs= mysqli_query($conn,$query1);
       
       
       if($rs)
       {
        echo"<script>alert('successfully Updated')</script>";
        header("location:menu.php");
       
       }
       
       else
       {
        
        echo"<script>alert('updation Failed')</script>";
       }
    
    
    
}



?>