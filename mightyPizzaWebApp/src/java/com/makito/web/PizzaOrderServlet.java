/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.makito.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
public class PizzaOrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
              HttpSession session = request.getSession();
              
              String name = (String)session.getAttribute("name");
                
                String pname = request.getParameter("pizzaName");
                String desc =request.getParameter("pizzaDescription");
                Double price = Double.parseDouble(request.getParameter("pizzaPrice"));
                
                updateSession(session,pname,price,desc);
                
                 request.setAttribute("pname",pname);
                 request.setAttribute("price",price);
                 request.setAttribute("desc",desc);
                request.setAttribute("name",name);
                 
                 
                   
        RequestDispatcher disp = request.getRequestDispatcher("baseSize.jsp");
        disp.forward(request, response);
                 
                
    }

    private void updateSession(HttpSession session, String pname, Double price,String desc) {
        
       session.setAttribute("pname",pname);
       session.setAttribute("price",price);
       session.setAttribute("desc", desc);
      
       
    }



}
