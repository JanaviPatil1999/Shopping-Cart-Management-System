<%@ page import="java.util.List" %>
<%@ page import="com.shop.dao.ProductDAO" %>
<%@ page import="com.shop.model.Product" %>

<%

    if (session.getAttribute("admin") == null) {
    response.sendRedirect("adminLogin.jsp");
    return;
     }


    ProductDAO dao = new ProductDAO();
    List<Product> products = dao.getAllProducts();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>

    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #2a5298;
            margin: 0;
        }

        /* Header */
        .header {
            width: 90%;
            margin: 20px auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logout {
            background: #000;
            color: white;
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
        }

        /* Action bar */
        .action-bar {
            width: 90%;
            margin: 10px auto 20px;
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            display: flex;
            gap: 15px;
            justify-content: center;
        }

        .action-bar a {
            text-decoration: none;
            padding: 10px 18px;
            border-radius: 6px;
            color: white;
            font-weight: bold;
            transition: 0.3s;
        }

        .users { background: #2a5298; }
        .orders { background: #1e7e34; }
        .add { background: #6c757d; }

        .action-bar a:hover {
            transform: scale(1.05);
            opacity: 0.9;
        }

        /* Table */
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background: #2a5298;
            color: white;
        }

        .edit {
            background: green;
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            text-decoration: none;
        }

        .delete {
            background: red;
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            text-decoration: none;
        }
    </style>
</head>

<body>

<!-- Header -->
<div class="header">
    <h2>Admin Product Dashboard</h2>
    <a href="adminLogout" class="logout">Logout</a>
</div>

<!-- Action Buttons ABOVE TABLE -->
<div class="action-bar">
    <a href="viewUsers.jsp" class="users">View Users</a>
    <a href="viewOrders.jsp" class="orders">View Orders</a>
    <a href="addProduct.jsp" class="add">Add Product</a>
</div>

<!-- Products Table -->
<table>
    <tr>
        <th>Image</th>
        <th>Name</th>
        <th>Price</th>
        <th>Category</th>
        <th>Quantity</th>
        <th>Actions</th>
    </tr>

<%
    for(Product p : products){
%>
    <tr>
        <td><img src="images/<%= p.getImage() %>" width="70"></td>
        <td><%= p.getPname() %></td>
        <td><%= p.getPrice() %></td>
        <td><%= p.getCategory() %></td>
        <td><%= p.getQuantity() %></td>
        <td>
            <a class="edit" href="editProduct.jsp?pid=<%= p.getPid() %>">Edit</a>
            <a class="delete" href="deleteProduct?pid=<%= p.getPid() %>"
               onclick="return confirm('Are you sure?')">Delete</a>
        </td>
    </tr>
<%
    }
%>
</table>

</body>
</html>
