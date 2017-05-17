<!-- this script got from www.htmlbestcodes.com-Coded by: Krishna Eydat -->
<html>

<head>
<style type="text/css">
    /* Styling for the title (Month and Year) of the calendar */
    h1 {
        color: #111;
        font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
        font-size: 45pt;
        font-weight: bold;
        letter-spacing: -1px;
        line-height: 1;
        text-align: center;
    }
    div.title {
        font: x-large Verdana, Arial, Helvetica, sans-serif;
        text-align: center;
        height: 40px;
        background-color: white;
        color: black;
    }
    /* Styling for the footer */

    div.footer {
        font: small Verdana, Arial, Helvetica, sans-serif;
        text-align: center;
    }
    /* Styling for the overall table */

    table#innerTable {
      width: 100%;
    }

    table {
        font: 100% Verdana, Arial, Helvetica, sans-serif;
        table-layout: fixed;
        border-collapse: collapse;
        width: 90%;
        height: 10px;
        margin: 0px auto;
    }

    table, th, td {
      border: 1px solid black;
      border-collapse: collapse;
      height: 10px;
    }

    /* Styling for the column headers (days of the week) */

    th {
        padding: 0 0.5em;
        text-align: center;
        background-color: gray;
        color: white;
    }
    /* Styling for the individual cells (days) */

    td {
        font-size: small;
        padding: 0.25em 0.25em;
        width: 14%;
        height: 120px;
        text-align: left;
        vertical-align: top;
        border-collapse: collapse;
    }
    /* Styling for the date numbers */

    .date {
        font-size: x-large;
        padding: 0.25em 0.25em;
        text-align: left;
        vertical-align: top;
    }
    /* Class for individual days (coming in future release) */

    .sun {
        color: red;
    }
    /* Hide the month element (coming in future release) */

    th.month {
        visibility: hidden;
        display: none;
    }


    td#formUpload,
    th#formUpload {
        border: 0;
    }

    .formUpload {
      border-collapse: collapse;
      margin: 0px auto;
      border: 0px
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
</style>
</head>

<body>
    <center>
      <h1>
        Wave 2 Calendar
      </h1>
        <script language="javascript" type="text/javascript">
            var day_of_week = new Array('Sun','Mon','Tue','Wed','Thu','Fri','Sat');
            var month_of_year = new Array('January','February','March','April','May','June','July','August','September','October','November','December');

            //  DECLARE AND INITIALIZE VARIABLES
            var Calendar = new Date();

            var year = Calendar.getFullYear();     // Returns year
            var month = 6;    // Returns month (0-11)
            var today = Calendar.getDate();    // Returns day (1-31)
            var weekday = Calendar.getDay();    // Returns day (1-31)

            var DAYS_OF_WEEK = 7;    // "constant" for number of days in a week
            var DAYS_OF_MONTH = 31;    // "constant" for number of days in a month
            var cal;    // Used for printing

            Calendar.setDate(1);    // Start the calendar day at '1'
            Calendar.setMonth(6);    // Start the calendar month July


            /* VARIABLES FOR FORMATTING
            NOTE: You can format the 'BORDER', 'BGCOLOR', 'CELLPADDING', 'BORDERCOLOR'
                  tags to customize your caledanr's look. */

            var TR_start = '<TR>';
            var TR_end = '</TR>';
            var highlight_start = '<td width="30"><table cellspacing=0 border=1 bgcolor=dedeff bordercolor=cccccc><tr><td width=20><b><center>';
            var highlight_end   = '</center></td></tr></table></b>';
            var TD_start = '<td width="30"><center>';
            var TD_start_day = '<td style="height: 30px; vertical-align: middle; font-size: medium; font-weight: bold;" bgcolor=dedeff width="30"><center>';
            var TD_end = '</center></td>';

            /* BEGIN CODE FOR CALENDAR
            NOTE: You can format the 'BORDER', 'BGCOLOR', 'CELLPADDING', 'BORDERCOLOR'
            tags to customize your calendar's look.*/

            cal =  '<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=0 BORDERCOLOR=BBBBBB><TR><TD>';
            cal += '<TABLE class="innerTable" BORDER=0 CELLSPACING=0 CELLPADDING=2 BORDERCOLOR=BBBBBB style="width: 100%;">' + TR_start;
            cal += '<TD style="height: 30px; vertical-align: middle; font-size: large; font-weight: bold;" COLSPAN="' + DAYS_OF_WEEK + '" BGCOLOR="#e68a00"><CENTER><B>';
            cal += month_of_year[month]  + '   ' + year + '</B>' + TD_end + TR_end;
            cal += TR_start;

            //   DO NOT EDIT BELOW THIS POINT  //

            // LOOPS FOR EACH DAY OF WEEK
            for(index=0; index < DAYS_OF_WEEK; index++)
            {

            // BOLD TODAY'S DAY OF WEEK
              // if(weekday == index)
              //   cal += TD_start + '<B>' + day_of_week[index] + '</B>' + TD_end;
              //
              // // PRINTS DAY
              // else
                cal += TD_start_day + day_of_week[index] + TD_end;
            }

            cal += TD_end + TR_end;
            cal += TR_start;

            // FILL IN BLANK GAPS UNTIL TODAY'S DAY
            for(index=0; index < Calendar.getDay(); index++)
              cal += TD_start + '  ' + TD_end;

            // LOOPS FOR EACH DAY IN CALENDAR
            % for index in range(0,30):
            // for(index=0; index < DAYS_OF_MONTH; index++)
            // {
              if( Calendar.getDate() > {{index}} )
              {
                // RETURNS THE NEXT DAY TO PRINT
                week_day =Calendar.getDay();

                // START NEW ROW FOR FIRST DAY OF WEEK
                if(week_day == 0)
                  cal += TR_start;

                if(week_day != DAYS_OF_WEEK)
                {

                  // SET VARIABLE INSIDE LOOP FOR INCREMENTING PURPOSES
                  var day  = Calendar.getDate();
                  var cur_month  = Calendar.getMonth();
                  console.log(cur_month)
                  // console.log(used_res);
                  console.log("{{july}}");
                  // HIGHLIGHT TODAY'S DATE
                  // if( today==Calendar.getDate() )
                  //   cal += highlight_start + day + highlight_end + TD_end;

                  // PRINTS DAY
                  // else
                  cal += TD_start + day;
                  console.log("{{index}}")
                  console.log("{{july}}")
                  cal += "<br /> {{july[index]}}";
                  cal += TD_end;
                }

                // END ROW FOR LAST DAY OF WEEK
                if(week_day == DAYS_OF_WEEK)
                cal += TR_end;
              }

              // INCREMENTS UNTIL END OF THE MONTH
              Calendar.setDate(Calendar.getDate()+1);

            // }// end for loop
            % end

            cal += '</TD></TR></TABLE></TABLE><br /><br />';

            //  PRINT CALENDAR
            document.write(cal);

            //THIRD

            var Calendar = new Date();

            var year = Calendar.getFullYear();     // Returns year
            var month = 7;    // Returns month (0-11)
            var today = Calendar.getDate();    // Returns day (1-31)
            var weekday = Calendar.getDay();    // Returns day (1-31)

            var DAYS_OF_WEEK = 7;    // "constant" for number of days in a week
            var DAYS_OF_MONTH = 31;    // "constant" for number of days in a month
            var cal;    // Used for printing

            Calendar.setDate(1);    // Start the calendar day at '1'
            Calendar.setMonth(month);    // Start the calendar month august

            cal =  '<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=0 BORDERCOLOR=BBBBBB><TR><TD>';
            cal += '<TABLE class="innerTable" BORDER=0 CELLSPACING=0 CELLPADDING=2 BORDERCOLOR=BBBBBB style="width: 100%;">' + TR_start;
            cal += '<TD style="height: 30px; vertical-align: middle; font-size: large; font-weight: bold;" COLSPAN="' + DAYS_OF_WEEK + '" BGCOLOR="#e68a00"><CENTER><B>';
            cal += month_of_year[month]  + '   ' + year + '</B>' + TD_end + TR_end;
            cal += TR_start;

            //   DO NOT EDIT BELOW THIS POINT  //

            // LOOPS FOR EACH DAY OF WEEK
            for(index=0; index < DAYS_OF_WEEK; index++)
            {

            // BOLD TODAY'S DAY OF WEEK
              // if(weekday == index)
              //   cal += TD_start + '<B>' + day_of_week[index] + '</B>' + TD_end;
              //
              // // PRINTS DAY
              // else
                cal += TD_start_day + day_of_week[index] + TD_end;
            }

            cal += TD_end + TR_end;
            cal += TR_start;

            // FILL IN BLANK GAPS UNTIL TODAY'S DAY
            for(index=0; index < Calendar.getDay(); index++)
              cal += TD_start + '  ' + TD_end;

            // LOOPS FOR EACH DAY IN CALENDAR
            % for index in range(0,30):
            // for(index=0; index < DAYS_OF_MONTH; index++)
            // {
              if( Calendar.getDate() > {{index}} )
              {
                // RETURNS THE NEXT DAY TO PRINT
                week_day =Calendar.getDay();

                // START NEW ROW FOR FIRST DAY OF WEEK
                if(week_day == 0)
                  cal += TR_start;

                if(week_day != DAYS_OF_WEEK)
                {

                  // SET VARIABLE INSIDE LOOP FOR INCREMENTING PURPOSES
                  var day  = Calendar.getDate();
                  var cur_month  = Calendar.getMonth();
                  console.log(cur_month)
                  // console.log(used_res);
                  console.log("{{august}}");
                  // HIGHLIGHT TODAY'S DATE
                  // if( today==Calendar.getDate() )
                  //   cal += highlight_start + day + highlight_end + TD_end;

                  // PRINTS DAY
                  // else
                  cal += TD_start + day;
                  console.log("{{index}}")
                  console.log("{{august}}")
                  cal += "<br /> {{august[index]}}";
                  cal += TD_end;
                }

                // END ROW FOR LAST DAY OF WEEK
                if(week_day == DAYS_OF_WEEK)
                cal += TR_end;
              }

              // INCREMENTS UNTIL END OF THE MONTH
              Calendar.setDate(Calendar.getDate()+1);

            // }// end for loop
            % end

            cal += '</TD></TR></TABLE></TABLE><br /><br />';

            //  PRINT CALENDAR
            document.write(cal);

            //SECOND

            var Calendar = new Date();

            var year = Calendar.getFullYear();     // Returns year
            var month = 8;    // Returns month (0-11)
            var today = Calendar.getDate();    // Returns day (1-31)
            var weekday = Calendar.getDay();    // Returns day (1-31)

            var DAYS_OF_WEEK = 7;    // "constant" for number of days in a week
            var DAYS_OF_MONTH = 31;    // "constant" for number of days in a month
            var cal;    // Used for printing

            Calendar.setDate(1);    // Start the calendar day at '1'
            Calendar.setMonth(month);    // Start the calendar month sept

            cal =  '<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=0 BORDERCOLOR=BBBBBB><TR><TD>';
            cal += '<TABLE class="innerTable" BORDER=0 CELLSPACING=0 CELLPADDING=2 BORDERCOLOR=BBBBBB style="width: 100%;">' + TR_start;
            cal += '<TD style="height: 30px; vertical-align: middle; font-size: large; font-weight: bold;" COLSPAN="' + DAYS_OF_WEEK + '" BGCOLOR="#e68a00"><CENTER><B>';
            cal += month_of_year[month]  + '   ' + year + '</B>' + TD_end + TR_end;
            cal += TR_start;

            //   DO NOT EDIT BELOW THIS POINT  //

            // LOOPS FOR EACH DAY OF WEEK
            for(index=0; index < DAYS_OF_WEEK; index++)
            {

            // BOLD TODAY'S DAY OF WEEK
              // if(weekday == index)
              //   cal += TD_start + '<B>' + day_of_week[index] + '</B>' + TD_end;
              //
              // // PRINTS DAY
              // else
                cal += TD_start_day + day_of_week[index] + TD_end;
            }

            cal += TD_end + TR_end;
            cal += TR_start;

            // FILL IN BLANK GAPS UNTIL TODAY'S DAY
            for(index=0; index < Calendar.getDay(); index++)
              cal += TD_start + '  ' + TD_end;

            // LOOPS FOR EACH DAY IN CALENDAR
            % for index in range(0,30):
            // for(index=0; index < DAYS_OF_MONTH; index++)
            // {
              if( Calendar.getDate() > {{index}} )
              {
                // RETURNS THE NEXT DAY TO PRINT
                week_day =Calendar.getDay();

                // START NEW ROW FOR FIRST DAY OF WEEK
                if(week_day == 0)
                  cal += TR_start;

                if(week_day != DAYS_OF_WEEK)
                {

                  // SET VARIABLE INSIDE LOOP FOR INCREMENTING PURPOSES
                  var day  = Calendar.getDate();
                  var cur_month  = Calendar.getMonth();
                  console.log(cur_month)
                  // console.log(used_res);
                  console.log("{{september}}");
                  // HIGHLIGHT TODAY'S DATE
                  // if( today==Calendar.getDate() )
                  //   cal += highlight_start + day + highlight_end + TD_end;

                  // PRINTS DAY
                  // else
                  cal += TD_start + day;
                  console.log("{{index}}")
                  console.log("{{september}}")
                  cal += "<br /> {{september[index]}}";
                  cal += TD_end;
                }

                // END ROW FOR LAST DAY OF WEEK
                if(week_day == DAYS_OF_WEEK)
                cal += TR_end;
              }

              // INCREMENTS UNTIL END OF THE MONTH
              Calendar.setDate(Calendar.getDate()+1);

            // }// end for loop
            % end

            cal += '</TD></TR></TABLE></TABLE><br /><br />';

            //  PRINT CALENDAR
            document.write(cal);

            //  End -->
        </script>
    </center>
    <br/>
    <div id="urls">
        <a href="/experimenter">Experimenter</a> - <a href="http://docs.softfire.eu">Documentation</a> - User {{current_user.username}}: <a href="/logout">logout</a>
    </div>
    <div style="clear:both"></div>
</body>

</html>
