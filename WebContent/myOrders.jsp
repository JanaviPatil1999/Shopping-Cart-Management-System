<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.shop.model.Order" %>
<%@ page import="com.shop.model.CartItem" %>
<%@ page import="com.shop.model.User" %>
<%@ page import="com.shop.dao.OrderDAO" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    OrderDAO orderDAO = new OrderDAO();
    List<Order> orders = orderDAO.getOrdersByUserId(user.getUserid());
%>

<%@ include file="header.jsp" %>

<div style="max-width:1000px; margin:50px auto; background:#fff; padding:30px; border-radius:15px; box-shadow:0 8px 20px rgba(0,0,0,0.1);">
    <h2 style="color:#2c5364; text-align:center; margin-bottom:30px;">My Orders</h2>

    <% if (orders == null || orders.isEmpty()) { %>
        <p style="text-align:center;">You have no previous orders.</p>
    <% } else { %>
        <% for(Order o : orders) { %>
            <div style="margin-bottom:40px; border:1px solid #ddd; border-radius:10px; padding:20px;">
                <h3 style="color:#0072ff;">Order ID: <%= o.getOrderid() %></h3>
                <p><strong>Order Date:</strong> <%= o.getOrderDate() %> &nbsp; | &nbsp; <strong>Total:</strong> ₹<%= o.getTotalAmount() %> &nbsp; | &nbsp; <strong>Status:</strong> <%= o.getStatus() %></p>
                
                <table style="width:100%; border-collapse:collapse; margin-top:15px; text-align:center;">
                    <tr style="background:linear-gradient(90deg,#00c6ff,#0072ff); color:white;">
                        <th>Product</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>SubTotal</th>
                    </tr>
                    <% for(CartItem ci : o.getItems()) { %>
                        <tr style="background-color:#f9f9f9;">
                            <td><%= ci.getPname() %></td>
                            <td>
                                <img src="images/<%= ci.getImage() %>" alt="<%= ci.getPname() %>" style="width:80px; height:80px; object-fit:cover; border-radius:5px;">
                            </td>
                            <td>₹<%= ci.getPrice() %></td>
                            <td><%= ci.getQuantity() %></td>
                            <td>₹<%= ci.getPrice() * ci.getQuantity() %></td>
                        </tr>
                    <% } %>
                </table>
            </div>
        <% } %>
    <% } %>
</div>

<%@ include file="footer.jsp" %>
