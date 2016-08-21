<?php

$conn=@mysqli_connect("localhost","root","","food_portal") or die("Connection not established");
session_start();

?>
<html>
<head>
<title>Login</title>

   <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />

        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
                         
                 <div class="col-lg-6" style="margin-left:300px ;margin-right:100px ; margin-top:200px; border-top: 1px solid black;border-bottom: 1px solid black;" >          
                          <section class="panel" style="margin: 0px 0px 0px 0px;  " >
                              <header style="border-bottom: 1px solid black;" class="panel-heading">
                                                      
                             <center>     Admin Login  </center>
                              </header>
                              <div class="panel-body">
                                  <form class="form-horizontal" role="form">
                                      <div class="form-group">
                                          <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">UserName</label>
                                          <div class="col-lg-7">
                                              <input type="text" class="form-control" id="txtun" name="txtun" placeholder="Username" />
                          
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Password</label>
                                          <div class="col-lg-7">
                                              <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password" />
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <div class="col-lg-offset-2 col-lg-10">
                                              <div class="checkbox">
                                                  <label>
                                                      <input type="checkbox" /> Remember me
                                                  </label>
                                              </div>
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <div class="col-lg-offset-2 col-lg-10">
                                              <button type="submit" name="sbt" class="btn btn-danger">Sign in</button>
                                          </div>
                                      </div>
                                  </form>
                              </div>
                        </section>
               </div>
               
</body>
</html>




<?php
if(isset($_GET['sbt']))
{
    $un=$_GET['txtun'];
    $p=$_GET['pwd'];
    $qry="select * from administrator where username='$un' and password='$p'";
    
    $rs=mysqli_query($conn,$qry);
    
    if($row=mysqli_fetch_array($rs))
    {
        $_SESSION['username']=$row[0];    
        header("location:index.php");        
    }
    
    else
    {
        
       echo "<script>alert('Invalid Username or Password')</script>";
    }
    
    
}

?>