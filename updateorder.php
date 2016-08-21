<?php
$host='localhost';
$user='root';
$pass='';
$db='food_portal';

$conn= @mysqli_connect($host,$user,$pass,$db) or die("Can't connect to database");

session_start();
if(isset($_SESSION['username']))
                {
                    
                 $ui=$_SESSION['username'];

    $oc=$_GET['update'];
    
    $_SESSION['order_code']=$oc;
    
    $qry="SELECT * FROM `orders` WHERE order_code=$oc";
    
    $rs=mysqli_query($conn,$qry);
    
    $row=mysqli_fetch_row($rs);
    }
else
{
    header("location:login.php");
}


?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Employees | FoodPortal</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By Vishal">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />

        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="css/style.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="index.php" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                 <?php
                if(isset($_SESSION['username']))
                {
                    
                 $ui=$_SESSION['username'];
                 echo "Welcome ".$ui;
                
                }
                ?>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->
                      
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">

                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-user"></i>
                                <span><?php echo $ui;  ?><i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                                <li class="dropdown-header text-center">Account</li>

                                

                                    <li>
                                        <a href="adminprofile.php">
                                        <i class="fa fa-user fa-fw pull-right"></i>
                                            Profile
                                        </a>
                                        <a href="settings.php">
                                        <i class="fa fa-cog fa-fw pull-right"></i>
                                            Settings
                                        </a>
                                        </li>

                                        <li class="divider"></li>

                                        <li>
                                            <a href="logout.php"><i class="fa fa-ban fa-fw pull-right"></i> Logout</a>
                                        </li>
                                    </ul>

                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="img/avatar5.png" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hello, <?php echo $ui;  ?></p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                         <li>
                              <a href="index.php">
                              <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                               </a>
                        </li>
                      
                    
                        <li>
                            <a href="user.php">
                                <i class="fa fa-user"></i> <span>User-Details</span>
                            </a>
                        </li>
                         <li >
                                    <a href="employeereal.php">
                                        <i class="fa fa-gavel"></i> <span>Employees</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="menu.php">
                                        <i class="fa fa-glass"></i> <span>Menu</span>
                                    </a>
                                </li>
                                
                                 <li  class="active">
                                    <a href="orders.php">
                                        <i class="fa fa-tasks"></i> <span>Orders</span>
                                    </a>
                                </li>
                          
                                
                                <li>
                                    <a href="careers.php">
                                        <i class="fa fa-globe"></i> <span>Careers</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="aboutus.php">
                                        <i class="fa fa-search"></i> <span>About us</span>
                                    </a>
                                </li>
                                        

                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->


                <!-- Main content -->
                <section class="content">
                    <div class="row" >
                    
                    <br />
                    <div class="col-lg-7">
                          <section class="panel">
                              <header class="panel-heading">
                                 Edit Order
                              </header>
                              <div class="panel-body">
                                  <form role="form" action="updateorder2.php">
                                     
                                       <div class="form-group">
                                          <label for="exampleInputText1">Order Code</label>
                                          <input type="text" name="txtoc" class="form-control" id="exampleInputText11" placeholder="OrderCode" value="<?php echo $row[0];   ?>"  />
                                      </div>
                                      
                                       <div class="form-group">
                                          <label for="exampleInputText1">Order Date</label>
                                          <input type="date" name="txtdate" class="form-control" id="exampleInputText11" placeholder="Order Date" value="<?php echo $row[1]; ?>"  />
                                      </div>
                                      
                                      
                                      <div class="form-group">
                                          <label for="exampleInputText1">Order Bill</label>
                                          <input type="text" name="txtb" class="form-control" id="exampleInputText11" placeholder="Order Bill" value="<?php echo $row[2];   ?>"  />
                                      </div>
                                      
                                      <div class="form-group">
                                          <label for="exampleInputText1">User Id</label>
                                          <input type="text" name="txtui" class="form-control" id="exampleInputText11" placeholder="User ID" value="<?php echo $row[3]; ?>" />
                                      </div>
                                      
                                      
                                      <div class="form-group">
                                          <label for="exampleInputText1">Order Time</label>
                                          <input type="text" name="txtot" class="form-control" id="exampleInputText1" placeholder="Order Time" value="<?php echo $row[4]; ?>" />
                                      </div>
                                      
                                      
                                      
                                      
                                        <div class="form-group">
                                          <label for="exampleInputText1">Delivery Time</label>
                                          <input type="text" name="txtdt" class="form-control" id="exampleInputText11" placeholder="Delivery Time" value="<?php echo $row[5]; ?>" />
                                      </div>
                                      
                                      
                                      
                                        <div class="form-group">
                                          <label for="exampleInputText1">Details</label>
                                          <input type="text" name="txtd" class="form-control" id="exampleInputText11" placeholder="Details" value="<?php echo $row[6]; ?>" />
                                      </div>
                                      
                                      
                                  
                                      <button type="submit" name="up" class="btn btn-info">Update</button>
                                  </form>

                              </div>
                          </section>
                      </div>
                     
                    </div>

                </section><!-- /.content -->
            </aside><!-- /.right-side -->
            <div class="footer-main">
                Copyright &copy vishal & shikhar, 2016
            </div>
        </div><!-- ./wrapper -->
        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="js/jquery.min.js" type="text/javascript"></script>

        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="js/Director/app.js" type="text/javascript"></script>
    </body>
</html>
