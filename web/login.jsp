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
        <title>Login Page</title>
        
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
                background-color: #F7F0F5;
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
                box-shadow: 5px 5px #FFA647;
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
            
            #error
            {
                text-align: center;
                font-weight: bold;
                color: #FFB05C;
                text-transform: uppercase;
                font-size: 15px;
            }
            
            .text
            {
                border: 2px solid black;
                font-size: 18px;
                padding: 10px;
                font-weight: bold;
            }
            .loginButtons
            {
                text-align: center;
                background-color: #3F88C5;
                text-decoration: none;
                border: none;
                font-size: 20px;
                color: white;
                cursor: pointer;
                padding: 8px;
                border-radius: 5px;
                
            }
            
            .loginButtons:hover
            {
                transition: linear 0.1s;
                background-color: #FF890A;
                font-weight: 900;
            }
            
            h3
            {
                font-size: clamp(25px,100%, 30px);
                padding: 10px;
               
            }

            
            section img
            {  
                width: 50px;
                height: 40px;
                margin: 5px;
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
                
                section
                {
                    border-radius: 0px;
                    height: 70vh !important;
                    width: 100vh !important;
                    box-shadow: 0px 3px #FFA647 !important;
                   
                }
                
            }
        </style>
        <script>
            function scanMessage()
            {
                alert("Sorry! This feature is not yet available.");
            }
        </script>
        
    </head>
    <body>
        <%
             ServletContext sc = getServletContext(); 
             String errorMessage = "";
             
             if (sc.getAttribute("errorMessage") != null)
             {
                 errorMessage = (String) sc.getAttribute("errorMessage");
                 sc.removeAttribute("errorMessage");
             }
        %>
          
        
        <section>
            <img src ="Assets/Pictures/LOGO.png">
            <h1>
                LRT2 BEEP LOGIN
            </h1>
            
            <form method = "POST" action = "ConfirmBeepCard">
                <label for="unameL">Beep Card Number:</label>  
                <input name="unameL" type ="text" placeholder="Enter Card Number here" required>
     
                <label for="pwordL">Beep Card Password:</label>  
                <input name="pwordL" type ="password" placeholder="Enter Card Password here" required>
                <p id = "error"><%= errorMessage%></p>
                <hr>   

                
                <input type="submit" value = "Login" class = "loginButtons">
                <a onclick=scanMessage() class = "loginButtons">Scan Beep Card (alternative)</a>
                <a href = 'Index' class = "loginButtons">Go Back To Menu</a>
            </form>
                 
        
        </section>
            
       
       
    </body>
</html>
