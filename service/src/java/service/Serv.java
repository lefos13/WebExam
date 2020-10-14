/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObjectBuilder;
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
@Path("tryto")
public class Serv {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of Serv
     */
    public Serv() {
    }

    /**
     * Retrieves representation of an instance of service.Serv
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("{data}/{data2}")
    public String logincheck(@PathParam ("data") String a,@PathParam ("data2") String b) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException 
    {
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonObjectBuilder jsonB = factory.createObjectBuilder();
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
        
            String sq1String = "select * from users where username='"+a+"' and password='"+b+"'";
            ResultSet rs=myStatement.executeQuery(sq1String);
            
            String username;
            String admin_s;
            String admin_c;
            String eksetash,id;
            if(rs.next()){
                id=rs.getString("id");
                username= rs.getString("username");
                admin_s= rs.getString("admin_system");
                admin_c= rs.getString("admin_center");
                eksetash= rs.getString("eksetasi_id");
                jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("flag", "1")
                 .add("id",id)
                 .add("username", username)
                 .add("admin_s", admin_s)
                 .add("admin_c", admin_c)
                 .add("eksetasi", eksetash)
                        
            );
            }else
            {
                jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("flag", "0")                        
                );
                return  jsonA.build().toString();
            }
            
        
        
            
            myStatement.close();
            myConnection.close(); 
            return jsonA.build().toString();
            //return "1";
            
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("addq/{q}/{a}")
    public String addquestion(@PathParam ("q") String question,@PathParam ("a") String answer) throws ClassNotFoundException, SQLException 
    {
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
            String sq1String="insert into questions(question,answer) values('"+question+"','"+answer+"')";
            //String sq1String="insert into questions(question,answer) values('test','test')";
            myStatement.executeUpdate(sq1String); 
            
            jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("flag", "no errors")                        
            );
            
            return jsonA.build().toString();
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("addu/{u}/{p}")
    public String adduser(@PathParam ("u") String username,@PathParam ("p") String password) throws ClassNotFoundException, SQLException 
    {
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
            String sq1String="insert into users(username,password) values('"+username+"','"+password+"')";
            //String sq1String="insert into questions(question,answer) values('test','test')";
            myStatement.executeUpdate(sq1String); 
            
            jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("flag", "no errors")                        
            );
            
            return jsonA.build().toString();
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("addex/{n}/{a}")
    public String addex(@PathParam ("n") String name,@PathParam ("a") String address) throws ClassNotFoundException, SQLException 
    {
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
            String sq1String="insert into test_center(name,address) values('"+name+"','"+address+"')";
            //String sq1String="insert into questions(question,answer) values('test','test')";
            myStatement.executeUpdate(sq1String); 
            
            jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("flag", "no errors")                        
            );
            
            return jsonA.build().toString();
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("addac/{u}/{p}/{id}")
    public String addAdminCenter(@PathParam ("u") String username, @PathParam ("p") String password, @PathParam ("id") String id) throws ClassNotFoundException, SQLException 
    {
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
            String sq1String="insert into users(username,password,admin_center) values('"+username+"','"+password+"','1')";
            myStatement.executeUpdate(sq1String); 
            
            String sqlString2="select * from users where username='"+username+"' and password='"+password+"'";
            ResultSet rs=myStatement.executeQuery(sqlString2);
            
            String userid=null;
            
            if(rs.next()){
                userid=rs.getString("id");
            }

            String sqlString3="insert into admin_center(id_user,id_center) values('"+userid+"','"+id+"')";
            myStatement.executeUpdate(sqlString3); 
            
            jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("flag", "no errors")                        
            );
            
            return jsonA.build().toString();
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("addt/{d}/{id}")
    public String addtest(@PathParam ("d") String date,@PathParam ("id") String id) throws ClassNotFoundException, SQLException 
    {
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
            String sq1String="insert into test(date,test_c_id) values('"+date+"','"+id+"')";
            //String sq1String="insert into questions(question,answer) values('test','test')";
            myStatement.executeUpdate(sq1String); 
            
            jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("flag", "no errors")                        
            );
            
            return jsonA.build().toString();
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("startex/{id}")
    public String startExam(@PathParam ("id") String id) throws ClassNotFoundException, SQLException 
    {
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
            String sq1String="update test SET flag=1 where id='"+id+"'";
            
            myStatement.executeUpdate(sq1String); 
            
            jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("flag", "no errors")                        
            );
            
            return jsonA.build().toString();
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("addutoe/{uid}/{eid}")
    public String addUserToExam(@PathParam ("uid") String userid,@PathParam ("eid") String examid) throws ClassNotFoundException, SQLException 
    {
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
            String sq1String="update users SET eksetasi_id='"+examid+"' where id='"+userid+"'";
            //String sq1String="insert into questions(question,answer) values('test','test')";
            myStatement.executeUpdate(sq1String); 
            
            jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("flag", "no errors")                        
            );
            
            return jsonA.build().toString();
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("check/{eid}")
    public String checkExam(@PathParam ("eid") String examid) throws ClassNotFoundException, SQLException 
    {
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
            String sqlString="select * from test where id='"+examid+"'";
            //String sq1String="insert into questions(question,answer) values('test','test')";
            ResultSet rs=myStatement.executeQuery(sqlString);
            String flag;
            if(rs.next())
            {
                flag=rs.getString("flag");
                if(flag.equals("0"))
                {
                    jsonA = jsonA.add(factory.createObjectBuilder()
                        .add("exam", "0")                        
                    );
                }else
                {
                    jsonA = jsonA.add(factory.createObjectBuilder()
                        .add("exam", "1")                        
                    );
                }
            }
            
            
            return jsonA.build().toString();
    }
    
    @GET
    @Path("returnuc/{data}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getUser(@PathParam ("data") String data) throws ClassNotFoundException, SQLException, JSONException {
        
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
             String uid="-1";
             JSONArray arr = new JSONArray(data);
             for (int i = 0; i < arr.length(); i++) 
             { // Walk through the Array.
                        JSONObject obj = arr.getJSONObject(i);
                        uid=obj.getString("uid");
             }  
            
            
            
            String sq1String = "select * from admin_center where id_user='"+uid+"'";
            ResultSet rs=myStatement.executeQuery(sq1String);
            String idc=null;
            while(rs.next()){
                idc=rs.getString("id_center");
            }
            
            sq1String = "select * from test where test_c_id='"+idc+"'";
            rs=myStatement.executeQuery(sq1String);
            
            while(rs.next()){
                jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("id",rs.getString("id"))
                 .add("date", rs.getString("date"))
            );
            }
            
            myStatement.close();
            myConnection.close(); 
            return jsonA.build().toString();
    }

    /**
     * PUT method for updating or creating an instance of Serv
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content) {
    }
}
