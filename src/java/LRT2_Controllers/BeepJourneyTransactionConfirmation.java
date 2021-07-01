/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LRT2_Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kirby Wenceslao
 */
@WebServlet(name = "BeepJourneyTransactionConfirmation", urlPatterns = {"/BeepJourneyTransactionConfirmation"})
public class BeepJourneyTransactionConfirmation extends HttpServlet {

    Connection conn;
     
    public void init(ServletConfig config) throws ServletException 
    {
        super.init(config);
        try 
        {	
            Class.forName(config.getInitParameter("jdbcClassName"));
            //System.out.println("jdbcClassName: " + config.getInitParameter("jdbcClassName"));
            //creates the url for database
            String dbusername = config.getInitParameter("dbUserName");
            String dbpassword = config.getInitParameter("dbPassword");
            StringBuffer url = new StringBuffer(config.getInitParameter("jdbcDriverURL"))
                    .append("://")
                    .append(config.getInitParameter("dbHostName"))
                    .append(":")
                    .append(config.getInitParameter("dbPort"))
                    .append("/")
                    .append(config.getInitParameter("databaseName"));
            conn =  DriverManager.getConnection(url.toString(),dbusername, dbpassword);
        } 
        catch (SQLException sqle)
        {
            System.out.println("SQLException error occured - " + sqle.getMessage());
        } 
        catch (ClassNotFoundException nfe)
        {
            System.out.println("ClassNotFoundException error occured - " + nfe.getMessage());
        }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get card number from session
        
        HttpSession session = request.getSession();
        String CardNumber = (String) session.getAttribute("CardNumber");
        
        //get parameters
        ServletContext sc = request.getServletContext();
        String from = request.getParameter("fromWhereB");
        String to = request.getParameter("toWhereB");

        //setup other queries and flags
        String valid = "true";
        String findStoredValue = "SELECT STORED_VALUE FROM BEEP_CARDS where CARD_NUMBER = ?";
        String findFare = "SELECT FARE FROM STORED_VALUE_FARES where FROM_WHERE = ? and TO_WHERE = ?";
        
        try
        {
            //get stored value
            PreparedStatement ps = conn.prepareStatement(findStoredValue);
            ps.setString(1, CardNumber);
            ResultSet results = ps.executeQuery();
            results.next();
            String balance = results.getString("STORED_VALUE");
            double balanceD = Double.valueOf(balance);
            String remBalance = balance;
            //get fare
            
            ps = conn.prepareStatement(findFare);
            ps.setString(1, from);
            ps.setString(2, to);
            results = ps.executeQuery();

            String fare = "";
            if(results.next())
            {
                //valid destinations
                fare = results.getString("FARE");
                double fareD = Double.valueOf(fare);
                
                double remainingBalance = balanceD - fareD;
                remBalance = ""+remainingBalance;
                if (remainingBalance < 0)
                {
                    //not enough balance
                    remBalance = "Insufficient Balance";
                    valid = "false";
                }
            }
            else
            {
                //invalid destinations
                fare = "Invalid Transaction";
                valid = "false";
            }
             sc.setAttribute("balance", balance);
             sc.setAttribute("remBalance", remBalance);
             sc.setAttribute("fromB",from);
             sc.setAttribute("toB",to);
             sc.setAttribute("fareB",fare);
             sc.setAttribute("openB", "flex");

            sc.setAttribute("validB",valid);        
            response.sendRedirect("BeepLRT2Portal");
        
        }
        catch(SQLException sqle)
        {
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
