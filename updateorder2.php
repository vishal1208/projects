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
    $oc=$_SESSION['order_code'];
    
    $onc=$_GET['txtoc'];
    $date=$_GET['txtdate'];
    $b=$_GET['txtb'];
    $ui=$_GET['txtui'];
    $ot=$_GET['txtot'];
    $dt=$_GET['txtdt'];
    $d=$_GET['txtd'];
    
    //echo $oc." ".$onc." ".$date." ".$b." ".$ui." ".$ot." ".$dt." ".$d;
    

    
    $qry="UPDATE `orders` SET `order_code`=$onc,`order_date`='$date',`order_bill`=$b,`user_id`=$ui,`order_time`='$ot',`delivery_time`='$dt',`details`='$d' WHERE `order_code`=$oc";
    
    
    $rs=@mysqli_query($conn,$qry) or die("Failed!!");
    
    if($rs)
    {
       
        echo "<script>alert('Successfully Updated') </script>";
        header("location:orders.php");
    }
    else
    {
        echo "<script>alert('Updation Failed') </script>";
    }
    
   

}



?>