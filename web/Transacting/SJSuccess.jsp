<%-- 
    Document   : index
    Created on : 06 18, 21, 11:49:21 PM
    Author     : Kirby Wenceslao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0, text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200&display=swap" rel="stylesheet">
        <title>Thank you!</title>
        
        <style>
            
            *
            {
                font-family: 'Poppins', sans-serif;
            }
            body
            {
                display: flex;     
                text-align: center;
                height: 100vh;
                width: 100%;
                justify-content: center;
                align-items: center;
                background-color: rgb(247, 240, 245);
       
            }
            
            section
            {
                box-sizing: border-box;
                display: flex;
                padding: 15px;
                flex-direction: column;
                justify-content: space-around;
                align-items: center;
                min-height: clamp(400px, 50vh, 500vh);
                min-width: clamp(350px, 100vw, 500px);
                background-color: #0A2342;
                border-radius: 40px 0px;
            }
            
            section img
            {
                text-align: center;
                width: 50px;
                height: 40px;
            }
            section div, section button
            {
                background-color: #3F88C5;
                padding: 25px;
                width: 100%;
                border: none;
                color: white;
                border-radius: 10px;
                font-size: clamp(15px,100%, 20px);
                font-weight: 500;
              
            }
            
            section button
            {
                cursor: pointer;
            }
            
            section button:hover
            {
                transition: linear 0.2s;
                background-color: #FFA647;
                color: #0A2342;
                font-weight: bold;
                
            }
            section div
            {
                padding: 0px;
                background-color: transparent;
                font-size: clamp(40px,100%, 50px) !important;
                border-radius: 0px;
            }
            
            section hr
            {
                width: 100%;
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
                    
                }
                
                section button
                {
                    padding: 25px;
                    border-radius: 0px;
                }
                
                section div
                {
        
                    font-size: clamp(30px,100vw, 33px) !important;
  
                }
                
            }
        </style>
    </head>
    <body>
        <section>
            <img src ="Assets/Pictures/LOGO.png">
            <hr>
            <div>
                Thank you for using the LRT2 Transaction Portal!
            </div>
            <hr>
            <a href = 'Index' class = "confirmButtons">GO BACK TO MENU</a>
        </section>
    </body>
</html>
