<?php

$host='localhost';
$user='root';
$pass='';
$db='food_portal';

$conn= @mysqli_connect($host,$user,$pass,$db) or die("Can't connect to database");

     session_start();

    $qry="Select * from items order by item_code";
    $rs=mysqli_query($conn,$qry);
    
    $count=mysqli_num_fields($rs);
   

?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Menu | FoodPortal</title>
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
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="images/shikhar.jpeg" class="img-circle" alt="User Image" />
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

                                <li class="active" >
                                    <a href="menu.php">
                                        <i class="fa fa-glass"></i> <span>Menu</span>
                                    </a>
                                </li>
                          
                                <li>
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
            <div class="right-side">

                <section class="content">
                    <div class="row">
                             
                              <h1>&nbsp; <a href="additem.php" >ADD</a> A New Dish </h1>
                             
                             <div class="panel-body table-responsive">
                                    <div class="box-tools m-b-15">
                                        <div class="input-group">
                                            <input type="text" name="table_search" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                    <table class="table table-hover">
                                        <tr>
                                            <th>Item Code</th>
                                            <th>Item Name</th>
                                            <th>Item Price</th>
                                            <th>Image</th>
                                            <th>  </th>
                                            <th>  </th>
                                        <?php
                                        
                                        while( $row=mysqli_fetch_row($rs))
                                        {
                                            echo"<tr>";
                                            
                                            for($i=0;$i<$count+3;$i++)
                                            {
                                            
                                            if($i==$count)
                                                echo "<td><form action='updateitem.php' > <input type='hidden' name='update' value='$row[0]' />   <input type='submit'  value='Update' class='active btn btn-info' /></form></td>";
                                            
                                            else if($i==$count+1)
                                                echo "<td><form action='deleteitem.php' > <input type='hidden' name='delete' value='$row[0]' />   <input type='submit'  value='Delete' class='active btn btn-info' /></form></td>";
                                            
                                                 else if($i==$count+2)
                                                echo "<td><form action='order.php' > <input type='hidden' name='order' value='$row[0]' />   <input type='submit'  value='order now' class='active btn btn-info' /></form></td>";
    
                                                                                         
                                              else if($i==$count-1)
                                            {
                                                echo "<td><img width='130px' height='100px' src='$row[3]' /></td>";
                                            }
                                            
                                            else    
                                               echo "<td>$row[$i]</td>";   
                                              
                                             
                                            }
                                             
                                            echo"</tr>";
                                        }
                                        
                                        
                                        ?>
                                        
                                         </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                       
 
                                         
              
              



                    </div>

                </section>
            </div>
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