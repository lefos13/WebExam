
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
    String username = request.getParameter("username");
    String password = request.getParameter("password");
  String redirectURL = "http://localhost:8080/service/webresources/tryto/"+username+"/"+password;
  //  (http://localhost:8080/webservice/webresources/tryto/asas/asasas)
    URL oracle = new URL("http://localhost:8080/service/webresources/tryto/"+username+"/"+password);
                                     BufferedReader in = new BufferedReader( new InputStreamReader(oracle.openStream()));
                                     String result,total="";
                                     while ((result = in.readLine()) != null)
                                     {
                                         total+=result;
                                     }
                                     
                                       
                                     JSONArray arr = new JSONArray(total);
                                     String found= "1";
                                     String flag = null;
                                     String admin_s = null;
                                     String admin_c = null;
                                     String eksetasi = null,id=null;
                                     for (int i = 0; i < arr.length(); i++) 
                                     { // Walk through the Array.
                                                JSONObject obj = arr.getJSONObject(i);
                                                flag = obj.getString("flag");
                                                if(flag.equals("0"))
                                                {
                                                    out.println("User not found");
                                                    found="0";
                                                    %>
                                                    <script>
                                                      setTimeout(function() {
                                                          document.location = "/webdiktiakos/index.jsp";
                                                      }, 1000); // <-- this is the delay in milliseconds
                                                    </script>
                                                    
                                                    <%
                                                    break;
                                                    
                                                }
                                                
                                                admin_s = obj.getString("admin_s");
                                                admin_c = obj.getString("admin_c");
                                                eksetasi = obj.getString("eksetasi");
                                                id = obj.getString("id");
                                     }
                                     
                                     if(found.equals("1"))
                                     {
                                         session.setAttribute("username",username); 
                                         // admin system
                                         if(admin_s.equals("1"))
                                         {
                                             session.setAttribute("type","admin_s");  
                                             session.setAttribute("id", id);
                                         }
                                         //admin kentrou
                                         else if(admin_c.equals("1"))
                                         {
                                             session.setAttribute("type","admin_c");
                                             session.setAttribute("id", id);
                                         }
                                         //aplos xrisths
                                         else
                                         {
                                             session.setAttribute("id", id);
                                             session.setAttribute("type","user");
                                             session.setAttribute("eksetasi",eksetasi);
                                         }
                                         String redirect = "http://localhost:8080/webdiktiakos/main.jsp";
                                         response.sendRedirect(redirect); 
                                          
                                     }
                                     
                                     
                                     
                
 %>
    
