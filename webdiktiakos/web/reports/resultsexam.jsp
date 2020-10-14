<!DOCTYPE html>
<%
          
      String type=(String)session.getAttribute("type"); 
      String username=(String)session.getAttribute("username"); 
      //out.println(type + " " + username);

%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Exams">
    <meta name="author" content="Evangelinos Lefteris">
    <link rel="icon" href="../../favicon.ico">

    <title>Web programming project</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script>
        function show(){
            var exam_id = document.getElementById("examid").value;
            var xhttp = new XMLHttpRequest();
            
            xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                 document.getElementById("main").innerHTML = this.responseText;
            }
            };
            
            xhttp.open("GET", "ajaxre.jsp?examid="+exam_id, true);
            xhttp.send();
            
        }
    </script>
  </head>

  <body>

    <div class="container">

      <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="../index.jsp">Web Exams</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
               <% if(type.equals("user")){
                   
               }
               else if(type.equals("admin_s"))
               {
                   %>
                   <li><a href="../addquestion.jsp">Add question</a></li>
                   <li><a href="../adduser.jsp">Add user</a></li>
                   <li><a href="../addexam.jsp">Add exam center</a></li>
                   <li><a href="../addadminc.jsp">Add admin center</a></li>
                   <li><a href="../addtest.jsp">Add exam</a></li>
                   <li><a href="../startexam.jsp">Start exam procedure</a></li>
                   <li><a href="../reports.jsp">Reports</a></li>
                   <%
               }
               else if(type.equals("admin_c"))
               {
                    %>
                   <li><a href="../startexam.jsp">Start exam procedure</a></li>
                   <li><a href="../addusertoexam.jsp">Add user to an exam</a></li>
                   <li><a href="../reports.jsp">Reports</a></li>
                   <%
               }
              
              %>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>

      <!-- Main component for a primary marketing message or call to action -->
      <div>
          <div class="jumbotron">
              <div id="main">
                  <div class="form-group">
                      <label>Exam id</label>
                      <input type="text" id="examid" class="form-control" placeholder="Exam id"><br>
                      <button onclick="show()" class="btn btn-primary" >Submit</button>
                  </div>
              </div>
          </div>
          
      </div>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  </body>
</html>
