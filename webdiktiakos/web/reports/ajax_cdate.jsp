
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="javax.json.JsonArrayBuilder"%>
<%@page import="javax.json.JsonBuilderFactory"%>
<%@page import="javax.json.Json"%>
<%
  String cid=request.getParameter("centerid");
  JsonBuilderFactory factory = Json.createBuilderFactory(null);
  JsonArrayBuilder jsonA = factory.createArrayBuilder();
  
  jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("cid",cid)                        
            );
  String test=jsonA.build().toString();
  test=test.replace("{", "%7B");
  test=test.replace("}", "%7D");
  URL oracle = new URL("http://localhost:8080/service/webresources/reports/getdates/"+test);
  
    BufferedReader in = new BufferedReader( new InputStreamReader(oracle.openStream()));
     String result,total="";
     while ((result = in.readLine()) != null)
     {
         total+=result;
     }
    
%>  

<label>Dates of exam center</label>
  <select id="date" class="form-control">
      <%

             JSONArray arr = new JSONArray(total);
             for (int i = 0; i < arr.length(); i++) 
             { // Walk through the Array.

                        JSONObject obj = arr.getJSONObject(i);
                        %>
                        <option value="<%out.println(obj.getString("id"));%>"><%out.println(obj.getString("date"));%></option>
                        <%
             }     
       %>
  </select>
  <br>
  <button onclick="final()" class="btn btn-primary" >Submit</button>