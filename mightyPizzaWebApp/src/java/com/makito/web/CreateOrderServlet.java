/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.makito.web;

import com.makito.bl.OrderFacadeLocal;
import com.makito.entities.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.ejb.EJB;
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
public class CreateOrderServlet extends HttpServlet {

 @EJB OrderFacadeLocal ofl;
   

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
              HttpSession session = request.getSession();
              
              String name = (String)session.getAttribute("name");
              String pname = (String)session.getAttribute("pname");
              String desc= (String)session.getAttribute("desc");
              
              
                String base = request.getParameter("base");
                String size =request.getParameter("size");
               String address =request.getParameter("address");
               Double price =(Double)session.getAttribute("price");
               
              Double total = ofl.totalPrice(price, size);
                
              
              Order order = createOrder(name,pname,base,size,address,total,desc);
              ofl.create(order);
          
              request.setAttribute("order",order);
              
                 
                 
                   
        RequestDispatcher disp = request.getRequestDispatcher("confirm.jsp");
        disp.forward(request, response);
                 
                
    }

    private Order createOrder(String name, String pname, String base, String size, String address, Double total, String desc) {
       Order o= new Order();
       
       o.setAddress(address);
       o.setBase(base);
       o.setSize(size);
       o.setPrice(total);
       o.setDescription(desc);
       o.setDate(new Date());
       o.setPizzaName(pname);
       o.setOrderedBy(name);
       
       return o;
    }

}
