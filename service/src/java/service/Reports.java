/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.math.BigDecimal;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonBuilderFactory;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * REST Web Service
 *
 * @author Lefos
 */
@Path("reports")
public class Reports {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of Reports
     */
    public Reports() {
    }

    /**
     * Retrieves representation of an instance of service.Reports
     * @return an instance of java.lang.String
     */
    @GET
    @Path("rae/{data}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getJson(@PathParam ("data") String data) throws ClassNotFoundException, SQLException, JSONException {
        
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
             String examid="-1";
             JSONArray arr = new JSONArray(data);
             for (int i = 0; i < arr.length(); i++) 
             { // Walk through the Array.
                        JSONObject obj = arr.getJSONObject(i);
                        examid=obj.getString("exam_id");
             }  
            
            
            
            String sq1String = "select * from quest_ans where exam_id='"+examid+"'";
            ResultSet rs=myStatement.executeQuery(sq1String);
            while(rs.next()){
                jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("username",rs.getString("username"))
                 .add("idq", rs.getString("id_q"))
                 .add("answer", rs.getString("answer"))
                 .add("trueanswer", rs.getString("trueanswer"))
                 .add("time", rs.getString("time"))        
            );
            }
            
            myStatement.close();
            myConnection.close(); 
            return jsonA.build().toString();
    }
    
    @GET
    @Path("ru/{data}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getUser(@PathParam ("data") String data) throws ClassNotFoundException, SQLException, JSONException {
        
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
             String username="-1";
             JSONArray arr = new JSONArray(data);
             for (int i = 0; i < arr.length(); i++) 
             { // Walk through the Array.
                        JSONObject obj = arr.getJSONObject(i);
                        username=obj.getString("username");
             }  
            
            
            
            String sq1String = "select * from quest_ans where username='"+username+"'";
            ResultSet rs=myStatement.executeQuery(sq1String);
            while(rs.next()){
                jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("username",rs.getString("username"))
                 .add("idq", rs.getString("id_q"))
                 .add("answer", rs.getString("answer"))
                 .add("trueanswer", rs.getString("trueanswer"))
                 .add("time", rs.getString("time"))  
                 .add("examid", rs.getString("exam_id")) 
            );
            }
            
            myStatement.close();
            myConnection.close(); 
            return jsonA.build().toString();
    }
    
    @GET
    @Path("getec")
    @Produces(MediaType.APPLICATION_JSON)
    public String getExamCenter() throws ClassNotFoundException, SQLException, JSONException {
        
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
            
             
            String sq1String = "select * from test_center";
            ResultSet rs=myStatement.executeQuery(sq1String);
            
            while(rs.next()){
                jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("id",rs.getString("id"))
                 .add("name", rs.getString("name"))
                 .add("address", rs.getString("address"))    
            );
            }
            
            myStatement.close();
            myConnection.close(); 
            return jsonA.build().toString();
    }
    
    @GET
    @Path("getdates/{data}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getDates(@PathParam ("data") String data) throws ClassNotFoundException, SQLException, JSONException {
        
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
            String centerid="-1";
             JSONArray arr = new JSONArray(data);
             for (int i = 0; i < arr.length(); i++) 
             { // Walk through the Array.
                        JSONObject obj = arr.getJSONObject(i);
                        centerid=obj.getString("cid");
             }  
            String sq1String = "select * from test where test_c_id='"+centerid+"'";
            ResultSet rs=myStatement.executeQuery(sq1String);
            
            while(rs.next()){
                jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("id",rs.getString("id"))
                 .add("date", rs.getString("date"))
                 .add("centerid", rs.getString("test_c_id"))    
            );
            }
            
            myStatement.close();
            myConnection.close(); 
            return jsonA.build().toString();
    }
    
    @GET
    @Path("finalec/{data}")
    @Produces(MediaType.APPLICATION_JSON)
    public String finalExamc(@PathParam ("data") String data) throws ClassNotFoundException, SQLException, JSONException {
        
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
             String testid="-1";
             JSONArray arr = new JSONArray(data);
             for (int i = 0; i < arr.length(); i++) 
             { // Walk through the Array.
                        JSONObject obj = arr.getJSONObject(i);
                        testid=obj.getString("testid");
             }  
            
            
            
            String sq1String = "select * from quest_ans where exam_id='"+testid+"'";
            ResultSet rs=myStatement.executeQuery(sq1String);
            while(rs.next()){
                jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("username",rs.getString("username"))
                 .add("idq", rs.getString("id_q"))
                 .add("answer", rs.getString("answer"))
                 .add("trueanswer", rs.getString("trueanswer"))
                 .add("time", rs.getString("time"))  
                 .add("examid", rs.getString("exam_id")) 
            );
            }
            
            myStatement.close();
            myConnection.close(); 
            return jsonA.build().toString();
    }
    
    @GET
    @Path("allres")
    @Produces(MediaType.APPLICATION_JSON)
    public String allRes() throws ClassNotFoundException, SQLException, JSONException {
        
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
           
            
            
            
            String sq1String = "select * from quest_ans order by username";
            ResultSet rs=myStatement.executeQuery(sq1String);
            while(rs.next()){
                jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("username",rs.getString("username"))
                 .add("idq", rs.getString("id_q"))
                 .add("answer", rs.getString("answer"))
                 .add("trueanswer", rs.getString("trueanswer"))
                 .add("time", rs.getString("time"))  
                 .add("examid", rs.getString("exam_id")) 
            );
            }
            
            myStatement.close();
            myConnection.close(); 
            return jsonA.build().toString();
    }
    /**
     * PUT method for updating or creating an instance of Reports
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content) {
    }
}
