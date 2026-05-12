<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Place Order</title>
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

<div class="form-box">

<h2>Place Your Order</h2>

<form action="OrderServlet" method="post">

    <input type="hidden"
           name="product"
           value="<%= request.getParameter("product") %>">

    <input type="hidden"
           name="price"
           value="<%= request.getParameter("price") %>">

    <input type="text"
           name="name"
           placeholder="Your Full Name"
           required>

    <input type="text"
           name="phone"
           placeholder="Phone Number"
           required>

    <select name="size">
        <option value="S">Small</option>
        <option value="M">Medium</option>
        <option value="L">Large</option>
        <option value="XL">Extra Large</option>
    </select>

    <button type="submit" class="btn">
        Order via WhatsApp
    </button>

</form>

</div>
<a href="https://wa.me/233552894940" class="whatsapp-float" target="_blank">
    <img src="images/whatsapp-icon.png" width="55">
</a>
           <jsp:include page="footer.jsp"/>
</body>
</html>