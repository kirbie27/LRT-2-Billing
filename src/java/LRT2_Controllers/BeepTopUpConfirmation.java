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
@WebServlet(name = "BeepTopUpConfirmation", urlPatterns = {"/BeepTopUpConfirmation"})
public class BeepTopUpConfirmation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServletContext sc = request.getServletContext();
        HttpSession session = request.getSession();
        String currentBal = (String) sc.getAttribute("balanceT");
        String amount = request.getParameter("amount");
        
        double currentBalD = Double.valueOf(currentBal);
        double amountD = 0;
        
        boolean isNumber = checkNumber(amount);
        
        if (isNumber)
        {
            amountD = Double.valueOf(amount);
        }
        
        String errorTopUp = "";
        if (!isNumber)
        {
            errorTopUp = "Please Enter a valid Number";
        }
        else if (amountD < 5)
        {
            errorTopUp = "Invalid Amount! Minimum Top Up is 5 php";
        }
        else
        {
            
            String afterBalance = ""+(currentBalD + amountD);
            
            sc.setAttribute("openTopUp", "flex");
            sc.setAttribute("amount", amount);
            sc.setAttribute("afterBalance", afterBalance);
        }
  

        sc.setAttribute("errorTopUp", errorTopUp);
        response.sendRedirect("BeepTopUp");
        
        
     
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
