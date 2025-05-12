<%@page import="java.util.Base64"%>
<%@page import="com.makito.entities.Image"%>
<%@page import="com.makito.entities.Pizza"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Pizza Selection</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 40px;
            color: #333;
        }

        h1, h2 {
            text-align: center;
            color: #222;
        }

        h2 b {
            color: #007bff;
        }

        #pizzaList {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .pizza {
            background-color: white;
            border-radius: 10px;
            border: 1px solid #ccc;
            width: 300px;
            padding: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .pizza:hover {
            transform: scale(1.03);
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
        }

        .pizza img {
            display: block;
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
        }

        .pizza h3 {
            margin: 0 0 5px;
            color: #444;
        }

        .pizza h4 {
            margin: 0 0 10px;
            font-weight: normal;
            color: #666;
        }

        .pizza p {
            font-weight: bold;
            color: #28a745;
        }

        form {
            display: none;
        }
    </style>
</head>
<body>

<% String name = (String) session.getAttribute("name"); %>
<h1>Pizza Menu</h1>
<h2><b><%= name %></b>, select your pizza</h2>

<div id="pizzaList">
<%
    List<Pizza> pizzas = (List<Pizza>) request.getAttribute("pizzas");
    if (pizzas != null) {
        for (Pizza pizza : pizzas) {
%>
    <div class="pizza"
         data-id="<%= pizza.getId() %>"
         data-name="<%= pizza.getName() %>"
         data-description="<%= pizza.getDescription() %>"
         data-price="<%= pizza.getPrice() %>"
         onclick="selectPizza(this)">
        <%
            List<Image> images = pizza.getImage();
            if (images != null && !images.isEmpty()) {
                for (Image img : images) {
                    String base64 = Base64.getEncoder().encodeToString(img.getImage_source());
        %>
            <img src="data:image/png;base64,<%= base64 %>" alt="Pizza Image"/>
        <%
                    break; // Show only the first image per pizza
                }
            }
        %>
        <h3><%= pizza.getName() %></h3>
        <h4><%= pizza.getDescription() %></h4>
        <p>Price: R<%= pizza.getPrice() %></p>
    </div>
<%
        }
    } else {
%>
    <p style="text-align:center;">No pizzas available.</p>
<%
    }
%>
</div>

<form id="pizzaForm" method="post" action="PizzaOrderServlet.do">
    <input type="hidden" name="pizzaId" id="pizzaId">
    <input type="hidden" name="pizzaName" id="pizzaName">
    <input type="hidden" name="pizzaDescription" id="pizzaDescription">
    <input type="hidden" name="pizzaPrice" id="pizzaPrice">
</form>

<script>
function selectPizza(element) {
    document.getElementById("pizzaId").value = element.dataset.id;
    document.getElementById("pizzaName").value = element.dataset.name;
    document.getElementById("pizzaDescription").value = element.dataset.description;
    document.getElementById("pizzaPrice").value = element.dataset.price;

    if (confirm(`Order "${element.dataset.name}" for R${element.dataset.price}?`)) {
        document.getElementById("pizzaForm").submit();
    }
}
</script>

</body>
</html>
