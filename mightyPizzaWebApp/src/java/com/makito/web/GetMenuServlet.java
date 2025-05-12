/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.makito.web;

import com.makito.bl.PizzaFacadeLocal;
import com.makito.entities.Pizza;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
public class GetMenuServlet extends HttpServlet {

    @EJB PizzaFacadeLocal pfl;
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        List<Pizza> pizzaList= pfl.findAll();
        
        request.setAttribute("pizzas", pizzaList);
        
        
         RequestDispatcher disp = request.getRequestDispatcher("CustomerDash.jsp");
        disp.forward(request, response);
        
        
    }

   
}
