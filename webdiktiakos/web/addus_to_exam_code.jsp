<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="classes.Questions" %>
<%
    String userid = request.getParameter("userid");
    String examid = request.getParameter("examid");
    //out.println(objq.question + " " + objq.answer);
    
    
    String redirectURL = "http://localhost:8080/service/webresources/tryto/addutoe/"+userid+"/"+examid;
    URL oracle = new URL(redirectURL);
    
    BufferedReader in = new BufferedReader( new InputStreamReader(oracle.openStream()));
     String result,total="";
     while ((result = in.readLine()) != null)
     {
         total+=result;
     }
     
     JSONArray arr = new JSONArray(total);
     String flag="0";
     for (int i = 0; i < arr.length(); i++) 
     { // Walk through the Array.
                JSONObject obj = arr.getJSONObject(i);
                flag = obj.getString("flag");
     }
     out.println(flag);
     //String redirect = "http://localhost:8080/webdiktiakos/main.jsp";
     //response.sendRedirect(redirect); 
 %>
<script>
  setTimeout(function() {
      document.location = "/webdiktiakos/main.jsp";
  }, 1000); // <-- this is the delay in milliseconds
</script>

