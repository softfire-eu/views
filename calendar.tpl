
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
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
					end: "{{u['end']}}"
				},
        % end
			],
      eventColor: stringToColour("{{u['resource_id']}}")
		});

	});

</script>
<style>
a {
	margin-right: 10px;
	margin-left: 10px;
}
	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		width: 100%;
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
			font-size: 45pt;
			font-weight: bold;
			letter-spacing: -1px;
			line-height: 1;
			text-align: center;
	}
	h5 {
			color: #111;
			font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
			font-size: 25pt;
			font-weight: bold;
			letter-spacing: -1px;
			line-height: 1;
			text-align: center;
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

	<table class="formUpload" cellpadding="10px">
		<colgroup>
			 <col span="1" style="width: 30%;">
			 <col span="1" style="width: 70%;">
		</colgroup>
	<tr class="formUpload">
		<td class="formUpload">
			<h1>Calendar Page</h1>
			<h5>User: {{current_user.username}}</h5>
			<nav class="cl-effect-4" style="color: black; text-align: center">
				<p>
					<a href="/calendar"><span data-hover="Calendar">Calendar</span></a>
					<a href="http://docs.softfire.eu"><span data-hover="Documentation">Documentation</span></a>
				</p>
				<p style="position: relative; left: -5%">
					<a href="/logout"><span>Logout</span></a>
				</p>
			</nav>
			<img src="static/softfire.jpg" alt="SoftFIRE" align="middle" class="heightSet" width="100%">
		</td>
		<td class="formUpload">
			<div id='calendar'></div>
		</td>
	</tr>
	</table>
</body>
</html>
