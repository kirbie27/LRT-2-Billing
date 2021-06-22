<%-- 
    Document   : transactionPortal
    Created on : 06 20, 21, 6:54:43 PM
    Author     : Kirby Wenceslao
--%>

<%@page import="LRT2_Models.Lrt2Stations, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0, text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200&display=swap" rel="stylesheet">
        <title>Transaction Portal</title>
        
        <style>
            
            *
            {
                margin: 0;
                padding: 0;
                font-family: 'Poppins', sans-serif;
                
            }
            
            body
            {
                height: 100vh;
                width: 100%;
                padding: 0px;
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: #FFA647;
                overflow: scroll;
            }
            
            body section
            {
                box-sizing: border-box;
                min-height: clamp(400px, 50vh, 500px);
                min-width: clamp(350px, 100vw, 500px);
                display: flex;
                flex-direction: column;
                justify-content: space-around;
           
                padding: 20px;
                background-color: #0A2342;
            
                border-radius: 40px 0px;
                box-shadow: 5px 5px bisque;
                color: white;
                align-items: center;
                
               
            }
            
            body section h1
            {
                text-align: center;
            }
            body section form 
            {
                box-sizing: border-box;
                height: 400px;
                width: 100%;
                display: flex;
                flex-direction: column;
                justify-content: space-around;
                
            }
            
            .text
            {
                border: 2px solid black;
                font-size: 18px;
                padding: 10px;
                font-weight: bold;
            }
            .confirmButtons
            {
                text-align: center;
                background-color: #3F88C5;
                text-decoration: none;
                border: none;
                font-size: 20px;
                color: white;
                cursor: pointer;
                padding: 10px;
                border-radius: 5px;
                
            }
            
            .confirmButtons:hover
            {
                transition: linear 0.1s;
                background-color: #8F3985;
                font-weight: 900;
            }
            
            h3
            {
                font-size: clamp(25px,100%, 30px);
                padding: 10px;
               
            }
            .summaryButtons
            {
                text-align: center;
                background-color: #3F88C5;
                text-decoration: none;
                border: none;
                font-size: 20px;
                color: white;
                cursor: pointer;
                padding: 10px;
                border-radius: 5px;
            }
            
            .summaryButtons:hover
            {
                transition: linear 0.1s;
                background-color: #FFA647;
                font-weight: 900;
            }
            
            
            section img
            {
            
                width: 50px;
                height: 40px;
                margin: 5px;
            }
            
            section form select
            {
                padding: 10px;
                cursor: pointer;
                font-size: 20px;
                font-weight:  500;
 
            }
            
            section form select option
            {
                font-size: 20px;
            }
            
            #transactionModal
            {
                position: fixed; /* Stay in place */
                height: 100%;
                width: 100%;
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                -webkit-animation-name: fadeIn; /* Fade in the background */
                -webkit-animation-duration: 0.4s;
                animation-name: fadeIn;
                animation-duration: 0.4s;
                text-align: center;
                justify-content: center !important;
                align-items: center !important;
                
             
            }

            .mContent
            {     
               
                box-sizing: border-box;
                padding: 30px;
                -webkit-animation-name: slideIn;
                -webkit-animation-duration: 0.4s;
                animation-name: slideIn;
                animation-duration: 0.4s;
                min-height: clamp(600px, 55vh, 550px);
                min-width: clamp(350px, 100vw, 550px);
                background-color: #F7F0F5;
                border: 5px solid black;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }
            
            @media only screen and (max-width: 550px)
            {
                body
                {
                    background-color: #0A2342; 
                }
                
                section, .mContent
                {
                    border-radius: 0px;
                    height: 70vh !important;
                    width: 100vh !important;
                    
                }
                
                
                section
                {
                    box-shadow: 0px 3px #FFA647 !important;
                }
                
               
            }
        </style>
        
        <script>
            function closeModal()
            {
                
                var modal = document.getElementById("transactionModal");
                modal.style.display = "none";
            }
            
            window.onclick = function(event) 
            {
                var modal = document.getElementById("transactionModal");
                if (event.target == modal) 
                {
                  modal.style.display = "none";
                }
            }
 
        </script>
    </head>
    <body>
        <%
             ServletContext sc = getServletContext(); 
             String open = "none";
             
             if (sc.getAttribute("open") != null)
             {
                 open = (String) sc.getAttribute("open");
                 sc.removeAttribute("open");
             }
        %>
        
        <div id = "transactionModal" class = "modal"  style = <% out.println(String.format("\"display: %s;\"",open)); %> >
            <form class ="mContent" action ="SJTransactionSuccess" method = "POST">
                <h3>Transaction Summary</h3>
                <hr>
                <%
                 
                  String from = (String) sc.getAttribute("from");
                  String to = (String) sc.getAttribute("to");
                  String fare = (String) sc.getAttribute("fare");
                  String valid = "";
                  if (sc.getAttribute("valid") != null)
                  {
                    valid = (String) sc.getAttribute("valid");
                    sc.removeAttribute("valid");
                  }
                  out.println("<p class = 'text'>You are here: "+ from+"</p>");  
                  out.println("<p class = 'text'>Your destination: "+ to+"</p>"); 
                  out.println("<p class = 'text'>Your fare: "+ fare+"</p>"); 
                %>
                
                <%
                    if (valid.equals("true"))
                    {
                %>
                <input class = "summaryButtons" type="submit" value ="Confirm Transaction">
                <%
                    }
                %>
                <a class = "summaryButtons" href = "" onclick = "closeModal()">Cancel Transaction</a>
            </form>
              
        </div>    
        
        <section>
            <img src ="Assets/Pictures/LOGO.png">
            <h1>
                LRT2 TRANSACTION PORTAL
            </h1>
            
            <form method = "POST" action = "ConfirmTravel">
                
                <label for="fromWhere">Where are you right now?</label>  
                <select id = "fromWhere" name = "fromWhere">
                    <%
                      
                       Lrt2Stations data = (Lrt2Stations) sc.getAttribute("stations"); 
                       ArrayList<String> stations = data.getStations();
                       
                       for (int i = 0; i < stations.size(); i++)
                       {
                           String s = stations.get(i);
                           String option = String.format("<option value = '%s'>%s</option>",s,s);
                           out.println(option);
                       }
                    %>
                </select>
     
                <label for="toWhere">Where are you going?</label>  
                <select id = "toWhere" name = "toWhere">
                    <%
                       for (int i = 0; i < stations.size(); i++)
                       {
                           String s = stations.get(i);
                           String option = String.format("<option value = '%s'>%s</option>",s,s);
                           out.println(option);
                       }
                     
                    %>
                </select>
       
                <input type="submit" value = "COMPUTE FARE" class = "confirmButtons">
                <a href = 'Index' class = "confirmButtons">GO BACK TO MENU</a>
            </form>
                 
        
        </section>
            
       
       
    </body>
</html>
