<%@page import="com.makito.entities.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            padding: 50px;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #28a745;
            margin-bottom: 40px;
        }

        table {
            width: 80%;
            margin: 0 auto 30px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            display: block;
            width: fit-content;
            margin: 0 auto;
            padding: 10px 20px;
            background-color: #dc3545;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <h1>Thanks for shopping with us! 🍕</h1>
    <h2 style="text-align:center;">Your order will be delivered within the next 30 minutes.</h2>

    <%
        Order o = (Order) request.getAttribute("order");
    %>

    <table>
        <tr>
            <th>Order By</th>
            <th>Pizza</th>
            <th>Description</th>
            <th>Base</th>
            <th>Size</th>
            <th>Price</th>
            <th>Address</th>
        </tr>
        <tr>
            <td><%= o.getOrderedBy() %></td>
            <td><%= o.getPizzaName() %></td>
            <td><%= o.getDescription() %></td>
            <td><%= o.getBase() %></td>
            <td><%= o.getSize() %></td>
            <td>R <%= o.getPrice() %></td>
            <td><%= o.getAddress() %></td>
        </tr>
    </table>

    <a href="End.do">Logout</a>
</body>
</html>
