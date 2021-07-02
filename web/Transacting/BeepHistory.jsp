<%
    session = request.getSession(false);
    if (session.getAttribute("CardNumber") == null)
    {
        response.sendRedirect("Index");
    }
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="LRT2_Models.Lrt2Stations, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0, text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200&display=swap" rel="stylesheet">
        <title>Beep Travel History</title>
        
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
                height: 480px;
                width: 100%;
                display: flex;
                flex-direction: column;
                justify-content: space-around;
                
            }
            
            #list
            {
                display: flex;
                min-height: 300px;
                max-height: 300px;
               
                flex-direction: column;
                overflow-y: auto;
                flex-wrap: no-wrap;
             
            }
            
            .transactions
            {
                background-color: #EED3EA;
                text-align: center;
                font-size: clamp(10px,100%,15px);
                padding: 5px;
                min-height: 30px;
                margin: 5px;
                display: flex;
                justify-content: center;
                align-items: center;
                
            }
            
            .transactions:hover
            {
                cursor: pointer;
                background-color: pink;
                transition: linear 0.3s;
                   
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

            
            section img
            {
            
                width: 50px;
                height: 40px;
                margin: 5px;
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
                    height: 80vh !important;
                    width: 100vh !important;
                    
                }
                
                
                section
                {
                    box-shadow: 0px 3px #FFA647 !important;
                }
                
                #list
                {
                    padding: 0px;
                    min-height: 30vh;
                    max-height: 30vh;
                }
                .transactions
                {
                    text-align: center;
                    font-size: clamp(10px,100%,11px);      
                    min-height: 25px;
                   
                    
                }
                
                .confirmButtons
                {
                    font-size: 15px;
                    
                }
                
               
            }
        </style>
        
    </head>
    <body>

        <%
            ServletContext sc = getServletContext();
            String totalTransactions = "";
            String totalExpenses = "";
            ResultSet transactions = null;
            
            if(sc.getAttribute("totalTransactions") != null)
            {
                totalTransactions = (String)sc.getAttribute("totalTransactions");
            }
            
            if(sc.getAttribute("totalExpenses") != null)
            {
                totalExpenses = (String) sc.getAttribute("totalExpenses");
            }
            
            if(sc.getAttribute("transactions") != null)
            {
               transactions = (ResultSet) sc.getAttribute("transactions");
            }
            
        %>
  
        
        <section>
            <img src ="Assets/Pictures/LOGO.png">
            <h1>
                LRT2 Beep Transaction History
            </h1>
            
            <form method = "POST" action = "">         
                
                <p>Total Transactions: <%= totalTransactions %> </p>
                <p>Total Expenses: <%= totalExpenses %> Php</p>
                
                <label>Transaction History</label> 
                <hr>
                <div id = "list">
                    <%
                        if (totalTransactions.equals("0"))
                        {
                            String s = String.format("<div class = 'transactions'>%s</div>","No Transactions Yet.");
                            out.println(s);
                        }
                        else
                        {
                            int transactionCount = Integer.valueOf(totalTransactions);
                            for (int i = 1; i <= transactionCount; i++)
                            {
                                transactions.next();
                                String info = String.format("%s | From: %s | To: %s | Fare: %s", transactions.getString("TRANSACTION_DATE"),
                                        transactions.getString("FROM_WHERE"), transactions.getString("TO_WHERE"), transactions.getString("TRANSACTION_COST"));
                                String s = String.format("<div class = 'transactions'>%s</div>",info);
                                
                                out.println(s);
                            }
                        }
                        
                    %>
                   
            
                </div>
                <hr>
                <a href = 'BeepMenu' class = "confirmButtons">Go Back To Beep Menu</a>
            </form>
                 
        
        </section>
            
       
       
    </body>
</html>
