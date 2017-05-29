
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
<script>

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
      eventColor: 'darkorange'
		});

	});

</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		width: 65%;
		margin: 0 auto;
	}

</style>
</head>
<body>
	<div id='calendar'></div>
  <div id="urls">
  <a href="/experimenter">Experiment</a> - <a href="http://docs.softfire.eu">Documentation</a> - User {{current_user.username}}: <a href="/logout">logout</a>
  </div>
<style>
div#urls {
    position: absolute;
    top: 0;
    right: 1em;
    font-size: large;
    box-shadow: inset 0 1px 1px darkgray, 0 0 8px darkgray;
    padding: 3px 3px 3px 3px;
    font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
}
</style>
</body>
</html>
