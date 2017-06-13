<!DOCTYPE HTML>
<!-- PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">-->
<html>

<head>
    <meta content="text/html; charset=utf-8" http-equiv="content-type">
    <link rel="shortcut icon" type="image/png" href="static/favicon.ico" />
    <script type="text/javascript" src="https://caldwell.github.io/renderjson/renderjson.js"></script>
    <title>SoftFIRE middleware</title>
    <link rel="stylesheet" type="text/css" href="static/normalize.css" />
    <link rel="stylesheet" type="text/css" href="static/demo.css" />
    <link rel="stylesheet" type="text/css" href="static/component.css" />
    <script src="static/modernizr.custom.js"></script>
</head>

<body>
    <font size="-1">
        <!-- The Modal -->
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <h5>Add resource</h5>
                <p>
                    <form action="/add_resource" method="post" enctype="multipart/form-data">
                        <table class="formUpload" cellpadding="10px">
                            <colgroup>
                                <col span="1" style="width: 20%;">
                                <col span="1" style="width: 30%;">
                            </colgroup>
                            <tr>
                                <td>Select a file: </td>
                                <td><input type="file" name="upload" id="inputId" style="width: 250px"></td>
                            </tr>
                            <tr>
                                <td>Resource ID </td>
                                <td><input type="input" name="id" style="width: 250px" /></td>
                            </tr>
                            <tr>
                                <td>Node type</td>
                                <td><input type="input" name="node_type" style="width: 250px" /></td>
                            </tr>
                            <tr>
                                <td>Cardinality </td>
                                <td><input type="input" name="cardinality" style="width: 250px" /> </td>
                            </tr>
                            <tr>
                                <td>Description </td>
                                <td> <input type="input" name="description" style="width: 250px" /> </td>
                            </tr>
                            <tr>
                                <td> Testbed </td>
                                <td><input type="input" name="testbed" style="width: 250px" /></td>
                            </tr>

                        </table>
                        <br />
                        <button type="submit" style="float: left;" class="myButton"> Add resource </button>
                    </form>
                </p>
            </div>

        </div>
        <div id="menu" style="text-align: left">
            <img src="static/softfire.jpg" alt="SoftFIRE" align="left" class="heightSet" width="100%">
            <h1>Experiment</h1>
            <h5>User {{current_user.username}}</h5>
            <nav class="cl-effect-4" style="color: black; text-align: center">
                <ul>
                    <li>
                        <a href="/calendar"><span data-hover="Calendar">Calendar</span></a>
                    </li>
                    <li>
                        <a href="http://docs.softfire.eu"><span data-hover="Documentation">Documentation</span></a>
                    </li>
                    <li>
                        <a href="#" id="myBtn"><span>Add resource</span></a>
                    </li>
                    <li>
                        <a href="/logout"><span>Logout</span></a>
                    </li>

                </ul>
            </nav>
        </div>
        <div id="content">
            <table>
                <tr>
                    <td>
                        <table class="main">
                            <colgroup>
                                <col span="1" style="width: 70%;">
                                <col span="1" style="width: 30%;">
                            </colgroup>
                            <tr>
                                <th id="main">
                                    <h2>Available Resources</h2>
                                </th>
                                <th id="main">
                                    <h2>Available images</h2>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <div id='commands'>
                                        <form action="list_resources" method="get">
                                            <div style="max-height: 400px;overflow:auto;overflow-y:scroll;border: 2px Solid darkgray;padding: 4px;">
                                                <table class="listResTable" cellpadding="10px">
                                                    <colgroup>
                                                        <col span="1" style="width: 8%;">
                                                        <col span="1" style="width: 7%;">
                                                        <col span="1" style="width: 5%;">
                                                        <col span="1" style="width: 5%;">
                                                        <col span="1" style="width: 750%;">
                                                    </colgroup>
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
                                        </form>
                                    </div>
                                </td>
                                <td>
                                    <div style="max-height: 320px;overflow:auto;overflow-y:scroll;border: 2px Solid darkgray;padding: 4px;">
                                        <table class="listResTable" cellpadding="10px">
                                            <colgroup>
                                                <col span="1" style="width: 70%;">
                                                <col span="1" style="width: 30%;">
                                            </colgroup>
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
                                        <br />
                                        <table class="listResTable" cellpadding="10px">
                                            <colgroup>
                                                <col span="1" style="width: 70%;">
                                                <col span="1" style="width: 30%;">
                                            </colgroup>
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
                                        <br />
                                        <table class="listResTable" cellpadding="10px">
                                            <colgroup>
                                                <col span="1" style="width: 70%;">
                                                <col span="1" style="width: 30%;">
                                            </colgroup>
                                            <tr>
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
                                    <div id="whatever" text-align="left"></div>
                                    <button id="buttonRefresh" onClick='
                              document.getElementById("whatever").innerHTML="Loading...";
                              document.getElementById("buttonRefresh").disabled = true;
                              $.ajax({
                                  url: "/refresh_images",
                                  type: "GET",
                                  data: "{}",
                                  dataType: "json",
                                  contentType: "application/json",
                                  success: function(result) {
                                      console.log(result);
                                      location.reload();
                                   }
                              });
                            ' class="myButton" style="width: 75%; left: 10%;position: relative; margin: 0px auto;">Refresh</button>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td style="padding: 10px; padding-bottom: 50px">
                        <table class="formUpload" cellpadding="10px">
                            <colgroup>
                                <col span="1" style="width: 30%;">
                                <col span="1" style="width: 50%;">
                                <col span="1" style="width: 10%;">
                                <col span="1" style="width: 10%;">
                            </colgroup>
                            <tr class="formUpload">
                                <td class="formUpload">
                                    <h2>Your experiment {{experiment_id}}</h2>
                                </td>
                                <td class="formUpload">

                                    <table class="formUpload" cellpadding="10px">
                                        <tr class="formUpload">
                                            <td class="formUpload">
                                                <div id="reserveResources" class="reserveResources"> Reserve resources:</div>
                                            </td>
                                            <td class="formUpload">
                                                <form action="/reserve_resources" method="post" enctype="multipart/form-data" id="formId">
                                                    Select a file: <input type="file" name="data" id="inputId" style="width: 150px">
                                                    <button type="submit" class="myButton">Start upload</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </table>

                                </td>
                                <td class="formUpload">
                                    <form action="/provide_resources" method="post">
                                        <button type="submit" style="float: left;" class="myButton"> Deploy </button>
                                    </form>
                                </td>
                                <td class="formUpload">
                                    <form action="/release_resources" method="post">
                                        <button type="submit" style="float: left;" class="myButton"> Delete </button>
                                    </form>
                                </td>
                            </tr>
                        </table>

                        <table class="experimentTable" id="experimentValue" cellpadding="10px">
                            <colgroup>
                                <col span="1" style="width: 20%;">
                                <col span="1" style="width: 10%;">
                                <col span="1" style="width: 70%;">
                            </colgroup>
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
                    </td>
                </tr>
            </table>
        </div>
        <div class="clear"></div>

        <!-- <div id='status'>Ready...</div> -->
        <!-- <div id="urls">
        <a href="/calendar">Calendar</a> - <a href="http://docs.softfire.eu">Documentation</a> - User {{current_user.username}}: <a href="/logout">logout</a>
    </div> -->

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.js"></script>
        <script>
            // Prevent form submission, send POST asynchronously and parse returned JSON
            // $("div#status").delay(2800).fadeOut(700);
            var updateTimer;
            var count = 0;
            // Get the modal
            var modal = document.getElementById('myModal');
            // Get the button that opens the modal
            var btn = document.getElementById("myBtn");
            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];
            // When the user clicks on the button, open the modal
            btn.onclick = function() {
                modal.style.display = "block";
            }
            // When the user clicks on <span> (x), close the modal
            span.onclick = function() {
                modal.style.display = "none";
            }
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }

            $('form').submit(function() {
                $("div#status").fadeIn(100);
                $("div#status").text('Loading...');
                z = $(this);
                console.log(z)
                $.post($(this).attr('action'), new FormData(z), function(j) {
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

            $(document).ready(function() {
              ajaxd();
              updateTimer = setInterval("ajaxd()", 5000);
            });

            function ajaxd() {
              if (count++ == 25){
                clearInterval(updateTimer);
                return;
              }
              $.ajax({
               type: "GET",
               url: "get_status",
               contentType: 'application/json',
               dataType: "json",
               success: function(value){
                //  console.log(value);

                 $('#experimentValue tr').remove();
                 $('#experimentValue').append('<tr><th>Resource Id</th><th>Status</th><th>Value</th></tr>');

                 for (var i = 0; i < value.length; i++) {
                  // j = JSON.stringify(JSON.parse(value[i]['value']), null, 2)
                  try {
                    j = renderjson.set_show_to_level(1).set_icons('+', '-')(JSON.parse(value[i]['value']))

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
        </script>

        <style>
            div#reserveResources {
              /*font-size: 20px;
              border-radius: 5px;
              border-left: 0px;
              border-top: 0px;
              border-bottom: 2px Solid grey;
              border-right: 2px Solid grey;
              background-color: #FFA93F;
              padding: 5px;*/
              /*-moz-box-shadow:inset 0px 1px 0px 0px #fff6af;*/
            	/*-webkit-box-shadow:inset 0px 1px 0px 0px #fff6af;*/
            	/*box-shadow:inset 0px 1px 0px 0px #fff6af;*/
            	/*background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffd966), color-stop(1, #ffab23));
            	background:-moz-linear-gradient(top, #ffd966 5%, #ffab23 100%);
            	background:-webkit-linear-gradient(top, #ffd966 5%, #ffab23 100%);
            	background:-o-linear-gradient(top, #ffd966 5%, #ffab23 100%);
            	background:-ms-linear-gradient(top, #ffd966 5%, #ffab23 100%);
            	background:linear-gradient(to bottom, #ffd966 5%, #ffab23 100%);*/
            	/*filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffd966', endColorstr='#ffab23',GradientType=0);*/
            	/*background-color:darkorange;*/
            	-moz-border-radius:6px;
            	-webkit-border-radius:6px;
            	border-radius:6px;

            	display:inline-block;
            	color:#333333;
            	font-family:Arial;
            	font-size:15px;
            	font-weight:bold;
            	padding:9px 27px;
            	text-decoration:none;
            }

            .myButton {
            	-moz-box-shadow:inset 0px 1px 0px 0px #fff6af;
            	-webkit-box-shadow:inset 0px 1px 0px 0px #fff6af;
            	box-shadow:inset 0px 1px 0px 0px #fff6af;
            	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffd966), color-stop(1, #ffab23));
            	background:-moz-linear-gradient(top, #ffd966 5%, #ffab23 100%);
            	background:-webkit-linear-gradient(top, #ffd966 5%, #ffab23 100%);
            	background:-o-linear-gradient(top, #ffd966 5%, #ffab23 100%);
            	background:-ms-linear-gradient(top, #ffd966 5%, #ffab23 100%);
            	background:linear-gradient(to bottom, #ffd966 5%, #ffab23 100%);
            	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffd966', endColorstr='#ffab23',GradientType=0);
            	background-color:#ffd966;
            	-moz-border-radius:6px;
            	-webkit-border-radius:6px;
            	border-radius:6px;
            	border:1px solid #ffaa22;
            	display:inline-block;
            	cursor:pointer;
            	color:#333333;
            	font-family:Arial;
            	font-size:15px;
            	font-weight:bold;
            	padding:9px 27px;
            	text-decoration:none;
            	text-shadow:0px 1px 0px #ffee66;
            }

            .myButton:hover {
            	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffab23), color-stop(1, #ffd966));
            	background:-moz-linear-gradient(top, #ffab23 5%, #ffd966 100%);
            	background:-webkit-linear-gradient(top, #ffab23 5%, #ffd966 100%);
            	background:-o-linear-gradient(top, #ffab23 5%, #ffd966 100%);
            	background:-ms-linear-gradient(top, #ffab23 5%, #ffd966 100%);
            	background:linear-gradient(to bottom, #ffab23 5%, #ffd966 100%);
            	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffab23', endColorstr='#ffd966',GradientType=0);
            	background-color:#ffab23;
            }

            .myButton:active {
            	position:relative;
            	top:1px;
            }

            html {
              padding:0px;
              margin:0px;
            }
            body {
              font-size: 12px;
              font-family: Verdana, Arial, SunSans-Regular, Sans-Serif;
              color:#564b47;
              padding:0px 20px;
              margin:0px;
            }
            #content {
              margin-top: 30px;
              margin-left: 300px;
              background-color:#fff;
              overflow: auto;
            }

            #menu {
              position: absolute;
              width: 300px;
              left: 20px;
              padding:0px;
              margin:0px
            }

            ul {
              list-style-type: none;
              margin: 0;
              padding: 0;
            }

            li {
              font: 200 20px/1.5 Helvetica, Verdana, sans-serif;
              text-align: left;
              border-bottom: 1px solid #ccc;
              padding-top: 20px
            }

            /*li:last-child {
              border: none;
            }*/

            /*li a {
              text-decoration: none;
              color: #000;
              display: block;
              width: 200px;

              -webkit-transition: font-size 0.3s ease, background-color 0.3s ease;
              -moz-transition: font-size 0.3s ease, background-color 0.3s ease;
              -o-transition: font-size 0.3s ease, background-color 0.3s ease;
              -ms-transition: font-size 0.3s ease, background-color 0.3s ease;
              transition: font-size 0.3s ease, background-color 0.3s ease;
            }*/

            /*li a:hover {
              font-size: 30px;
              background: #f6f6f6;
            }*/

            input
            {
                border-radius: .2em;
                border: 1px solid #cccccc;

                -webkit-transition: border linear .2s, box-shadow linear .2s;
                -moz-transition: border linear .2s, box-shadow linear .2s;
                -o-transition: border linear .2s, box-shadow linear .2s;
                transition: border linear .2s, box-shadow linear .2s;
            }

            input:focus
            {
                border-color: darkorange;
                outline: 0;
                outline: thin dotted \9;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px     rgba(82,168,236,.6);
                -moz-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);
            }



            h1 {
                color: #111;
                font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
                font-size: 25pt;
                font-weight: bold;
                letter-spacing: -1px;
                line-height: 1;
                text-align: left;
                    text-transform: uppercase;
            }
            h5 {
                color: #111;
                font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
                font-size: 15pt;
                font-weight: bold;
                letter-spacing: -1px;
                line-height: 1;
                text-align: left;
                text-transform: uppercase;
            }

            a {
              margin-right: 10px;
              margin-left: 10px;
            }

            img {
                display: block;
                margin: 0 auto;
                horizontal-align: middle;
            }

            div#commands {
                width: 100%;
                float: left;
                font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
            }

            div#users {
                width: 45%;
                float: right
                font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
            }

            div#main {
                color: #777;
                margin: auto;
                font-size: small;
                margin: auto;
                width: 20em;
                text-align: left;
                vertical-align: top;
                font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
            }

            input:hover {
                background: #fefefe
            }

            label {
                font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
                width: 8em;
                float: left;
                text-align: right;
                margin-right: 0.5em;
                display: block
            }

            div#status {
                border: 1px solid #999;
                padding: .5em;
                margin: 2em;
                width: 15em;
                left: 40%;
                position: fixed;
                -moz-border-radius: 10px;
                border-radius: 10px;
                font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
            }

            div#urls {
                position: absolute;
                top: 0;
                right: 1em;
                font-size: large;
                box-shadow: inset 0 1px 1px darkgray, 0 0 8px darkgray;
                padding: 3px 3px 3px 3px;
                font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
            }

            table {
                width: 90%;
                border: 1px solid #ddd;
                margin: 0px auto;
                font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
            }

            td,
            th {
                border: 1px solid #ddd;
                font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
            }

            td#formUpload,
            th#formUpload {
                border: 0;
            }

            th#main,
            td#main {
                padding: 8px;
            }

            th#main {
                background-color: darkorange;
                color: black;
            }

            tr#main:nth-child(even) {
                background-color: #f2f2f2
            }


            .clear {
                clear: both;
            }


            .main {
                border-collapse: collapse;
                width: 100%;
                text-align: left;
                background-color: #f2f2f2;
                border: 1px solid #ddd;
            }

            .experimentTable {
                border-collapse: collapse;
                width: 100%;
                border: 3px solid #ddd;

            }

            .inputFile {
              border: 1px solid #111;
            }

            .formUpload {
              border-collapse: collapse;
              margin: 0px auto;
              border: 0px
            }

            .buttonRefresh {
              text-align: center;
              font-size: 10pt;
              margin: 0px auto;
              left: 10%;
              width: 85%;
              position: relative;
              /*padding-left: 130px;
              padding-right: 130px*/
            }

            .listResTable {
                border-collapse: collapse;
                width: 98%;
                margin: 0px auto;
                border: 1px solid #ddd;
                text-align: justify;
            }

            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content/Box */
            .modal-content {
                background-color: #fefefe;
                margin: 15% auto; /* 15% from the top and centered */
                padding: 50px;
                border: 1px solid #888;
                width: 50%; /* Could be more or less, depending on screen size */
            }

            /* The Close Button */
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
    </font>

</body>

</html>
