<%-- 
    Document   : error
    Created on : May 11, 2025, 11:39:47 PM
    Author     : USER
--%>

<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body>
        <% 
              String msg = exception.getMessage();
        %>
        
        <h1><%=msg%></h1>
        <p> <a href="signin.jsp">try again</a></p>
    </body>
</html>
