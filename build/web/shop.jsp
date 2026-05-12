<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.*, model.Product"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shop Collection</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
<div class="logo">
    <img src="images/BBS.png" class="site-logo">
    <h2>BBS KLASSICS</h2>
</div>

<nav>
    <a href="index.jsp" class="back-btn">← Back</a>
    <a href="index.jsp">HOME</a>
    <a href="customTailoring.jsp">CUSTOM TAILORING</a>
    <a href="category?type=Shirt">SHIRTS</a>
    <a href="category?type=Long Sleeves">LONG SLEEVES</a>
    <a href="category?type=Two-piece set">TWO-PIECE SET</a>
</nav>
</header>


<h2>Products</h2>

<%
List<Product> products = (List<Product>) request.getAttribute("products");

if(products != null && !products.isEmpty()){
    for(Product p : products){
%>

<div class="product">
    <img src="<%= p.getImage() %>" width="200">

    <h3><%= p.getName() %></h3>
    <p><%= p.getPrice() %></p>

    <!-- 🔥 CART BUTTON -->
    <a href="add-to-cart?id=<%= p.getId() %>" class="btn">
        Add to Cart
    </a>

</div>

<%
    }
} else {
%>

<p>No products found.</p>

<%
}
%>
<jsp:include page="footer.jsp"/>
</body>
</html>