<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Pizza</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #d84315;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            text-align: center;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
            vertical-align: top;
        }

        input[type="text"],
        input[type="file"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #43a047;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Create a New Pizza</h1>
        <p>Please add details down below:</p>

        <form action="CreatePizzaServlet.do" method="POST" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Pizza Name:</td>
                    <td><input type="text" name="name" required /></td>
                </tr>

                <tr>
                    <td>Description:</td>
                    <td><input type="text" name="desc" required /></td>
                </tr>

                <tr>
                    <td>Price:</td>
                    <td><input type="text" name="price" required /></td>
                </tr>

                <tr>
                    <td>Image:</td>
                    <td><input type="file" accept="image/*" name="images" required /></td>
                </tr>

                <tr>
                    <td></td>
                    <td><input type="submit" value="Create Pizza" /></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
