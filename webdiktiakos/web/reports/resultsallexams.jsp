<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
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
                  <table class="table table-dark">
                    <thead>
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">Name</th>
                      <th scope="col">Id Question</th>
                      <th scope="col">Answer</th>
                      <th scope="col">True Answer</th>
                      <th scope="col">Time</th>
                      <th scope="col">Exam id</th>
                    </tr>
                  </thead>
                  <tbody>
                    <%             
                  URL oracle = new URL("http://localhost:8080/service/webresources/reports/allres");
                  
                    BufferedReader in = new BufferedReader( new InputStreamReader(oracle.openStream()));
                     String result,total="";
                     while ((result = in.readLine()) != null)
                     {
                         total+=result;
                     }



                     JSONArray arr = new JSONArray(total);
                     String tempid="-2";
                     for (int i = 0; i < arr.length(); i++) 
                     { // Walk through the Array.
                                out.println("<tr><th scope='row'>"+i+"</th>");
                                JSONObject obj = arr.getJSONObject(i);
                                if(tempid.equals("-2"))
                                {
                                    tempid=obj.getString("examid");
                                    out.println("<td>"+obj.getString("username")+"</td>");
                                    out.println("<td>"+obj.getString("idq")+"</td>");
                                    out.println("<td>"+obj.getString("answer")+"</td>");
                                    out.println("<td>"+obj.getString("trueanswer")+"</td>");
                                    out.println("<td>"+obj.getString("time")+"</td>");
                                    out.println("<td>"+obj.getString("examid")+"</td>");
                                    out.println("</tr>");
                                }else if(tempid.equals(obj.getString("examid")))
                                {
                                    out.println("<td>"+obj.getString("username")+"</td>");
                                    out.println("<td>"+obj.getString("idq")+"</td>");
                                    out.println("<td>"+obj.getString("answer")+"</td>");
                                    out.println("<td>"+obj.getString("trueanswer")+"</td>");
                                    out.println("<td>"+obj.getString("time")+"</td>");
                                    out.println("<td>"+obj.getString("examid")+"</td>");
                                    out.println("</tr>");
                                    
                                }else
                                {
                                    out.println("</tr>");
                                    tempid=obj.getString("examid");
                                    out.println("<tr><th scope='row'>"+i+"</th>");
                                    out.println("<td>"+obj.getString("username")+"</td>");
                                    out.println("<td>"+obj.getString("idq")+"</td>");
                                    out.println("<td>"+obj.getString("answer")+"</td>");
                                    out.println("<td>"+obj.getString("trueanswer")+"</td>");
                                    out.println("<td>"+obj.getString("time")+"</td>");
                                    out.println("<td>"+obj.getString("examid")+"</td>");
                                    out.println("</tr>");
                                }

                                
                     }

                    %>  
                  
                  
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

