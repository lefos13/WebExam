
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="javax.json.JsonArrayBuilder"%>
<%@page import="javax.json.JsonBuilderFactory"%>
<%@page import="javax.json.Json"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.Questions"%>
<%
   int counter=Integer.parseInt(request.getParameter("counter"));  
   String answer=request.getParameter("answer");
   String idq=request.getParameter("idq");
   int answered=Integer.parseInt(request.getParameter("answered"));
   String trueans=request.getParameter("trueans");
   String time=request.getParameter("time");
   String username=(String)session.getAttribute("username");
   String eksetasi=(String)session.getAttribute("eksetasi");
   
//   JsonBuilderFactory factory = Json.createBuilderFactory(null);
//   JsonArrayBuilder jsonA = factory.createArrayBuilder();
//   
//   jsonA = jsonA.add(factory.createObjectBuilder()
//         .add("username",username)
//         .add("idq", idq)
//         .add("answer", answer)
//         .add("trueanwer", trueans)
//         .add("time", time)
//
//    );
   
   String data=username+"-"+idq+"-"+answer+"-"+trueans+"-"+time+"-"+eksetasi;
   
   URL oracle = new URL("http://localhost:8080/service/webresources/exam/storeans/"+data);
   
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
     
     if(flag.equals("0"))
     {
         //out.println("all not ok");
     }else
     {
         //out.println("all ok");
     }
     
     
   answered++;
   //out.println("counter:"+counter +" answer:"+ answer + " idq:"+idq);
   List<Questions> qarr = (List<Questions>)session.getAttribute("questions");
   if(counter<5){
       counter++;
   }
   
   
    if(counter==5 && answered==5)
    {
        
        
        session.invalidate();
        %>
        <h1><label class='label label-default'>End of Exam</label></h1>
        <a href="index.jsp" class="btn btn-primary">Exit</a>
        <%
    } 
    else if(counter <= 4)
    {
        
        %>

      
            <div class="form-group">
                <h2><label class="label label-default"><%out.println(qarr.get(counter).getQ());%></label></h2>
            </div>
            <div class="form-group">
            <label for="exampleFormControlSelect1">Choose your answer</label>
            <select class="form-control" id="answer" name="answer">
              <option>True</option>
              <option>False</option>
            </select>
            <input type="hidden" id="counter" value=<%out.println(counter);%>>
            <input type="hidden" id="answered" value=<%out.println(answered);%>>
            <input type="hidden" id="idq" value="<%out.println(qarr.get(counter).getId());%>">
            <input type="hidden" id="trueanswer" value="<%out.println(qarr.get(counter).getA());%>">
            </div>
            <button onclick="confirm_answer()" class="btn btn-primary">Submit</button>
            <button onclick="skip_question()" class="btn btn-primary">Skip Question</button>
          
        <%
    }//end else for counter <5
    else if(counter==5 && answered<5){

       List<Questions> sarr = null;
       sarr = (List<Questions>)session.getAttribute("skipped");
       
       %>

                    <div class="form-group">
                        <h2><label class="label label-default"><%out.println(sarr.get(0).getQ());%></label></h2>
                    </div>
                    <div class="form-group">
                    <label for="exampleFormControlSelect1">Choose your answer</label>
                    <select class="form-control" id="answer" name="answer">
                      <option>True</option>
                      <option>False</option>
                    </select>
                    <input type="hidden" id="counter" value=<%out.println(counter);%>>
                    <input type="hidden" id="answered" value=<%out.println(answered);%>>
                    <input type="hidden" id="idq" value="<%out.println(sarr.get(0).getId());%>">
                    <input type="hidden" id="trueanswer" value="<%out.println(sarr.get(0).getA());%>">
                    </div>
                    <button onclick="confirm_answer()" class="btn btn-primary">Submit</button>
                    <button onclick="skip_question()" class="btn btn-primary">Skip Question</button>
         
       <%
       Questions obj= sarr.get(0);
       sarr.remove(0);
       session.setAttribute("cur", obj);
       session.setAttribute("skipped", sarr);
    }
%>