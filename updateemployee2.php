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
    $ei=$_SESSION['emp_id'];
    
    $eni=$_GET['txtei'];
    $en=$_GET['txten'];
    $eun=$_GET['txteun'];
    $p=$_GET['pwd'];
    $a=$_GET['txta'];
    $d=$_GET['txtd'];
    $o=$_GET['txto'];
    $s=$_GET['txts'];
    $c=$_GET['txtc'];
    $dob=$_GET['txtdate'];
    
    $qry="update employee set emp_id=$eni, emp_name='$en', emp_user_name='$eun', emp_pass='$p', address='$a', designation='$d', outlet='$o',
     salary=$s, contact_no='$c', date_of_birth='$dob' where emp_id=$ei";
    
    $rs=mysqli_query($conn,$qry);
    
    if($rs)
    {
        echo "<script>alert('Successfully Updated') </script>";
    }
    else
    {
        echo "<script>alert('Updation Failed') </script>";
    }
    
   header("location:viewemployee.php");

}



?>