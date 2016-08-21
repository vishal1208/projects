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
    $rn=$_SESSION['request_no'];
    
    $rnn=$_GET['txtrn'];
    $n=$_GET['txtn'];
    $a=$_GET['txta'];
    $c=$_GET['txtc'];
    $email=$_GET['txtemail'];
    $dob=$_GET['txtdate'];
    $e=$_GET['txte'];
    $i=$_GET['txti'];
    $ex=$_GET['txtex'];
    $s=$_GET['txts'];
    
    
    
    
    $qry="UPDATE `careers` SET `request_no`=$rnn,`name`='$n',`address`='$a',`mobile_no`='$c',`date_of_birth`='$dob',
    `education`='$e',`interested`='$i',`experience`='$ex',`status`='$s',`email_id`='$email' WHERE `request_no`=$rn ";
    
    $rs=mysqli_query($conn,$qry);
    
    if($rs)
    {
        echo "<script>alert('Successfully Updated') </script>";
    }
    else
    {
        echo "<script>alert('Updation Failed') </script>";
    }
    
   header("location:careers.php");

}



?>