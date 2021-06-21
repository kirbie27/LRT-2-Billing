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
        <title>Transaction Portal</title>
        
        <style>
            
            *
            {
                margin: 0;
                padding: 0;
            }
            
            body
            {
                height: 100%;
                width: 100%;
                padding: 0px;
            }
            
            
            #paymentModal
            {
                position: fixed; /* Stay in place */
                display: none;
                min-height: 100%;
                min-width: 100%;
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                -webkit-animation-name: fadeIn; /* Fade in the background */
                -webkit-animation-duration: 0.4s;
                animation-name: fadeIn;
                animation-duration: 0.4s
             
            }

            .mContent
            {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                -webkit-animation-name: slideIn;
                -webkit-animation-duration: 0.4s;
                animation-name: slideIn;
                animation-duration: 0.4s;
                height: 500px;
                width: 500px;
                background-color: white;
                border: 5px solid black;
            }

            .close
            {
              position: absolute;
              color: black;
              float: right;
              font-size: 28px;
              font-weight: bold;
              right: 10px;
            }
        </style>
        
        <script>
    
            function openModal()
            {
                var modal = document.getElementById("paymentModal");
                modal.style.display = "block";
                
            }
            
            function closeModal()
            {
                
                var modal = document.getElementById("paymentModal");
                modal.style.display = "none";
            }
            
            window.onclick = function(event) 
            {
                var modal = document.getElementById("paymentModal");
                if (event.target == modal) 
                {
                  modal.style.display = "none";
                }
            }
 
        </script>
    </head>
    <body>
         
        
        <div id = "paymentModal" class = "modal">
            <form class ="mContent">
                <span onclick = "closeModal()" class ="close">&times;</span>
                <h3>Confirm your transaction!</h3>
                <br>
                <hr>
                <%
                  ServletContext sc = getServletContext(); 
                  String from = (String) sc.getAttribute("from");
                  String to = (String) sc.getAttribute("to");
                  String fare = (String) sc.getAttribute("fare");
                  
                  out.println("You are here: "+ from+"<br>");  
                  out.println("Your destination: "+ to+"<br>"); 
                  out.println("Your fare: "+ fare+"<br>"); 
                %>
                <br>
                <input type="submit" value ="Confirm Transaction">
            </form>
        </div>    
        
        <section>
            <h1>
                LRT2 TRANSACTION PORTAL
            </h1>
            <a onclick = openModal()>TEST OPEN</a>   
            
            <form method = "POST" action = "ConfirmTravel">
                <label for="fromWhere">Where are you right now?</label>  
                <select id = "fromWhere" name = "fromWhere">
                    <%
                      
                       Lrt2Stations data = (Lrt2Stations) sc.getAttribute("stations"); 
                       ArrayList<String> stations = data.getStations();
                       
                       for (int i = 0; i < stations.size(); i++)
                       {
                           String s = stations.get(i);
                           String option = String.format("<option value = %s>%s</option>",s,s);
                           out.println(option);
                       }
                    %>
                </select>
                <br>
                <label for="toWhere">Where are you going?</label>  
                <select id = "toWhere" name = "toWhere">
                    <%
                       for (int i = 0; i < stations.size(); i++)
                       {
                           String s = stations.get(i);
                           String option = String.format("<option value = %s>%s</option>",s,s);
                           out.println(option);
                       }
                     
                    %>
                </select>
                <br>
                <input type="submit" value = "COMPUTE FARE">
            </form>
                  
            <%
                if(sc.getAttribute("confirm") != null)
                {
                    out.println("<p>"+(String)sc.getAttribute("confirm")+"</p>");
                    sc.removeAttribute("confirm");
                }
            %>
            <button onclick=onclick="document.location='Index'">GO BACK TO MENU</button>
            
        </section>
            
       
       
    </body>
</html>
