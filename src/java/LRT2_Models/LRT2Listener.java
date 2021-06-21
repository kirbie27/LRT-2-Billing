/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LRT2_Models;

import javax.servlet.*;

/**
 *
 * @author Kirby Wenceslao
 */
public class LRT2Listener implements ServletContextListener
{

    @Override
    public void contextInitialized(ServletContextEvent event) 
    {
        ServletContext sc = event.getServletContext();
        
        Lrt2Stations stations = new Lrt2Stations();
        sc.setAttribute("stations", stations);
  
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) 
    {
        //nothing
    }
    
}
