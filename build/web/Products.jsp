<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Our Collection - BBS Klassics</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/script.js"></script>
</head>
<body>
<header>
<div class="logo">
    <img src="images/BBS.png" class="site-logo">
    <h2>BBS KLASSICS</h2>
</div>

<nav>
    <a href="customTailoring.jsp">CUSTOM TAILORING</a>
    <a href="category?type=Shirt">SHIRTS</a>
    <a href="category?type=Long Sleeves">LONG SLEEVES</a>
    <a href="category?type=Two-piece set">TWO-PIECE SET</a>
    <a href="about.jsp">ABOUT US</a>
    <a href="contact.jsp">CONTACT</a>
</nav>
</header>
<!-- Back Button -->

<a href="index.jsp" class="back-btn">
    ← Back to Home
</a>

<!-- Header -->

<header>

    <div class="logo">
        <h2>BBS KLASSICS</h2>
    </div>

    <nav>
        <a href="index.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="contact.jsp">Contact</a>
     
    </nav>

</header>

<!-- Hero Section -->

<section class="hero-section">

    <h1>Our Premium Collection</h1>

    <p>
        Explore our exclusive men’s fashion collection
        crafted for confidence, elegance and class.
    </p>

</section>

<!-- Search -->

<section class="search-section">

    <input
        type="text"
        class="search-bar"
        placeholder="Search products by name..."
        onkeyup="searchProduct(this.value)"
    >

</section>
<!-- Products -->

<section class="products">

<%
List<Product> products = ProductDAO.getAllProducts();

for(Product p : products){
%>

<div class="product">

    <img src="images/uploads/<%= p.getImage() %>" alt="Product Image">

    <h3><%= p.getName() %></h3>

    <p>Category: <%= p.getCategory() %></p>

    <p>GHS <%= p.getPrice() %></p>

    <a href="order.jsp?product=<%= p.getName() %>&price=<%= p.getPrice() %>"
       class="btn">
       Order Now
    </a>

</div>

<%
}
%>

</section>

<!-- WhatsApp Floating Button -->

<a href="https://wa.me/233552894940" class="whatsapp">
    <img src="images/whatsapp-icon.png" width="55">
</a>
<jsp:include page="footer.jsp"/>
</body>
</html>