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
                padding: 5px;
                font-weight: bold;
            }
            
            #note
            {
                text-align: justify;
                border: none;
                font-size: 15px;
               
            }
            
            #noteHeading
            {
                 padding: 0;
                font-size: 15px;
                text-align: center;
                border: none;
                 
            }
            .RegisterButtons
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
            
            .RegisterButtons:hover
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
            
            #error
            {
                text-align: center;
                font-weight: bold;
                color: #FFB05C;
                font-size: 15px;
            }
            
            form input
            {
                padding: 5px;
                font-size: 20px;
                font-weight:  500;
                
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
                
                #note
                {
                    font-size: 10px;
                }

                #noteHeading
                {
                    font-size: 10px;
                }
                
                #error
                {
                    font-size: 12px;
                }
               
            }
        </style>
        
        <script>
            function closeModal()
            {
                
                var modal = document.getElementById("transactionModal");
                modal.style.display = "none";
            }
            
 
        </script>
    </head>
    <body>
        <%
             ServletContext sc = getServletContext(); 
             String open = "none";
             String errorMessage = "";
             
             if (sc.getAttribute("errorMessageR")!= null)
             {
                 errorMessage = (String) sc.getAttribute("errorMessageR");
                 sc.removeAttribute("errorMessageR");        
             }
             
             if (sc.getAttribute("openR") != null)
             {
                 open = (String) sc.getAttribute("openR");
                 sc.removeAttribute("openR");
             }
        %>
        
        <div id = "transactionModal" class = "modal"  style = <% out.println(String.format("\"display: %s;\"",open)); %> >
            <form class ="mContent" action ="BeepRegistrationConfirmation" method = "POST">
                <h3>Registration Summary</h3>
                <hr>
                <%
                 
                  String fName = (String) sc.getAttribute("firstName");
                  String lName = (String) sc.getAttribute("lastName");
                  String cNumber = (String) sc.getAttribute("contactNumber");
                  String cardNumber = (String) sc.getAttribute("cardNumber");
                  String cardPass = (String) sc.getAttribute("cardPass");
                  String valid = "";

                  out.println("<p class = 'text'>First Name: "+ fName+"</p>");  
                  out.println("<p class = 'text'>Last Name: "+ lName+"</p>"); 
                  out.println("<p class = 'text'>Contact Number: "+ cNumber+"</p>"); 
                  out.println("<p class = 'text'>Card Number: "+ cardNumber+"</p>"); 
                  out.println("<p class = 'text'>Card Password: "+ cardPass+"</p>"); 
                  out.println("<p class = 'text'>Initial Balance: "+ 100+"</p>"); 
                  out.println("<p class = 'text' id = 'noteHeading'>Note:</p>"); 
                  out.println("<p class = 'text' id = 'note'>Card Number, Card Password, and Initial Balance are auto generated by the system.<br>Please take note of the details before confirming the registration.</p>");
                %>
                
                <input class = "summaryButtons" type="submit" value ="Confirm Registration">
                <a class = "summaryButtons" href = "" onclick = "closeModal()">Cancel Registration</a>
            </form>
              
        </div>    
        
        <section>
            <img src ="Assets/Pictures/LOGO.png">
            <h1>
                LRT2 BEEP REGISTER
            </h1>
            
            <form method = "POST" action = "BeepRegistration">
                
                <label for="fName">First Name:</label>  
                <input name="fName" type ="text" placeholder="Enter your First Name here" required>
     
                <label for="lName">Last Name:</label>  
                <input name="lName" type ="text" placeholder="Enter your Last Name here" required>
                
                <label for="cNumber">Contact Number</label>  
                <input name="cNumber" type ="text" placeholder="Enter your Contact Number here" required>
               
                <p id = "error"><%= errorMessage%></p>
                <hr>   
                <input type="submit" value = "Register" class = "RegisterButtons">
                <a href = 'Index' class = "RegisterButtons">Go Back To Menu</a>
                
            </form>
                 
        
        </section>
    </body>
</html>
