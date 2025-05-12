<%@page import="java.util.Base64"%>
<%@page import="com.makito.entities.Image"%>
<%@page import="com.makito.entities.Pizza"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>All Pizzas</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            padding: 40px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        .pizza-card {
            width: 90%;
            max-width: 800px;
            margin: 20px auto;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            padding: 20px;
        }
        .pizza-card table {
            width: 100%;
            border-collapse: collapse;
        }
        .pizza-card th, .pizza-card td {
            padding: 10px;
            text-align: left;
        }
        .pizza-card th {
            background-color: #007bff;
            color: white;
            border-radius: 5px;
        }
        .pizza-card td {
            border-bottom: 1px solid #ddd;
        }
        .pizza-image {
            text-align: center;
            margin-top: 15px;
        }
        .pizza-image img {
            width: 200px;
            height: 180px;
            border-radius: 8px;
            border: 2px solid #ddd;
        }
        a {
            display: block;
            width: fit-content;
            margin: 30px auto 0;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            padding: 10px 20px;
            border: 2px solid #007bff;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        a:hover {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <h1>All Pizzas</h1>

    <%
        List<Pizza> pizzas = (List<Pizza>) request.getAttribute("pizzas");
        for (Pizza x : pizzas) {
    %>

    <div class="pizza-card">
        <table>
            <tr>
                <th>Pizza</th>
                <td><%= x.getName() %></td>
            </tr>
            <tr>
                <th>Description</th>
                <td><%= x.getDescription() %></td>
            </tr>
            <tr>
                <th>Price</th>
                <td>R <%= x.getPrice() %></td>
            </tr>
        </table>
        <div class="pizza-image">
            <%
                List<Image> images = x.getImage();
                for (Image i : images) {
                    String img_source = "data:image/png;base64," + Base64.getEncoder().encodeToString(i.getImage_source());
            %>
                <img src="<%= img_source %>" alt="Pizza Image" />
            <%
                }
            %>
        </div>
    </div>

    <%
        }
    %>

    <a href="admin.jsp">Back to Menu</a>
</body>
</html>
