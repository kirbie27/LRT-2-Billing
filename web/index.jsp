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
        <title>Welcome to LRT-2</title>
        
        <style>
            
            *
            {
                font-family: sans-serif;
            }
            body
            {
                display: flex;     
                text-align: center;
                height: 100vh;
                justify-content: center;
                align-items: center;
                background-color: rgb(247, 240, 245);
            }
            
            section
            {
                display: flex;
                padding: 15px;
                flex-direction: column;
                justify-content: space-around;
                min-height: clamp(400px, 50vh, 500vh);
                min-width: clamp(350px, 100vw, 500px);
                background-color: #0A2342;
                border-radius: 40px 0px;
            }
           
            section div, section button
            {
                background-color: #3F88C5;
                padding: 25px;
                border: none;
                color: white;
                border-radius: 10px;
                font-size: clamp(15px,100%, 20px);
                font-weight: 500;
                font-family: sans-serif;
              
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
        </style>
    </head>
    <body>
        <section>
            <div>
                What are you here for?
            </div>
            <button onclick="document.location='LRT2Portal'">Single Journey Travel</button>
            <button onclick="document.location='BeepLogin'">I want to travel using my BEEP Card</button>
            <button onclick="document.location='BeepRegister'">I want to apply for a BEEP Card</button>
        </section>
    </body>
</html>
