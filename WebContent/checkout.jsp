<%@ page import="java.util.List" %>
<%@ page import="com.shop.model.CartItem" %>

<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
        response.sendRedirect("products.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 40%;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #2a5298;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"], input[type="password"], input[type="month"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #1e8449;
        }

        .note {
            text-align: center;
            color: #888;
            margin-top: 20px;
            font-size: 14px;
        }

        @media (max-width: 768px) {
            .container {
                width: 90%;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Checkout & Payment</h2>

    <form action="checkout" method="post">

        <label>Card Number</label>
        <input type="text" name="cardno" placeholder="1234 5678 9012 3456" required>

        <label>Card Holder Name</label>
        <input type="text" name="name" placeholder="firstname lastname" required>

        <label>Expiry Date</label>
        <input type="month" name="expiry" required>

        <label>CVV</label>
        <input type="password" name="cvv" placeholder="" required>

        <input type="submit" value="Pay Now">
    </form>

    <div class="note">Your payment information is secure and encrypted.</div>
</div>

</body>
</html>
