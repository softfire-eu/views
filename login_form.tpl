<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="content-type">
    <link rel="shortcut icon" type="image/png" href="static/favicon.ico" />
    <!-- Bootstrap -->
    <link href="static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="static/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="static/custom.css" rel="stylesheet">
  </head>
  <body  class="login">
    <div class="login_wrapper">
      <div class="animate form login_form">
        <section class="login_content">
          <form action="login" method="post" name="login">
            <h1>Login</h1>
            <div>
              <input type="text" name="username" class="form-control" placeholder="Username" />
            </div>
            <div>
              <input type="password" class="form-control" placeholder="Password" name="password" />
            </div>
            <div class="text-center">
              <button style="float: none;"  class="btn col-md-5 btn-primary btn-orange submit" type="submit"> Log in </button>
            </div>

            <div class="clearfix"></div>

            <div class="separator">

              <div class="clearfix"></div>
              <br />

              <div>
                <img src="static/softfire.png" width="200" alt="logo">
                <p>©2017 All Rights Reserved.</p>
              </div>
            </div>
          </form>
        </section>
      </div>
    </div>
    <script src="static/jquery.min.js"></script>
    <script>
        // Prevent form submission, send POST asynchronously and parse returned JSON
        $("div#status").hide();
        $('form').submit(function() {
            $("div#status").fadeIn(100);
            z = $(this);
            $.post($(this).attr('action'), $(this).serialize(), function(j){
              console.log('here')
              console.log(j)
              console.log('j: ' + j)
              if (j.ok) {
                window.location = j.redirect;
              } else {
                $("div#status").css("background-color", "#fff0f0");
                $("div#status").text(j.msg);
              }
              $("div#status").delay(1800).fadeOut(700);
            }, "json");
            return false;
        });
    </script>
  </body>
</html>
