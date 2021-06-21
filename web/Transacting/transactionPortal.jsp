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
            
        </style>
    </head>
    <body>
        <section>
            <h1>
                LRT2 TRANSACTION PORTAL
            </h1>
            <form>
                <label for="fromWhere">Where are you right now?</label>  
                <select id = "fromWhere" name = "fromWhere">
                    <%
                       Lrt2Stations data = (Lrt2Stations) getServletContext().getAttribute("stations");  
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
            </form>
            <a href='Index'>Go Back!</a>
            
        </section>
       
    </body>
</html>
