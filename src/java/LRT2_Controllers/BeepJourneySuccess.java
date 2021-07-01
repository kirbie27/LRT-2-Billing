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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
@WebServlet(name = "BeepJourneySuccess", urlPatterns = {"/BeepJourneySuccess"})
public class BeepJourneySuccess extends HttpServlet {

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
        
        
        HttpSession session = request.getSession();
        String CardNumber = (String) session.getAttribute("CardNumber");
      
        
        //getServletContext and the details
        ServletContext sc = request.getServletContext();
        
        String remBalance = (String) sc.getAttribute("remBalance");
          
        String from = (String) sc.getAttribute("fromB");
        String to = (String) sc.getAttribute("toB");
        String fare = (String) sc.getAttribute("fareB");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");  
        LocalDateTime now = LocalDateTime.now();  
        String date = dtf.format(now);
        //get transaction content
        String query1 = "SELECT * FROM LRT_TRANSACTIONS";
        String query2 = "INSERT INTO LRT_TRANSACTIONS VALUES(?,?,?,?,?,?)";
        
        
        String getBeepTransactions = "SELECT TRANSACTION_COST FROM LRT_TRANSACTIONS WHERE CARD_NUMBER = ?";
        String updateCard = "UPDATE BEEP_CARDS SET STORED_VALUE = ?, TOTAL_TRANSACTIONS = ?, TOTAL_EXPENSES = ? WHERE CARD_NUMBER = ?";
        try
        {
            //insert the new transaction
             PreparedStatement ps = conn.prepareStatement(query1);
             ResultSet transactions = ps.executeQuery();
             
             int transactionNumber = 1;
             
             while (transactions.next())
             {
                 transactionNumber += 1;
             }
             
             ps = conn.prepareStatement(query2);
             ps.setString(1, ""+transactionNumber);
             ps.setString(2, CardNumber);
             ps.setString(3, fare);
             ps.setString(4, from);
             ps.setString(5, to);    
             ps.setString(6, date);
             ps.executeUpdate();
             
             
             //update the beep card information (TOTAL_TRANSACTIONS, TOTAL_EXPENSES, STORED_VALUE)
             
    
             ps = conn.prepareStatement(getBeepTransactions);
             ps.setString(1, CardNumber);
             transactions = ps.executeQuery();
             int total_transactions = 0;
             double total_expenses = 0;
             while(transactions.next())
             {
                 //computes the total number of transactions, and computes the total expenses;
                 
                 total_transactions++;
                 total_expenses += Double.valueOf(transactions.getString("TRANSACTION_COST"));
             }
             
             //updates the beep record
             ps = conn.prepareStatement(updateCard);
             ps.setString(1, remBalance);
             ps.setString(2, ""+total_transactions);
             ps.setString(3,""+total_expenses);
             ps.setString(4,CardNumber);
             ps.executeUpdate();

             response.sendRedirect("SJSuccess");
              
        }
        catch(SQLException sqle)
        {
            sqle.printStackTrace();
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
