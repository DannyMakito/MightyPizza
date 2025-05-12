<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Pizza Order - Customize</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #d32f2f;
        }

        p {
            font-size: 16px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
            vertical-align: top;
        }

        label {
            display: block;
            margin-bottom: 6px;
        }

        input[type="radio"], select {
            margin-right: 10px;
        }

        textarea {
            width: 100%;
            resize: vertical;
            padding: 8px;
            font-family: inherit;
        }

        input[type="submit"] {
            background-color: #388e3c;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2e7d32;
        }

        .section-title {
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Customize Your Pizza</h1>

        <%
            String name = (String) request.getAttribute("name");
            String pname = (String) request.getAttribute("pname");
            String desc = (String) request.getAttribute("desc");
            Double price = (Double) request.getAttribute("price");
        %>

        <p><b><%= name %></b>, you have chosen:</p>

        <form action="CreateOrderServlet.do" method="POST">
            <table>
                <tr>
                    <td>Pizza Name:</td>
                    <td><%= pname %></td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td><%= desc %></td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td>R <%= price %></td>
                </tr>

                <tr>
                    <td class="section-title">Select Your Size:</td>
                    <td>
                        <label><input type="radio" name="size" value="small"> Small (normal price)</label>
                        <label><input type="radio" name="size" value="large"> Large (R30 extra)</label>
                    </td>
                </tr>

                <tr>
                    <td class="section-title">Select Your Base:</td>
                    <td>
                        <select name="base">
                            <option value="thick">Thick</option>
                            <option value="thin">Thin</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td class="section-title">Delivery Address:</td>
                    <td><textarea name="address" rows="4" cols="30" placeholder="Enter your address here..."></textarea></td>
                </tr>

                <tr>
                    <td></td>
                    <td><input type="submit" value="Checkout"></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
