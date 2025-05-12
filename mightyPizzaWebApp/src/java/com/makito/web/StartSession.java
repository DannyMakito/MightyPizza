/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.makito.web;

import com.makito.bl.PizzaFacadeLocal;
import com.makito.bl.UsersFacadeLocal;
import com.makito.entities.Pizza;
import com.makito.entities.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
public class StartSession extends HttpServlet {

    @EJB UsersFacadeLocal ufl;
    @EJB PizzaFacadeLocal pfl;
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
        
        HttpSession session = request.getSession(true);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
       String op = request.getParameter("sign");
        
        String url = " ";
        
      // Boolean vf = ufl.validUser(username,password);
          
      
      
  
        if(username.equals("admin") && password.equals("admin1")){
                url = "admin.jsp";
        }
        else{
           Users user = createUser(username,password);
            ufl.create(user);
         
             List<Pizza> pizzaList= pfl.findAll();
            request.setAttribute("pizzas", pizzaList);
            url = "CustomerDash.jsp";
            initalizeSession(session, username);
        }
   
        RequestDispatcher disp = request.getRequestDispatcher(url);
        disp.forward(request, response);
        
        
    }

    private void initalizeSession(HttpSession session ,String username) {
        
        Double price = 00.00;
        String pname = "";
        String base = "";
        String size ="";
       String desc ="";
       
       session.setAttribute("name",username);
       
        session.setAttribute("", base);
        session.setAttribute("",pname);
        session.setAttribute("00.00",price);
        session.setAttribute("", size);
        session.setAttribute("", desc);
    }

    private Users createUser(String username, String password) {
       Users u = new Users();
       
       u.setUsername(username);
       u.setPassword(password);   
       return u;
    }

   
}
