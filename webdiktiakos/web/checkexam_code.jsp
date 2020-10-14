
<%@page import="com.mysql.jdbc.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%
    
    String examid=(String)session.getAttribute("eksetasi");
    //out.println(objq.question + " " + objq.answer);
    if(examid.equals("-1"))
    {
        out.println("You have already taken the exam");
         %>
         <script>
            setTimeout(function() {
                document.location = "/webdiktiakos/index.jsp";
            }, 3000); // <-- this is the delay in milliseconds
         </script>
         <%
    }else
    {
    
        String redirectURL = "http://localhost:8080/service/webresources/tryto/check/"+examid;
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
                    flag = obj.getString("exam");
         }
         if(flag.equals("0"))
         {
             out.println("The exam isnt yet started by the Admin Center");
             %>
             <script>
                setTimeout(function() {
                    document.location = "/webdiktiakos/main.jsp";
                }, 4000); // <-- this is the delay in milliseconds
             </script>
             <%
        }else
        {
            String id=(String)session.getAttribute("id");
            redirectURL = "http://localhost:8080/service/webresources/exam/upus/"+id;
            oracle = new URL(redirectURL);
            in = new BufferedReader( new InputStreamReader(oracle.openStream()));
             total="";
             while ((result = in.readLine()) != null)
             {
                 total+=result;
             }

             arr = new JSONArray(total);
             flag="0";
             for (int i = 0; i < arr.length(); i++) 
             { // Walk through the Array.
                        JSONObject obj = arr.getJSONObject(i);
                        flag = obj.getString("flag");
             }

            if(flag.equals("1")){
                String redirect = "http://localhost:8080/webdiktiakos/exam.jsp";
                response.sendRedirect(redirect);
            }   
        }
    }
                                     
                                     
                                     
                
 %>
    

