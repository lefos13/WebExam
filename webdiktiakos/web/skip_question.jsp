<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.Questions"%>
<%
   int counter=Integer.parseInt(request.getParameter("counter"));  
   int answered=Integer.parseInt(request.getParameter("answered"));
   
   
   List<Questions> sarr = null;
   List<Questions> qarr = (List<Questions>)session.getAttribute("questions");
    if(counter==answered)
    {
       sarr = new ArrayList<>();
       sarr.add(qarr.get(counter));
       session.setAttribute("skipped", sarr);
    }
    else if(counter>answered)
    {
       sarr = (List<Questions>)session.getAttribute("skipped");
       if (counter<=4){
            sarr.add(qarr.get(counter));
            session.setAttribute("skipped", sarr);
       }
       
    }
    else
    {
        sarr = (List<Questions>)session.getAttribute("skipped");
    }
    
    if(counter<5)
    {
       counter++;
    }
        
    
    if(counter <= 4)
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
        if(session.getAttribute("cur")!=null)
        {
            Questions obj=(Questions)session.getAttribute("cur");
            sarr.add(obj);
            
        }
        session.setAttribute("cur",sarr.get(0));
        
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
            sarr.remove(0);
            session.setAttribute("skipped", sarr);
    }
%>