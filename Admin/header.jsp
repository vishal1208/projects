<%-- 
    Document   : header.jsp
    Created on : Jun 1, 2016, 8:44:24 PM
    Author     : Rowdy
--%>
<%
 if(session.getAttribute("uid")==null)
 {
     response.sendRedirect("index.jsp");
 }
  
 %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <!-- Core CSS - Include with every page -->
    <link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/main-style.css" rel="stylesheet" />
    <!-- Page-Level CSS -->
    <link href="assets/plugins/morris/morris-0.4.3.min.css" rel="stylesheet" />
   </head>
<body>
    
    <!--  wrapper -->
    <div id="wrapper">
        <!-- navbar top -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
            <!-- navbar-header -->
            <div class="navbar-header">
                
                <a class="navbar-brand" href="profile.jsp">
                    <span style="color:white; font-size: 27px; font-family: Arial "> Administration</span>
                </a>
            </div>
           

        </nav>
        <!-- end navbar top -->

        <!-- navbar side -->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <!-- sidebar-collapse -->
            <div class="sidebar-collapse">
                <!-- side-menu -->
                <ul class="nav" id="side-menu">
                    <li>
                        <!-- user image section-->
                        <div class="user-section">
                            <div class="user-section-inner">
                                <img src="assets/img/user21.jpg" alt="">
                            </div>
                            <div class="user-info">
                                <div> <strong><%if(session.getAttribute("uid")!=null)
 {
     out.print(session.getAttribute("uid"));
 }
%></strong></div>
                                <div class="user-text-online">
                                    <span class="user-circle-online btn btn-success btn-circle "></span>&nbsp;Online
                                </div>
                            </div>
                        </div>
                        <!--end user image section-->
                    </li>
                    <li class="sidebar-search">
                        <!-- search section-->
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                        <!--end search section-->
                    </li>
                    <li class="selected">
                        <a href="profile.jsp"><i class="fa fa-dashboard fa-fw"></i>Dashboard</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Branch Master<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                            <li>
                                <a href="addbranch.jsp">Add Branch</a>
                            </li>
                            <li>
                                <a href="managebranch.jsp">Manage branch</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Course Master<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                            <li>
                                <a href="coursemaster.jsp">Add Course</a>
                            </li>
                            <li>
                                <a href="managecourse.jsp">Manage Course</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                   
                    
                     <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Course ASSIGN<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                            <li>
                                <a href="courseassignment.jsp">COURSE ASSIGNMENT</a>
                            </li>
                            <li>
                                <a href="managecourseassignment.jsp">Manage ASSIGNMENT</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                    
                     <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Faculty<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                            <li>
                                <a href="addfaculty.jsp">ADD FACULTY</a>
                            </li>
                            <li>
                                <a href="managefaculty.jsp">MANAGE FACULTY</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Enquiry<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                            <li>
                                <a href="addenquiry.jsp">ADD ENQUIRER</a>
                            </li>
                            <li>
                                <a href="enquiry.jsp">MANAGE ENQUIRY</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Registration<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                            <li>
                                <a href="addregistration.jsp">ADD NEW REGISTRATION</a>
                            </li>
                            <li>
                                <a href="manageregistration.jsp">MANAGE REGISTRATION</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Batch<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                            <li>
                                <a href="addbatch.jsp">ADD NEW BATCH</a>
                            </li>
                            <li>
                                <a href="managebatch.jsp">MANAGE BATCH</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Fees<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                            <li>
                                <a href="addfees.jsp">ADD Fees Table</a>
                            </li>
                            <li>
                                <a href="managefees.jsp">MANAGE Fees Table</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                     <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Batch ASSIGN<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                            <li>
                                <a href="batchassignment.jsp">BATCH ASSIGNMENT</a>
                            </li>
                            <li>
                                <a href="managebatchassignment.jsp">MANAGE ASSIGNMENT</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                    
                    
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Report/View<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                            <li>
                                <a href="viewenquiry.jsp">VIEW ENQUIRY</a>
                            </li>
                            <li>
                                <a href="viewbatch.jsp">VIEW BATCHES</a>
                            </li>
                            <li>
                                <a href="viewfaculty.jsp">VIEW FACULTY</a>
                            </li>
                            
                            <li>
                                <a href="viewfees.jsp">VIEW FEES</a>
                            </li>
                             <li>
                                <a href="viewregistration.jsp">VIEW REGISTRATION</a>
                            </li>
                            
                        </ul>
                        <!-- second-level-items -->
                    </li>
                    
                    
                    
                    
                    
                    
                    <li>
                        <a href="logout.jsp"><i class="fa fa-edit fa-fw"></i>Logout</a>
                    </li>
                    
                    
                    
                </ul>
                <!-- end side-menu -->
            </div>
            <!-- end sidebar-collapse -->
        </nav>