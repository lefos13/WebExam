
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="javax.json.JsonArrayBuilder"%>
<%@page import="javax.json.JsonBuilderFactory"%>
<%@page import="javax.json.Json"%>
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
  String username=request.getParameter("username");
  JsonBuilderFactory factory = Json.createBuilderFactory(null);
  JsonArrayBuilder jsonA = factory.createArrayBuilder();
  
  jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("username",username)                        
            );
  String test=jsonA.build().toString();
  test=test.replace("{", "%7B");
  test=test.replace("}", "%7D");
  URL oracle = new URL("http://localhost:8080/service/webresources/reports/ru/"+test);
  //URL oracle = new URL("http://localhost:8080/service/webresources/reports/rae/"+examid);
  //URL oracle = new URL("http://localhost:8080/service/webresources/reports/rae/[{\"exam_id\":\"1\"}]");
    BufferedReader in = new BufferedReader( new InputStreamReader(oracle.openStream()));
     String result,total="";
     while ((result = in.readLine()) != null)
     {
         total+=result;
     }
     
   
     
     JSONArray arr = new JSONArray(total);
     for (int i = 0; i < arr.length(); i++) 
     { // Walk through the Array.
                out.println("<tr><th scope='row'>"+i+"</th>");
                JSONObject obj = arr.getJSONObject(i);
               
                
                out.println("<td>"+obj.getString("username")+"</td>");
                out.println("<td>"+obj.getString("idq")+"</td>");
                out.println("<td>"+obj.getString("answer")+"</td>");
                out.println("<td>"+obj.getString("trueanswer")+"</td>");
                out.println("<td>"+obj.getString("time")+"</td>");
                out.println("<td>"+obj.getString("examid")+"</td>");
                out.println("</tr>");
     }
    
%>  
  </tbody>
</table>