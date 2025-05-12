<%@page import="com.makito.entities.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>All Orders</title>
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
        table {
            margin: auto;
            width: 90%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        a {
            display: inline-block;
            margin-top: 30px;
            text-align: center;
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
        .center {
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>All Orders</h1>

    <%
        List<Order> list = (List<Order>)request.getAttribute("list");
    %>

    <table>
        <tr>
            <th>Order by</th>
            <th>Pizza</th>
            <th>Description</th>
            <th>Price</th>
            <th>Base</th>
            <th>Size</th>
            <th>Address</th>
            <th>Date</th>
        </tr>
        <%
            for(Order x : list){
        %>
        <tr>
            <td><%= x.getOrderedBy() %></td>
            <td><%= x.getPizzaName() %></td>
            <td><%= x.getDescription() %></td>
            <td>R <%= x.getPrice() %></td>
            <td><%= x.getBase() %></td>
            <td><%= x.getSize() %></td>
            <td><%= x.getAddress() %></td>
            <td><%= x.getDate() %></td>
        </tr>
        <%
            }
        %>
    </table>

    <div class="center">
        <a href="admin.jsp">Back to Menu</a>
    </div>
</body>
</html>
