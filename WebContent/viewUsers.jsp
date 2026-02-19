<%@ page import="java.util.List" %>
<%@ page import="com.shop.dao.UserDAO" %>
<%@ page import="com.shop.model.User" %>

<%
    // Admin security check
     if (session.getAttribute("admin") == null) {
    response.sendRedirect("adminLogin.jsp");
    return;
     }

    UserDAO dao = new UserDAO();
    List<User> users = dao.getAllUsers();
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Users</title>

    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
        }
        h2 {
            text-align: center;
            color: #2a5298;
        }
        table {
            width: 90%;
            margin: auto;
            background: white;
            border-collapse: collapse;
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
    </style>
</head>

<body>

<h2>Registered Users</h2>

<table>
    <tr>
        <th>User ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Address</th>
        <th>Phone</th>
    </tr>

<%
    for (User u : users) {
%>
    <tr>
        <td><%= u.getUserid() %></td>
        <td><%= u.getName() %></td>
        <td><%= u.getEmail() %></td>
        <td><%= u.getAddress() %></td>
        <td><%= u.getPhone() %></td>
    </tr>
<%
    }
%>

</table>

<br>
<div style="text-align:center;">
    <a href="adminDashboard.jsp">Back to Dashboard</a>
</div>

</body>
</html>
