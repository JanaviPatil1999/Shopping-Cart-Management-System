<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.shop.model.CartItem" %>
<%@ page import="com.shop.dao.CartDAO" %>
<%@ page import="com.shop.model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    CartDAO cartDAO = new CartDAO();
    List<CartItem> cart = cartDAO.getCartByUserId(user.getUserid());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart | ShopEase</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f4f6f9;
    margin: 0;
}

.container {
    width: 80%;
    margin: 40px auto;
    background: #fff;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
    color: #2c5364;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

th {
    background: #2c5364;
    color: white;
}

.total {
    text-align: right;
    font-size: 18px;
    margin-top: 20px;
    font-weight: bold;
}

.remove-btn {
    background: #e74c3c;
    color: white;
    padding: 6px 12px;
    text-decoration: none;
    border-radius: 4px;
}

.checkout-btn {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 20px;
    background: #27ae60;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

.empty {
    text-align: center;
    font-size: 18px;
    color: gray;
    margin-top: 40px;
}
</style>
</head>

<body>

<div class="container">
    <h2>Your Shopping Cart</h2>

<%
    if (cart == null || cart.isEmpty()) {
%>
    <div class="empty">Your cart is empty!</div>
<%
    } else {
        double total = 0;
%>

<table>
    <tr>
        <th>Product Name</th>
        <th>Quantity</th>
        <th>Price (Each)</th>
        <th>Total</th>
        <th>Action</th>
    </tr>

<%
        for (CartItem item : cart) {

            double itemTotal = item.getPrice() * item.getQuantity();
            total += itemTotal;
%>
    <tr>
        <td><%= item.getPname() %></td>
        <td><%= item.getQuantity() %></td>
        <td><%= item.getPrice() %></td>
        <td><%= itemTotal %></td>
        <td>
            <a class="remove-btn"
               href="removeFromCart?pid=<%= item.getPid() %>"
               onclick="return confirm('Remove this item from cart?')">
               Remove
            </a>
        </td>
    </tr>
<%
        }
%>
</table>

<div class="total">Total Amount: <%= total %></div>

<a class="checkout-btn" href="checkout.jsp">Proceed to Checkout</a>

<%
    }
%>

</div>

</body>
</html>
