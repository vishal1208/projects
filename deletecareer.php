<?php


session_start();
if(isset($_SESSION['username']))
                {
                    
                 $ui=$_SESSION['username'];


$conn=mysqli_connect("localhost","root","","food_portal");
$d=$_GET['delete'];

$qry="DELETE FROM careers WHERE request_no=$d";

$rs=mysqli_query($conn,$qry);

if($rs)
{
    echo "<script>alert('Successfully Deleted')</script>";
    header("location:careers.php");   
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
