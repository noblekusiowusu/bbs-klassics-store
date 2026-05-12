<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.*, dao.ProductDAO, model.Product"%>

<%
ProductDAO dao = new ProductDAO();

List<Product> shirts = dao.getProductsByCategory("Shirt");
List<Product> longs = dao.getProductsByCategory("Long Sleeves");
List<Product> two = dao.getProductsByCategory("Two-piece set");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BBS Klassics Fashion Store</title>
    <link rel="stylesheet" href="css/style.css">
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

<section class="hero-section">
    <h1>Wear Confidence... Live Klassic.</h1>
    <p>Premium men's fashion tailored for kings.</p>
</section>

<!-- 🔍 SEARCH -->
<section class="search-section">
    <input type="text" class="search-bar" placeholder="Search...">
</section>

<!-- 🔥 SLIDERS FROM DATABASE -->
<div class="scategories">

    <div class="category-box">
        <h3>Shirts - Ghc300</h3>
        <div class="slider" id="slider1">
            <% for(int i=0; i<3 && i<shirts.size(); i++){ %>
                <img src="<%= shirts.get(i).getImage() %>">
            <% } %>
        </div>
    </div>

    <div class="category-box">
        <h3>Long Sleeves - Ghc350</h3>
        <div class="slider" id="slider2">
            <% for(int i=0; i<3 && i<longs.size(); i++){ %>
                <img src="<%= longs.get(i).getImage() %>">
            <% } %>
        </div>
    </div>

    <div class="category-box">
        <h3>Two-Piece Set - Ghc500</h3>
        <div class="slider" id="slider3">
            <% for(int i=0; i<3 && i<two.size(); i++){ %>
                <img src="<%= two.get(i).getImage() %>">
            <% } %>
        </div>
    </div>

</div>

<!-- 🔥 CATEGORY CARDS -->
<section class="categories">

    <div class="category-card">
        <img src="images/uploads/shirt2.jpg">
        <h3>SHIRTS</h3>
        <a href="category?type=Shirt" class="btn">See More</a>
    </div>

    <div class="category-card">
        <img src="images/uploads/long3.jpg">
        <h3>LONG SLEEVES</h3>
        <a href="category?type=Long Sleeves" class="btn">See More</a>
    </div>

    <div class="category-card">
        <img src="images/uploads/two7.jpg">
        <h3>TWO-PIECE SET</h3>
        <a href="category?type=Two-piece set" class="btn">See More</a>
    </div>
    
    <div class="category-card">
        <img src="images/uploads/custom1.jpg">
        <h3>TWO-PIECE SET</h3>
        <a href="customTailoring.jsp" class="btn">Provide Details</a>
    </div>

</section>

<!-- 🔥 SLIDER SCRIPT -->
<script>
function startSlider(id) {
    let index = 0;
    let images = document.querySelectorAll("#" + id + " img");

    function showNext() {
        images.forEach(img => img.style.opacity = 0);
        images[index].style.opacity = 1;
        index = (index + 1) % images.length;
    }

    showNext();
    setInterval(showNext, 3000);
}

startSlider("slider1");
startSlider("slider2");
startSlider("slider3");
</script>
<a href="https://wa.me/233552894940" class="whatsapp-float" target="_blank">
    <img src="images/whatsapp-icon.png" width="55">
</a>
<jsp:include page="footer.jsp"/>
</body>
</html>