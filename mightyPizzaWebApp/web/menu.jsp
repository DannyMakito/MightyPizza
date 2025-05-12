<%-- 
    Document   : menu
    Created on : May 11, 2025, 4:41:16 PM
    Author     : USER
--%>

<%@page import="java.util.Base64"%>
<%@page import="com.makito.entities.Image"%>
<%@page import="java.util.List"%>
<%@page import="com.makito.entities.Pizza"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
                <%
                List<Pizza> pizza = (List<Pizza>)request.getAttribute("pizzas");
        
        %>
        
        
        <%
                for(Pizza x: pizza){
            
         %>
        <table>
            <tr>
                <td>Name</td>
                <td><%= x.getName()%></td>
            </tr>
            
            <tr>
                <td>Price</td>
                <td><%=x.getPrice()%></td>
             </tr>
            
            
            <tr>
                <td>Size</td>
                <td><%= x.getDescription()%></td>
            </tr> 
        </table>
            
            <%
                    List<Image> images = x.getImage();
                    
                    for( Image i: images){
                    String img_source ="data:image/png;base64,"+ Base64.getEncoder().encodeToString(i.getImage_source());
            %>
            <img src="<%=img_source%>" width="200px" height="180px" alt="alt"/>

                <%
                    }
                    }
                
                %>           
    
                
                <p><a href="menu.jsp">menu</a></p>
    </body>
</html>
