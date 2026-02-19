<%@ page import="java.util.List" %>
<%@ page import="com.shop.model.Product" %>
<%@ page import="com.shop.dao.ProductDAO" %>

<%
    ProductDAO dao = new ProductDAO();
    List<Product> products = dao.getAllProducts();
%>

<%@ include file="header.jsp" %>

<main>
    <h2>Featured Products</h2>
    <div class="products">
        <%
        for(Product p : products){
        %>
            <div class="card">
                <img src="images/<%= p.getImage() %>" alt="<%= p.getPname() %>">
                <div class="card-body">
                    <h3><%= p.getPname() %></h3>
                    <p><%= p.getDescription() %></p>
                    <p>Available: <b><%= p.getQuantity() %></b></p>
                    <div class="price"><%= p.getPrice() %></div>
                    <form action="addToCart" method="get">
                        <input type="hidden" name="pid" value="<%= p.getPid() %>">
                        Quantity: <input type="number" name="qty" min="1" max="<%= p.getQuantity() %>" value="1" required>
                        <br><br>
                        <button type="submit">Add to Cart</button>
                    </form>
                </div>
            </div>
        <%
        }
        %>
    </div>
</main>

<%@ include file="footer.jsp" %>
