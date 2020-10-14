/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
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
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
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
@Path("exam")
public class ExamClass {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of ExamClass
     */
    public ExamClass() {
    }

    /**
     * Retrieves representation of an instance of service.ExamClass
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getJson() {
        //TODO return proper representation object
        throw new UnsupportedOperationException();
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("getq")
    public String logincheck() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException 
    {
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
        
            String sq1String = "select * from questions";
            ResultSet rs=myStatement.executeQuery(sq1String);
            while(rs.next()){
                jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("id",rs.getString("id"))
                 .add("question", rs.getString("question"))
                 .add("answer", rs.getString("answer"))
                        
            );
            }
            
            myStatement.close();
            myConnection.close(); 
            return jsonA.build().toString();
            //return "1";
            
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("storeans/{data}")
    public String storeAnswer(@PathParam ("data") String a) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException, JSONException 
    {
            
            String username;
            String idq;
            String answer;
            String trueans;
            String time;
            String exam_id;
            
            String[] total=a.split("-");
            username=total[0];
            idq=total[1];
            answer=total[2];
            trueans=total[3];
            time=total[4];
            exam_id=total[5];
            
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
            String sqlString = "insert into quest_ans(username,id_q,answer,trueanswer,time,exam_id) values('"+username+"','"+idq+"','"+answer+"','"+trueans+"','"+time+"','"+exam_id+"')";
            myStatement.executeUpdate(sqlString);
            
            jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("flag","1")                        
            );
            
            
            myStatement.close();
            myConnection.close(); 
            return jsonA.build().toString();
            //return "1";
            
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("upus/{data}")
    public String updateUser(@PathParam ("data") String a) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException, JSONException 
    {
            
            
            
            JsonBuilderFactory factory = Json.createBuilderFactory(null);
            JsonArrayBuilder jsonA = factory.createArrayBuilder();
            
            Class.forName("com.mysql.jdbc.Driver");
            String myDatabase = "jdbc:mysql://localhost:3306/diktiakos?useSSL=false";
            java.sql.Connection myConnection = DriverManager.getConnection(myDatabase,"root","");
            Statement myStatement = myConnection.createStatement();
            
            String sqlString = "update users SET eksetasi_id='-1' where id='"+a+"'";
            myStatement.executeUpdate(sqlString);
            
            jsonA = jsonA.add(factory.createObjectBuilder()
                 .add("flag","1")                        
            );
            
            
            myStatement.close();
            myConnection.close(); 
            return jsonA.build().toString();
            
    }

    /**
     * PUT method for updating or creating an instance of ExamClass
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content){
       
    }
}
