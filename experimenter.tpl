<!DOCTYPE HTML>
<!-- PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">-->
<html>
<head>
    <meta content="text/html; charset=utf-8" http-equiv="content-type">
    <link rel="shortcut icon" type="image/png" href="static/favicon.ico"/>
    <script type="text/javascript" src="static/vendors/renderJson/renderjson.js"></script>
    <title>SoftFIRE middleware</title>
    <!-- Bootstrap -->
    <link href="static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="static/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="static/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="static/custom.css" rel="stylesheet">
    <script src="static/modernizr.custom.js"></script>
</head>
<body class="nav-md">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.js"></script>
<script>
    // Prevent form submission, send POST asynchronously and parse returned JSON
    // $("div#status").delay(2800).fadeOut(700);
    var updateTimer;
    var count = 0;
    // Get the modal
    var addResModal = document.getElementById('addResModal');
    var reserveModal = document.getElementById('reserveModal');
    // Get the button that opens the modal
    var addResBtn = document.getElementById("addResBtn");
    var reserveBtn = document.getElementById("reserveBtn");
    // Get the <span> element that closes the modal
    var spans = document.getElementsByClassName("close");
    //        // When the user clicks on the button, open the modal
    //        addResBtn.onclick = function() {
    //            addResModal.style.display = "block";
    //        }
    //        reserveBtn.onclick = function() {
    //            reserveModal.style.display = "block";
    //        }
    //        // When the user clicks on <span> (x), close the modal
    for (var i = 0; i < spans.length; i++) {
        spans[i].onclick = function () {
            addResModal.style.display = "none";
            reserveModal.style.display = "none";
        }
    }
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == addResModal || event.target == reserveModal) {
            addResModal.style.display = "none";
            reserveModal.style.display = "none";
        }
    }

    function refreshResources() {
        // document.getElementById("whatever").innerHTML="Loading...";
        // document.getElementById("buttonRefresh").disabled = true;
        $.ajax({
            url: "/refresh_images",
            type: "GET",
            // data: "{}",
            // dataType: "json",
            contentType: "application/json",
            success: function (result) {
                console.log("success");
                location.reload();
            }
        });
    }

    function openTable(evt, resourceName) {
        // Declare all variables
        var i, tabcontent, tablinks;

        // Get all elements with class="tabcontent" and hide them
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }

        // Get all elements with class="tablinks" and remove the class "active"
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }

        // Show the current tab, and add an "active" class to the button that opened the tab
        document.getElementById(resourceName).style.display = "block";
        evt.currentTarget.className += " active";
    }

    $('form').submit(function () {
        $("div#status").fadeIn(100);
        $("div#status").text('Loading...');
        z = $(this);
        console.log(z)
        $.post($(this).attr('action'), new FormData(z), function (j) {
            console.log('here')
            console.log(j)
            console.log('j: ' + j)
            if (j.ok) {
                $("div#status").css("background-color", "#f0fff0");
                $("div#status").text('Ok.');
                window.location = j.redirect;
            } else {
                $("div#status").css("background-color", "#fff0f0");
                $("div#status").text(j.msg);
            }
            $("div#status").delay(1800).fadeOut(700);
        });

        return false;
    });

    $(document).ready(function () {
        document.getElementById('availableResources').style.display = "block";
        ajaxd();
        updateTimer = setInterval("ajaxd()", 5000);
    });

    function ajaxd() {
        if (count++ == 25) {
            clearInterval(updateTimer);
            return;
        }
        $.ajax({
            type: "GET",
            url: "get_status",
            contentType: 'application/json',
            dataType: "json",
            success: function (value) {
                //  console.log(value);

                $('#experimentValue tr').remove();
                $('#experimentValue').append('<tr><th>Resource Id</th><th>Status</th><th>Value</th></tr>');

                for (var i = 0; i < value.length; i++) {
                    // j = JSON.stringify(JSON.parse(value[i]['value']), null, 2)
                    try {
                        j = renderjson.set_show_to_level(3).set_icons('+', '-')(JSON.parse(value[i]['value']))

                    } catch (e) {
                        j = $("<div>").innerHTML = value[i]['value']
                    } finally {
                        $('#experimentValue').append(
                            $('<tr>').append('<td>' + value[i]['resource_id'] + '</td><td>' + value[i]['status'] + '</td>').append($('<td>').append(j))
                        )
                    }

                }

                //  .innerHTML = JSON.stringify(value[0]['resource_id'],null,2)
                //  $(msg).appendTo("#edix");
            }
        });
    }
    function StartRefresh() {
        document.getElementById('availableResources').style.display = "block";
        ajaxd();
        updateTimer = setInterval("ajaxd()", 5000);
    }
    function StopRefresh() {
        clearInterval(updateTimer);
    }
</script>
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col menu_fixed mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <img src="static/softfire.jpg" alt="logo" class="img-circle profile_img">
                </div>
                <div class="clearfix"></div>
                <!-- menu profile quick info -->
                <div class="profile clearfix">
                    <div class="profile_pic">
                    </div>
                </div>
                <!-- /menu profile quick info -->
                <br/>
                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <ul class="nav side-menu">
                            <li><a href="/experimenter"><i class="fa fa-flask"></i> Experiment </a>
                            </li>
                            <li><a href="/calendar"><i class="fa fa-calendar"></i> Calendar </a>
                            </li>
                            <li><a href="http://docs.softfire.eu"><i class="fa fa-file"></i> Documentation</a>
                            </li>
                            <li><a href="#" data-toggle="modal" data-target="#modal1"><i class="fa fa-lock"></i> Reserve
                                Resource </span></a>
                            </li>
                            <li><a href="#" data-toggle="modal" data-target="#modal2"><i class="fa fa-plus"></i> Add
                                Resource </span></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /sidebar menu -->
            </div>
        </div>
        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <nav>
                    <div style="width: auto; padding-top: 14px;" class="nav toggle">
                        <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                    </div>
                    <h2 style="display: inline-block;"> Experiment </h2>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                               aria-expanded="false">
                                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                {{current_user.username}}
                                <span class=" fa fa-angle-down"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-usermenu pull-right">
                                <li><a href="/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                            </ul>
                        </li>
                        <li><label id="btnControl" class="tablinksRight" for="btnControl" onclick='refreshResources()'>
                            <i style="font-size: 25px;line-height: 52px;color: #FF661A;" onclick="toggleColor()"
                               id="btn1" class="fa fa-refresh"></i>
                        </label></li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- /top navigation -->
        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="clearfix"></div>
                <div class="x_panel">
                    <div class="x_content">
                        <div class="" role="tabpanel" data-example-id="togglable-tabs">
                            <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab"
                                                                          data-toggle="tab" aria-expanded="true">SoftFIRE
                                    Resources</a>
                                </li>
                                <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab"
                                                                    data-toggle="tab" aria-expanded="false">User
                                    Resources</a>
                                </li>
                                <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2"
                                                                    data-toggle="tab" aria-expanded="false">Images</a>
                                </li>
                                <li role="presentation" class=""><a href="#tab_content4" role="tab" id="profile-tab4"
                                                                    data-toggle="tab" aria-expanded="false">Networks</a>
                                </li>
                                <li role="presentation" class=""><a href="#tab_content5" role="tab" id="profile-tab5"
                                                                    data-toggle="tab" aria-expanded="false">Flavors</a>
                                </li>
                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <div role="tabpanel" class="tab-pane fade active in" id="tab_content1"
                                     aria-labelledby="home-tab">
                                    <div id="availableResources" class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <table class="table table-striped table-bordered">
                                                <tr>
                                                    <th>Resource Id</th>
                                                    <th>NodeType</th>
                                                    <th>Cardinality</th>
                                                    <th>Testbed</th>
                                                    <th>Description</th>
                                                </tr>
                                                %for r in resources:
                                                <tr>
                                                    <td>{{r['resource_id']}}</td>
                                                    <td>{{r['node_type']}}</td>
                                                    <td>{{r['cardinality']}}</td>
                                                    <td>{{r['testbed']}}</td>
                                                    <td>{{r['description']}}</td>
                                                </tr>
                                                %end
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="tab_content2"
                                     aria-labelledby="profile-tab">
                                    <div id="availableUserResources" class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-1">
                                            <table class="table table-striped table-bordered">
                                                <tr>
                                                    <th>Resource Id</th>
                                                    <th>NodeType</th>
                                                    <th>Cardinality</th>
                                                    <th>Testbed</th>
                                                    <th>Description</th>
                                                </tr>
                                                %for r in user_resources:
                                                <tr>
                                                    <td>{{r['resource_id']}}</td>
                                                    <td>{{r['node_type']}}</td>
                                                    <td>{{r['cardinality']}}</td>
                                                    <td>{{r['testbed']}}</td>
                                                    <td>{{r['description']}}</td>
                                                </tr>
                                                %end
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="tab_content3"
                                     aria-labelledby="profile-tab">
                                    <div id="availableImages" class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <table class="table table-striped table-bordered">
                                                <tr>
                                                    <th>Image name</th>
                                                    <th>Testbed</th>
                                                </tr>
                                                %for i in images:
                                                <tr>
                                                    <td>{{i['resource_id']}}</td>
                                                    <td>{{i['testbed']}}</td>
                                                </tr>
                                                %end
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="tab_content4"
                                     aria-labelledby="profile-tab">
                                    <div id="availableNetworks" class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-1">
                                            <table class="table table-striped table-bordered">
                                                <tr>
                                                    <th>Network name</th>
                                                    <th>Testbed</th>
                                                </tr>
                                                %for i in networks:
                                                <tr>
                                                    <td>{{i['resource_id']}}</td>
                                                    <td>{{i['testbed']}}</td>
                                                </tr>
                                                %end
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="tab_content5"
                                     aria-labelledby="profile-tab">
                                    <div id="availableFalvors" class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-1">
                                            <table class="table table-striped table-bordered">
                                                <th>Flavour name</th>
                                                <th>Testbed</th>
                                                </tr>
                                                %for i in flavours:
                                                <tr>
                                                    <td>{{i['resource_id']}}</td>
                                                    <td>{{i['testbed']}}</td>
                                                </tr>
                                                %end
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div id="myTable1div" class="x_panel">

                    <table width="100%">
                        <tr>
                            <td>
                                <div><h2><a href="/get_full_status" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="View Full JSON"><i class="fa fa-external-link"></i></a> {{experiment_id}}</h2></div>
                            </td>
                            <td>
                                <table style="float: right;">
                                    <tr>
                                        <td>
                                            <span style="float: right;">Automatic Refresh on Backgrond &nbsp; &nbsp;</span>
                                        </td>
                                        <td>
                                            <div style="float: right" class="btn-group" id="toggle_event_editing">
                                                <button onclick="StartRefresh()" type="button"
                                                        class="btn btn-orange locked_active switchbtn">ON
                                                </button>
                                                <button onclick="StopRefresh()" type="button"
                                                        class="btn btn-default unlocked_inactive switchbtn">OFF
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table class="table table-striped table-bordered" id="experimentValue" cellpadding="10px">
                        <tr>
                            <th>Resource Id</th>
                            <th>Status</th>
                            <th>Value</th>
                        </tr>
                        %for er in experiment_resources:
                        <tr>
                            <td>{{er['resource_id']}}</td>
                            <td>{{er['status']}}</td>
                            <td>{{er['value']}}</td>
                        </tr>
                        %end
                    </table>
                    <table style="text-align: center;">
                        <tr class="formUpload">
                            <td>
                                <form action="/provide_resources" method="post">
                                    <button class="btn btn-primary btn-orange" type="submit"> Deploy</button>
                                </form>
                            </td>
                            <td class="formUpload">
                                <form action="/release_resources" method="post">
                                    <button class="btn btn-danger" type="submit"> Delete</button>
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <!--Model 1-->
        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" id="modal1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel"> Reserve Resource </h4>
                    </div>
                    <div class="modal-body">
                        <form style="text-align: center;" action="/reserve_resources" method="post"
                              enctype="multipart/form-data" id="formId">
                            <br/>
                            <br/>
                            <h2>Select a file to upload</h2>
                            <td>
                                <div class="input-group col-md-5"
                                     style="text-align: center;margin-left: auto;margin-right: auto;">
                                    <label class="input-group-btn">
                                            <span class="btn-bs-file btn btn-lg btn-default">
                        Browse&hellip; <input type="file" style="display: none;" name="data" id="inputId">
                    </span>
                                    </label>
                                    <input style="height: 46px;" type="text" class="form-control" readonly>
                                </div>
                                <br/>
                                <br/>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                    </button>
                                    <button type="submit" class="btn btn-primary btn-orange">Start Upload</button>
                                </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Model 2-->
        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" id="modal2">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title"> Add Resource </h4>
                    </div>
                    <div class="modal-body">
                        <form action="/add_resource" method="post" enctype="multipart/form-data"
                              class="form-horizontal form-label-left">
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Select a
                                    file
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="input-group">
                                        <label class="input-group-btn">
                                                <span class="btn-bs-file btn btn-default">
                        Browse&hellip; <input type="file" style="display: none;" name="upload" id="inputId">
                    </span>
                                        </label>
                                        <input class="form-control" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Resource ID</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="input" class="form-control col-md-7 col-xs-12" type="text"
                                           name="id">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Node Type</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="input" class="form-control col-md-7 col-xs-12" type="text"
                                           name="node_type">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Cardinality</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="input" class="form-control col-md-7 col-xs-12" type="text"
                                           name="cardinality">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Description</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="input" class="form-control col-md-7 col-xs-12" type="text"
                                           name="description">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Testbed</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="input" class="form-control col-md-7 col-xs-12" type="text"
                                           name="testbed">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary btn-orange">Add Resource</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="static/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="static/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="static/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->.classLis
<script src="static/vendors/nprogress/nprogress.js"></script>
<!-- iCheck -->
<script src="static/vendors/iCheck/icheck.min.js"></script>
<!-- Custom Theme Scripts -->
<script src="static/custom.js"></script>
</body>
</html>
