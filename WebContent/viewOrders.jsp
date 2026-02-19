<%@ page import="java.util.List" %>
<%@ page import="com.shop.dao.OrderDAO" %>
<%@ page import="com.shop.model.Order" %>

<%
if (session.getAttribute("admin") == null) {
    response.sendRedirect("adminLogin.jsp");
    return;
     }

    OrderDAO dao = new OrderDAO();
    List<Order> orders = dao.getAllOrders();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin - View Orders</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
            color: #2a5298;
        }

        table {
            width: 95%;
            margin: 30px auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
            font-size: 14px;
        }

        th {
            background: #2a5298;
            color: #fff;
        }

        tr:nth-child(even) {
            background: #f9f9f9;
        }

        select {
            padding: 6px;
            border-radius: 4px;
        }

        button {
            padding: 6px 10px;
            border: none;
            background: #2a5298;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background: #1e3c72;
        }

        .back {
            display: block;
            width: 200px;
            margin: 30px auto;
            padding: 10px;
            background: #2a5298;
            color: white;
            text-align: center;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }

        .back:hover {
            background: #1e3c72;
        }
    </style>
</head>

<body>

<h2>All Customer Orders</h2>

<table>
    <tr>
        <th>Order ID</th>
        <th>User ID</th>
        <th>Total Amount</th>
        <th>Order Date</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

<%
    if (orders != null && !orders.isEmpty()) {
        for (Order o : orders) {
%>
    <tr>
        <td><%= o.getOrderid() %></td>
        <td><%= o.getUserid() %></td>
        <td><%= o.getTotalAmount() %></td>
        <td><%= o.getOrderDate() %></td>

        <!-- STATUS UPDATE FORM -->
        <td colspan="2">
            <form action="<%= request.getContextPath() %>/updateOrderStatus" method="post">
                <input type="hidden" name="orderId" value="<%= o.getOrderid() %>">

                <select name="status">
                    <option value="Placed" <%= "Placed".equals(o.getStatus()) ? "selected" : "" %>>Placed</option>
                    <option value="Shipped" <%= "Shipped".equals(o.getStatus()) ? "selected" : "" %>>Shipped</option>
                    <option value="Delivered" <%= "Delivered".equals(o.getStatus()) ? "selected" : "" %>>Delivered</option>
                    <option value="Cancelled" <%= "Cancelled".equals(o.getStatus()) ? "selected" : "" %>>Cancelled</option>
                </select>

                <button type="submit">Update</button>
            </form>
        </td>
    </tr>
<%
        }
    } else {
%>
    <tr>
        <td colspan="6">No orders found</td>
    </tr>
<%
    }
%>

</table>

<a href="adminDashboard.jsp" class="back">Back to Dashboard</a>

</body>
</html>
