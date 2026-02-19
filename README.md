# 🛒 ShopEase – Java Shopping Cart Web Application

## 📌 Project Overview

ShopEase is a Java-based Shopping Cart Web Application built using JSP, Servlets, JDBC, and MySQL following the MVC (Model-View-Controller) architecture.

The system allows users to browse products, manage a shopping cart, place orders, and track order status. Admins can manage products and update order statuses.

---

## 🏗️ Architecture

This project follows MVC pattern:

- Model → Java Beans + DAO classes  
- View → JSP Pages  
- Controller → Servlets  
- Database → MySQL  
- Server → Apache Tomcat 10  

---

## 🚀 Technologies Used

- Java
- JSP & Servlets
- JDBC
- MySQL
- Apache Tomcat 10
- HTML & CSS
- HttpSession (for cart management)

---

## 🗄️ Database Tables

### Users
- userid (PK)
- name
- email
- password

### Products
- pid (PK)
- pname
- price
- image
- description
- stock

### Orders
- orderid (PK)
- userid (FK)
- total_amount
- order_date
- status (Placed, Shipped, Delivered, Cancelled)

### Order_Items
- orderitemid (PK)
- orderid (FK)
- pid (FK)
- quantity
- price

---

## 👤 User Features

- Register & Login
- View Products
- Add to Cart
- Remove from Cart
- Place Order
- View Order History
- Track Order Status

---

## 🔐 Admin Features

- Admin Login
- Add Product
- Update Product
- Delete Product
- View All Orders
- Update Order Status

---

## 🔄 Project Flow

### Add to Cart
Products are stored in HttpSession as List<CartItem>.

### Place Order
- Data inserted into orders table.
- Products inserted into order_items table.
- Cart cleared after order placement.

### View Orders
Uses INNER JOIN between order_items and products to display full order details.

---

## 📂 Project Structure

```
ShopEase
│
├── src/com/shop/model
├── src/com/shop/dao
├── src/com/shop/servlet
├── WebContent/
│   ├── products.jsp
│   ├── cart.jsp
│   ├── checkout.jsp
│   ├── myOrders.jsp
│   ├── adminDashboard.jsp
│
└── WEB-INF/web.xml
```

---

## ▶️ How to Run

1. Import project into Eclipse
2. Configure MySQL database
3. Update DB credentials in DBConnection.java
4. Deploy on Apache Tomcat 10
5. Open browser:
   http://localhost:8080/login

---

## 👩‍💻 Author

Janavi Patil  
Java Full Stack Developer
