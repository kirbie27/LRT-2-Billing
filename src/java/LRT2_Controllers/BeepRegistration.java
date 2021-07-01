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


public class BeepRegistration extends HttpServlet {

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
            throws ServletException, IOException 
    {
        
        

        //get registration inputs
        
        String firstName = request.getParameter("fName").trim();
        String lastName = request.getParameter("lName").trim();
        String contactNumber = request.getParameter("cNumber").trim();
        

        
        String query1 = "SELECT * FROM BEEP_CARDS where CONTACT_NUMBER = ?";
        String query2 = "SELECT * FROM BEEP_CARDS";
        
        try
        {
            ServletContext sc = request.getServletContext();
            
            
            PreparedStatement ps = conn.prepareStatement(query1);
            ps.setString(1,contactNumber);

            
            ResultSet registrationResults = ps.executeQuery();
            
            if(!checkNumber(contactNumber))
            {
                sc.setAttribute("errorMessageR","Please enter a valid Contact Number");
                response.sendRedirect("BeepRegister"); 
            }
            else if (registrationResults.next())
            {
                //user already exists
                sc.setAttribute("errorMessageR","Contact number already exists<br>Please contact an LRT2 staff for assistance");
                response.sendRedirect("BeepRegister");
            }
            else
            {
                ps = conn.prepareStatement(query2);
                ResultSet beepResults = ps.executeQuery();
                
                int beepCardNumber = 1;
                
                while(beepResults.next())
                {
                    beepCardNumber += 1;
                }
                
                String cardPass = generatePassword();
                sc.setAttribute("openR","flex");
                sc.setAttribute("firstName",firstName);
                sc.setAttribute("lastName", lastName);
                sc.setAttribute("contactNumber", contactNumber);
                sc.setAttribute("cardNumber", String.valueOf(beepCardNumber));
                sc.setAttribute("cardPass", cardPass);
                response.sendRedirect("BeepRegister");
            }
             
            
              
        }
        catch(SQLException sqle)
        {
            sqle.printStackTrace();
        }
        
       
                
        
   
    }
    
    private String generatePassword()
    {
        StringBuilder s = new StringBuilder(5);
        String set = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        
       
        for (int i = 0; i < 5; i++)
        {
            int rand = (int)(Math.random()*((set.length()-1)-0+1)+0);  
            s.append(set.charAt(rand));
        }
        
        return s.toString();
        
    }
    private boolean checkNumber(String s)
    {
        for (int i = 0; i < s.length(); i++)
        {
            char c = s.charAt(i);
            if (!(Character.isDigit(c)))
                return false;
        }
        
        return true;
        
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
