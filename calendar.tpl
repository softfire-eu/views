
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link rel="shortcut icon" type="image/png" href="static/favicon.ico"/>
<link href='static/fullcalendar.min.css' rel='stylesheet' />
<link href='static/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='static/moment.min.js'></script>
<script src='static/jquery.min.js'></script>
<script src='static/fullcalendar.min.js'></script>
<link><link rel="stylesheet" type="text/css" href="static/jquery-ui.theme.min.css"></link>
<link rel="stylesheet" type="text/css" href="static/normalize.css" />
<link rel="stylesheet" type="text/css" href="static/demo.css" />
<link rel="stylesheet" type="text/css" href="static/component.css" />
<script src="static/modernizr.custom.js"></script>
<title>SoftFIRE Calendar</title>
<script>

	var stringToColour = function(str) {
		var hash = 0;
		for (var i = 0; i < str.length; i++) {
				hash = str.charCodeAt(i) + ((hash << 5) - hash);
		}
		var colour = '#';
		for (var i = 0; i < 3; i++) {
				var value = (hash >> (i * 8)) & 0xFF;
				colour += ('00' + value.toString(16)).substr(-2);
		}
		return colour;
	}

	$(document).ready(function() {

		events = []


		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
      theme: false,
			defaultDate: '2017-08-1',
			navLinks: false, // can click day/week names to navigate views
			editable: false,
			eventLimit: true, // allow "more" link when too many events
			events: [
				% for u in calendar:
				{
					title: "{{u['resource_id']}}",
					start: "{{u['start']}}",
					end: "{{u['end']}}",
					color: stringToColour("{{u['resource_id']}}")
				},
        % end
			],

		});

	});

</script>
<style>
	a {
		margin-right: 10px;
		margin-left: 10px;
	}

	html {
		padding:0px;
		margin:0px;
	}
	body {
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
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


	#calendar {
		width: 75%;
		margin: 0 auto;
		font-size: 14px;
	}
	.formUpload {
		border-collapse: collapse;
		margin: 0px auto;
		border: 0px
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
	img {
			display: block;
			margin: 0 auto;
			horizontal-align: middle;
			width: 100%
	}
	table {
			width: 90%;
			border: 1px solid #ddd;
			margin: 0px auto;
			font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
	}
	/*div#urls {
	    position: absolute;
	    top: 0;
	    right: 1em;

	    font-size: small;
	    /*box-shadow: inset 0 1px 1px darkgray, 0 0 8px darkgray;*/
	    padding: 3px 3px 3px 3px;
	    font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
	}*/

</style>
</head>
<body>

	<div id="menu" style="text-align: left">
			<img src="static/softfire.jpg" alt="SoftFIRE" align="left" class="heightSet" width="100%">
			<h1>Calendar</h1>
			<h5>User {{current_user.username}}</h5>
			<nav class="cl-effect-4" style="color: black; text-align: center">
					<ul>
							<li>
									<a href="/experimenter"><span data-hover="Experiment">Experiment</span></a>
							</li>
							<li>
									<a href="http://docs.softfire.eu"><span data-hover="Documentation">Documentation</span></a>
							</li>
							<li>
									<a href="/logout"><span>Logout</span></a>
							</li>
					</ul>
			</nav>
	</div>
	<div id="content">
		<div id='calendar'></div>
	</div>

</body>
</html>
