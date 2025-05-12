/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.makito.web;

import com.makito.bl.PizzaFacadeLocal;
import com.makito.entities.Image;
import com.makito.entities.Pizza;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author USER
 */

@MultipartConfig
public class CreatePizzaServlet extends HttpServlet {

  
   @EJB PizzaFacadeLocal pfl;
     
  @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
        String name = request.getParameter("name");
        String desc= request.getParameter("desc");
        Double price = Double.parseDouble(request.getParameter("price"));
                                                       
        List<Image> images = new ArrayList<>();
        
        //get image as collection
       Collection<Part> parts = request.getParts();
       
      for(Part part: parts){
            
          if(part.getContentType()!= null){
              
              InputStream imagePart = part.getInputStream();
              
              byte[] image_source = convertImageToByte(imagePart);
              
              Image image = new Image(image_source);
              
              images.add(image);
          }
      
      }
      
      Pizza pizza =  new Pizza(name, desc, price, images);
      
      pfl.create(pizza);
      
      
      
      response.sendRedirect("admin.jsp");
    }

    private byte[] convertImageToByte(InputStream inputStream) {
        byte[] imageBlob = null;
        
        ByteArrayOutputStream  baos = new ByteArrayOutputStream();
        
        byte [] buffer = new byte[1024];
        int byteInt = 0;
        
        try {
            while((byteInt = inputStream.read(buffer)) != -1){
                baos.write(buffer,0,byteInt);
                
            }
            
         imageBlob = baos.toByteArray();
            
        } catch (IOException ex) {
            Logger.getLogger(CreatePizzaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return  imageBlob;
    }

 



}
