<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<header>
    <h1><i class="fa-solid fa-cart-shopping"></i> ShopEase</h1>
    <nav>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">
            Cart <i class="fa-solid fa-cart-plus"></i>
        </a>
        <a href="myOrders.jsp">My Orders</a>
        
        <a href="logout">Logout</a> <!-- Calls LogoutServlet -->
    </nav>

    
    
    <head>
    <meta charset="UTF-8">
    <title>ShopEase</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
    *{margin:0;padding:0;box-sizing:border-box;font-family:Segoe UI,sans-serif;}
    body{background:#f4f6f9;min-height:100vh;display:flex;flex-direction:column;}
    header{background:linear-gradient(90deg,#0f2027,#203a43,#2c5364);color:white;padding:15px 40px;display:flex;justify-content:space-between;align-items:center;}
    nav a{color:white;text-decoration:none;margin-left:25px;position:relative;}
    main{flex:1;padding:40px;}
    .products{display:grid;grid-template-columns:repeat(auto-fit,minmax(250px,1fr));gap:30px;}
    .card{background:white;border-radius:15px;box-shadow:0 8px 20px rgba(0,0,0,.1);overflow:hidden;transition:.3s;}
    .card:hover{transform:translateY(-10px);}
    .card img{width:100%;height:200px;object-fit:cover;}
    .card-body{padding:20px;}
    .price{font-size:18px;font-weight:bold;color:#2c5364;margin:10px 0;}
    button{width:100%;padding:10px;border:none;border-radius:25px;background:linear-gradient(90deg,#00c6ff,#0072ff);color:white;cursor:pointer;transition:0.3s;}
    button:hover{transform:translateY(-3px);box-shadow:0 5px 15px rgba(0,0,0,0.2);}
    h2{color:#203a43;margin-bottom:20px;}
    footer{background:#203a43;color:white;padding:15px;text-align:center;}
    </style>
</head>
    
</header>
