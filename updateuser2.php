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
if(isset($_GET['up']))
{
    $ui=$_SESSION['user_id'];
    
   $usi=$_GET['txtui'];
    $usn=$_GET['txtun'];
    $p=$_GET['pwd'];
    $a=$_GET['txta'];
    $ci=$_GET['txtcity'];
    $pi=$_GET['txtp'];
    $c=$_GET['txtc'];
    $dob=$_GET['txtdate'];
    $points=$_GET['txtpoints'];
    
    $qry="UPDATE `user` SET `user_id`=$usi,`user_name`='$usn',`user_password`='$p',`address`='$a',`city`='$ci',
    `pincode`=$pi,`contact_no`=$c,`dob`='$dob',`points`=$points WHERE `user_id`=$ui";
    
    $res=mysqli_query($conn,$qry);
    
     if($res)
     {
        echo "<script> alert('Data Successfully Inserted') </script>";
        header("location:user.php");   
     }
     
     else
       echo "<script> alert('Data Not inserted')  </script>";


}



?>