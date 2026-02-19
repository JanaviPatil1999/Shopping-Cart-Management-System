<%@ page import="com.shop.dao.ProductDAO" %>
<%@ page import="com.shop.model.Product" %>

<%
    int pid = Integer.parseInt(request.getParameter("pid"));
    ProductDAO dao = new ProductDAO();
    Product p = dao.getProductById(pid);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #333333;
            margin-bottom: 25px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
            color: #555555;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px 12px;
            margin-top: 5px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 25px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

    </style>
</head>
<body>

<div class="container">
    <h2>Edit Product</h2>

    <form action="updateProduct" method="post">
        <input type="hidden" name="pid" value="<%= p.getPid() %>">

        <label for="pname">Name:</label>
        <input type="text" id="pname" name="pname" value="<%= p.getPname() %>" required>

        <label for="price">Price:</label>
        <input type="text" id="price" name="price" value="<%= p.getPrice() %>" required>

        <label for="quantity">Quantity:</label>
        <input type="text" id="quantity" name="quantity" value="<%= p.getQuantity() %>" required>

        <button type="submit">Update</button>
    </form>
</div>

</body>
</html>
