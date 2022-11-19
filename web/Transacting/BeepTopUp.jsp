<%
    session = request.getSession(false);
    if (session.getAttribute("CardNumber") == null)
    {
        response.sendRedirect("Index");
    }
%>

<%@page import="LRT2_Models.Lrt2Stations, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0, text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200&display=swap" rel="stylesheet">
        <title>Top Up</title>
        
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
                 background-color: #0A2342;
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
                background-color: rgb(247, 240, 245);
                border-radius: 40px 0px;
                box-shadow: 5px 5px bisque;
                color: black;
                align-items: center;
                
               
            }
            
            body section h1
            {
                text-align: center;
            }
            body section form 
            {
                box-sizing: border-box;
                height: 300px;
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
            #amount
            {
                font-size: 20px;
                padding: 10px;
                
       
            }
            .confirmButtons
            {
                text-align: center;
                background-color: #D08AC8;
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
                background-color: #FFA647;
                 color: #0A2342;
                font-weight: bold;
   
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
            
            #err
            {
                text-align: center;
                font-weight: bold;
                color: A23F93;
            }
            section img
            {
            
                width: 50px;
                height: 40px;
                margin: 5px;
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
                   background-color: rgb(247, 240, 245);
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
            
        </script>
    </head>
    <body>
        <%
             ServletContext sc = getServletContext(); 
             String balanceT = "INVALID";
             String amount = "";
             String afterBalance = "";
             String errorTopUp = "";
             
             if(sc.getAttribute("amount") != null)
             {
                 amount = (String) sc.getAttribute("amount");
             }
             
             if(sc.getAttribute("afterBalance") != null)
             {
                 afterBalance = (String) sc.getAttribute("afterBalance");
             }
             
             if(sc.getAttribute("errorTopUp") != null)
             {
                errorTopUp = (String) sc.getAttribute("errorTopUp");
             }
             
             if(sc.getAttribute("balanceT") != null)
             {
                 balanceT = (String) sc.getAttribute("balanceT");
             }
             
             String open = "none";
             
             if (sc.getAttribute("openTopUp") != null)
             {
                 open = (String) sc.getAttribute("openTopUp");
                 sc.removeAttribute("openTopUp");
             }
        %>
        
        <div id = "transactionModal" class = "modal"  style = <% out.println(String.format("\"display: %s;\"",open)); %> >
            <form class ="mContent" action ="BeepTopUpSuccess" method = "POST">
                <h3>Transaction Summary</h3>
                <hr>
                <%
       
                  out.println("<p class = 'text'>Current Balance: "+balanceT+"</p>");  
                  out.println("<p class = 'text'>Amount to Top Up: "+amount+"</p>"); 
                  out.println("<p class = 'text'>Balance after Top Up: "+ afterBalance+"</p>"); 

                %>
                

                <input class = "summaryButtons" type="submit" value ="Confirm Top Up">
                <a class = "summaryButtons" href = "" onclick = "closeModal()">Cancel Top Up</a>
            </form>
              
        </div>    
        
        <section>
            <img src ="Assets/Pictures/LOGO.png">
            <h1>
                LRT2 Beep Top Up
            </h1>
            
            <form method = "POST" action = "BeepTopUpConfirmation">
                 <label for="current">Current Balance: <%= balanceT%></label>  
                <label for="amount">How much do you want to Top Up? (Minimum of 5 Php)</label>  
                
                <input id = "amount" name = "amount" type ="text" placeholder = "Enter amount to Top Up" required>
                <p id = "err"><%= errorTopUp %>
                <hr>
                <input type="submit" value = "Top Up" class = "confirmButtons">
                <a href = 'BeepMenu' class = "confirmButtons">Go Back To Beep Menu</a>
            </form>
        </section>
            
       
       
    </body>
</html>
