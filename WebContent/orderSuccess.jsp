<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.shop.model.Order" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Success | ShopEase</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 900px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        .success {
            text-align: center;
            color: #2c5364;
        }
        .success i {
            color: #00c6ff;
            font-size: 50px;
            margin-bottom: 10px;
        }
        .success h2 {
            margin-bottom: 10px;
        }
        .success p {
            font-size: 18px;
            color: #555;
        }
        .order-history {
            margin-top: 40px;
        }
        .order-history h3 {
            color: #203a43;
            margin-bottom: 15px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }
        th, td {
            padding: 12px 15px;
            text-align: center;
        }
        th {
            background: linear-gradient(90deg, #00c6ff, #0072ff);
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .continue-btn {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 30px;
            background: linear-gradient(90deg, #00c6ff, #0072ff);
            color: #fff;
            border-radius: 25px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }
        .continue-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>

<div class="container">
    <div class="success">
        <i class="fa-solid fa-circle-check"></i>
        <h2>Order Placed Successfully</h2>
        <p>Thank you for shopping with us.</p>
    </div>

    <div class="order-history">
        <h3></h3>

        <%
            // Retrieve order list passed from PlaceOrderServlet
            List<Order> orders = (List<Order>) request.getAttribute("orders");
        %>

        <% if (orders == null || orders.isEmpty()) { %>
            <p></p>
        <% } else { %>
            <table>
                <tr>
                    <th>Order ID</th>
                    <th>Total Amount</th>
                    <th>Order Date</th>
                </tr>
                <% for (Order o : orders) { %>
                <tr>
                    <td><%= o.getOrderid() %></td>
                    <td><%= o.getTotalAmount() %></td>
                    <td><%= o.getOrderDate() %></td>
                </tr>
                <% } %>
            </table>
        <% } %>

        <div style="text-align: center;">
            <a href="products.jsp" class="continue-btn">Continue Shopping</a>
        </div>
    </div>
</div>

</body>
</html>
