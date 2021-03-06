<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta content="text/html; charset=utf-8" http-equiv="content-type">
    <link rel="shortcut icon" type="image/png" href="static/favicon.ico" />
</head>

<body>
    <div id='main'>
        <h1>Experimenter Manger - Administration page</h1>
        <p>Welcome {{current_user.username}}, your role is: {{current_user.role}}, access time: {{current_user.session_accessed_time}}</p>
        <div id='commands'>
            <p>Create new user:</p>
            <form action="create_user" method="post" class="ajax">
                <p><label>Username</label> <input type="text" name="username" /></p>
                <p><label>Role</label> <input type="text" name="role" /></p>
                <p><label>Password</label> <input type="password" name="password" /></p>
                <button type="submit"> OK </button>
                <button type="button" class="close"> Cancel </button>
            </form>
            <br />
            <p>Delete user:</p>
            <form action="delete_user" method="post" class="ajax">
                <p><label>Username</label> <input type="text" name="username" /></p>
                <button type="submit"> OK </button>
                <button type="button" class="close"> Cancel </button>
            </form>
            <br />
            <p>Create new role:</p>
            <form action="create_role" method="post" class="ajax">
                <p><label>Role</label> <input type="text" name="role" /></p>
                <p><label>Level</label> <input type="text" name="level" /></p>
                <button type="submit"> OK </button>
                <button type="button" class="close"> Cancel </button>
            </form>
            <br />
            <p>Delete role:</p>
            <form action="delete_role" method="post" class="ajax">
                <p><label>Role</label> <input type="text" name="role" /></p>
                <button type="submit"> OK </button>
                <button type="button" class="close"> Cancel </button>
            </form>
            <br />
            <p>Maintenance</p>
            <form action="enable_maintenance" method="post" class="ajax">
                <button type="submit"> Enable </button>
            </form>
            <form action="disable_maintenance" method="post" class="ajax">
                <button type="submit"> Disable </button>
            </form>
        </div>
        <div id="users">
            <table>
                <tr>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Email</th>
                    <th>Description</th>
                </tr>
                %for u in users:
                <tr>
                    <td>{{u[0]}}</td>
                    <td>{{u[1]}}</td>
                    <td>{{u[2]}}</td>
                    <td>{{u[2]}}</td>
                </tr>
                %end
            </table>
            <br/>
            <br/>
            <table>
                <tr>
                    <th>Role</th>
                    <th>Level</th>
                </tr>
                %for r in roles:
                <tr>
                    <td>{{r[0]}}</td>
                    <td>{{r[1]}}</td>
                </tr>
                %end
            </table>
            <br/>
            <br/>
            <table>
                <tr>
                    <th>Managers</th>
                </tr>
                %for m in managers:
                <tr>
                    <td>{{m}}</td>
                </tr>
                %end
            </table>
            <br/><br/>
            <table>
                <tr>
                    <th>Experimeneter</th>
                </tr>
                %for m in experimenters:
                <tr>
                    <td>{{m}}</td>
                </tr>
                %end
            </table>
            <p>(Reload page to refresh)</p>
            <br />
            <p>Generate openvpn cert:</p>
            <form action="certificates" method="post" class="return">
              <p><label>Username</label> <input type="text" name="username" /></p>
                <p><label>Password</label> <input type="text" name="password" /></p>
                <p><label>days</label> <input type="text" name="days" value="1"/></p>
                <button type="submit"> OK </button>
            </form>
            <br />
            <p>Check user:</p>
            <form action="check_user" method="get" class="ajax">
              <p><label>Username</label> <input type="text" name="username" /></p>
               <button type="submit"> OK </button>
            </form>
            <br />
            <p>Refresh user:</p>
            <form action="refresh_user" method="post" class="ajax">
              <p><label>Username</label> <input type="text" name="username" /></p>
               <button type="submit"> OK </button>
            </form>
        </div>

        <div class="clear"></div>

        <div id='status'>
            <p>Ready.</p>
        </div>
        <div id="urls">
            <a href="/">index</a> <a href="/logout">logout</a>
        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <script>
            // Prevent form submission, send POST asynchronously and parse returned JSON
            $('form.ajax').submit(function() {
                $("div#status").fadeIn(100);
                z = $(this);
                $.post($(this).attr('action'), $(this).serialize(), function(j){
                  console.log(j)
                  if (j.ok) {
                    $("div#status").css("background-color", "#f0fff0");
                    $("div#status p").text('Ok.');
                  } else {
                    $("div#status").css("background-color", "#fff0f0");
                    $("div#status p").text(j.msg);
                  }
                  $("div#status").delay(800).fadeOut(500);
                }, "json")
                .fail(function(j) {
                    console.log(j)
                    $("div#status").css("background-color", "#fff0f0");
                    $("div#status p").text(j.responseText);
                    $("div#status").delay(3000).fadeOut(500);
                });
                return false;
            });
        </script>
    </div>
    <style>
        h1 {
          color: #111;
          font-family: 'Helvetica Neue', sans-serif;
          font-size: xx-large;
          font-weight: bold;
          letter-spacing: -1px;
          line-height: 1;
          text-align: center;
        }
        div#commands { width: 45%%; float: left}
        div#users { width: 45%; float: right}
        div#main {
            color: #777;
            margin: auto;
            margin-left: 5em;
            font-size: 80%;
        }
        input {
            background: #f8f8f8;
            border: 1px solid #777;
            margin: auto;
        }
        input:hover { background: #fefefe}
        label {
          width: 8em;
          float: left;
          text-align: right;
          margin-right: 0.5em;
          display: block
        }
        button {
            margin-left: 13em;
        }
        button.close {
            margin-left: .1em;
        }
        div#status {
            border: 1px solid #999;
            padding: .5em;
            margin: 2em;
            width: 15em;
            -moz-border-radius: 10px;
            border-radius: 10px;
        }
        .clear { clear: both;}
        div#urls {
          position:absolute;
          top:0;
          right:1em;
        }
    </style>
</body>

</html>
