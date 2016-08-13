<%-- 
    Document   : header.jsp
    Created on : Jul 23, 2016, 1:03:16 PM
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
    <title>Counsellor Panel</title>
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
                    <span style="color:white; font-size: 27px; font-family: Arial "> Counsellor-Panel</span>
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
                        <a href="viewbranch.jsp"><i class="fa fa-bar-chart-o fa-fw"></i> View Branch </a>
                        <!-- second-level-items -->
                    </li>
                    <li>
                        <a href="viewcourse.jsp"><i class="fa fa-bar-chart-o fa-fw"></i> View Course </a>
                        <!-- second-level-items -->
                    </li>
                    
                    
                    <li>
                        <a href="viewcourseassign.jsp"><i class="fa fa-bar-chart-o fa-fw"></i> View Assigned Courses </a>
                        <!-- second-level-items -->
                    </li>
                    
                      <li>
                        <a href="viewfaculty.jsp"><i class="fa fa-bar-chart-o fa-fw"></i> View Faculty </a>
                        <!-- second-level-items -->
                    </li>
                   
                
                       <li>
                        <a href="viewbatch.jsp"><i class="fa fa-bar-chart-o fa-fw"></i> View Batch </a>
                        <!-- second-level-items -->
                    </li>
                   
                   
                      <li>
                        <a href="viewbatchassign.jsp"><i class="fa fa-bar-chart-o fa-fw"></i> View Assigned Batches </a>
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
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Enquiry-Remark<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                            <li>
                                <a href="addenquiryremark.jsp">ADD ENQUIRY-REMARK</a>
                            </li>
                            <li>
                                <a href="enquiryremark.jsp">MANAGE ENQUIRY-REMARK</a>
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
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Report/Search<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                            <li>
                                <a href="searchenquiry.jsp">SEARCH ENQUIRY</a>
                            </li>
                            
                            <li>
                                <a href="searchfees.jsp">SEARCH FEES</a>
                            </li>
                           
                            <li>
                                <a href="searchregistration.jsp">SEARCH REGISTRATION</a>
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