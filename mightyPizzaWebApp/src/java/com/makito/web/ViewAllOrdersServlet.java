/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.makito.web;

import com.makito.bl.OrderFacadeLocal;
import com.makito.entities.Order;
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
public class ViewAllOrdersServlet extends HttpServlet {

 
  @EJB OrderFacadeLocal ofl;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         List<Order> list = ofl.findAll();
        
        request.setAttribute("list", list);
        
        
        RequestDispatcher disp = request.getRequestDispatcher("viewO.jsp");
        disp.forward(request, response);
       
    }

   

}
