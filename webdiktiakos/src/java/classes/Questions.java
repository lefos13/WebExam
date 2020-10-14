/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import static java.lang.System.out;

/**
 *
 * @author Lefos
 */
public class Questions {
    public String id;
    public String question;
    public String answer;
    
    public Questions(String i,String a, String b){
        id=i;
        question=a;
        answer=b;
    }
    
    public String getId(){
        return id;
    }
    
    public String getQ(){
        return question;
    }
    
    public String getA(){
        return answer;
    }
}
