<?php

 session_start();
   if(isset($_SESSION['username']))
                {
                    
                 $ui=$_SESSION['username'];


$conn=mysqli_connect("localhost","root","","food_portal");
$c=$_GET['delete'];

$qry="DELETE FROM employee WHERE emp_id=$c";

$rs=mysqli_query($conn,$qry);

if($rs)
{
    echo "<script>alert('Successfully Deleted')</script>";
    header("location:viewemployee.php");   
}
else
{
    echo "<script>alert('Deletion Failed')</script>";
}

}
else
{
    header("location:login.php");
}







?>
