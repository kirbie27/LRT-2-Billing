<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0, text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200&display=swap" rel="stylesheet">
        <title>Session Error</title>
        
        <style>
            
            *
            {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
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
                justify-content: center;
                align-items: center;
                min-height: clamp(300px, 50vh, 400px);
                min-width: clamp(350px, 100vw, 500px);
                background-color: #0A2342;
                border-radius: 40px 0px;
            }
            
            section img
            {
                text-align: center;
                width: 110px;
                height: 100px;
            }
            section div, section button
            {
                background-color: #3F88C5;
                padding: 15px;
                width: 100%;
                border: none;
                color: white;
                border-radius: 10px;
                font-size: clamp(15px,100%, 20px);
                font-weight: 500;
                margin-top: 25px;
              
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
            <div>
                Uh oh, Error Session!
            </div>
            <button onclick="document.location='Index'">Go Back</button>
        </section>
    </body>
</html>
