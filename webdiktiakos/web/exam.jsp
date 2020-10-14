<%@page import="org.json.JSONObject"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="classes.Questions"%>
<%@page import="java.util.*"%>
<%@page import="java.util.concurrent.ThreadLocalRandom"%>

<!DOCTYPE html>
<%
          
     String type=(String)session.getAttribute("type"); 
     String username=(String)session.getAttribute("username"); 
      //out.println(type + " " + username);
     URL oracle = new URL("http://localhost:8080/service/webresources/exam/getq");
     
     
     
     BufferedReader in = new BufferedReader( new InputStreamReader(oracle.openStream()));
     String result,total="";
     while ((result = in.readLine()) != null)
     {
         total+=result;
     }
     
     List<Questions> qarr = new ArrayList<>();
     
     JSONArray arr = new JSONArray(total);
     Questions object;
     String id,question,answer;
     for (int i = 0; i < arr.length(); i++) 
     { // Walk through the Array.
                JSONObject obj = arr.getJSONObject(i);
                id = obj.getString("id");
                question = obj.getString("question");
                answer = obj.getString("answer");
                
                object=new Questions(id,question,answer);
                qarr.add(object);
     }  
     Collections.shuffle(qarr);
     session.setAttribute("questions", qarr);
     int counter=0;
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
    function confirm_answer(){
        if (confirm("Are you sure?")) {
            var counter=document.getElementById("counter").value;
            var answer=document.getElementById("answer").value;
            var idq=document.getElementById("idq").value;
            var answered=document.getElementById("answered").value;
            var trueanswer=document.getElementById("trueanswer").value;
            var time=document.getElementById("time").innerHTML;
            //document.getElementById("questions").innerHTML=second[1];
            new_question(answer,counter,idq,answered,trueanswer,time);
        } else {
            
        }
    }
    
    function skip_question(){
        var counter=document.getElementById("counter").value;
        var answered=document.getElementById("answered").value;
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
         document.getElementById("questions").innerHTML = this.responseText;
        }
        };
        xhttp.open("GET", "skip_question.jsp?counter="+counter+"&answered="+answered, true);
        xhttp.send();
    }
    
    
    
    function new_question(answer,counter,idq,answered,trueans,time) {  
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
         document.getElementById("questions").innerHTML = this.responseText;
        }
      };
      xhttp.open("GET", "new_question.jsp?answer="+answer+"&counter="+counter+"&idq="+idq+"&answered="+answered+"&trueans="+trueans+"&time="+time, true);
      xhttp.send();
    }
    
    function startTimer(duration, display) {
        var timer = duration, minutes, seconds;
        setInterval(function () {
            minutes = parseInt(timer / 60, 10)
            seconds = parseInt(timer % 60, 10);

            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;

            display.textContent = minutes + ":" + seconds;

            if (--timer < 0) {
                setTimeout(function() {
                //document.location = "/webdiktiakos/index.jsp";
                }, 1000);
            }
        }, 1000);
    }

    window.onload = function () {
        var fiveMinutes = 60,
            display = document.querySelector('#time');
        startTimer(fiveMinutes, display);
    };
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
            <a class="navbar-brand" href="index.jsp">Web Exams</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
               <% if(type.equals("user")){
                   
               }
               else if(type.equals("admin_s"))
               {
                   %>
                   <li><a href="addquestion.jsp">Add question</a></li>
                   <li><a href="adduser.jsp">Add user</a></li>
                   <li><a href="addexam.jsp">Add exam center</a></li>
                   <li><a href="addadminc.jsp">Add admin center</a></li>
                   <li><a href="addtest.jsp">Add exam</a></li>
                   <li><a href="startexam.jsp">Start exam procedure</a></li>
                   <li><a href="reports.jsp">Reports</a></li>
                   <%
               }
               else if(type.equals("admin_c"))
               {
                    %>
                   <li><a href="startexam.jsp">Start exam procedure</a></li>
                   <li><a href="addusertoexam.jsp">Add user to an exam</a></li>
                   <li><a href="reports.jsp">Reports</a></li>
                   <%
               }
              
              %>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
            
      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
          <h2><div id="time" class="label label-default"></div><h2>
            <div id="questions">
              
                    <div class="form-group">
                        <h2><label class="label label-default"><%out.println(qarr.get(0).getQ());%></label></h2>
                    </div>
                    <div class="form-group">
                    <label for="exampleFormControlSelect1">Choose your answer</label>
                    <select class="form-control" id="answer" name="answer">
                      <option>True</option>
                      <option>False</option>
                    </select>
                    <input type="hidden" id="counter" value=0>
                    <input type="hidden" id="answered" value=0>
                    <input type="hidden" id="idq" value="<%out.println(qarr.get(0).getId());%>">
                    <input type="hidden" id="trueanswer" value="<%out.println(qarr.get(0).getA());%>">
                    </div>
                    <button onclick="confirm_answer()" class="btn btn-primary">Submit</button>
                    <button onclick="skip_question()" class="btn btn-primary">Skip Question</button>
              </div>          
      </div> <!-- question form -->
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  </body>
</html>