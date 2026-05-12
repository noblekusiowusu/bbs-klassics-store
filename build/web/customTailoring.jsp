<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Custom Tailoring</title>
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
    <a href="category?type=Shirt">SHIRTS</a>
    <a href="category?type=Long Sleeves">LONG SLEEVES</a>
    <a href="category?type=Two-piece set">TWO-PIECE SET</a>
</nav>
</header>

<div class="form-box">

    <h2>Custom Tailoring Request</h2>

    <form action="CustomOrderServlet" method="post">

        <input type="text" name="fullName" placeholder="Full Name" required>

        <input type="text" name="phone" placeholder="Phone Number" required>

        <select name="category" required>
            <option value="">Select Category</option>
            <option>Shirt</option>
            <option>Long Sleeve</option>
            <option>Two-Piece Set</option>
        </select>

        <textarea name="measurement" placeholder="Enter Measurements" required></textarea>

        <textarea name="styleDescription" placeholder="Describe Your Style" required></textarea>

        <button type="submit" class="btn">Send Request</button>

    </form>

</div>
<a href="https://wa.me/233552894940" class="whatsapp-float" target="_blank">
    <img src="images/whatsapp-icon.png" width="55">
</a>
<jsp:include page="footer.jsp"/><%@ page import="java.util.*, model.Cart" %>

<%
List<Cart> cart = (List<Cart>) session.getAttribute("cart");
double total = 0;
%>

<h2>Your Cart</h2>

<% if(cart != null && !cart.isEmpty()){ %>

    <% for(Cart c : cart){ %>

        <div class="product">
            <img src="<%= c.getImage() %>" width="120">
            <p><%= c.getName() %></p>
            <p><%= c.getPrice() %></p>
        </div>

        <%
        try{
            String priceStr = c.getPrice().replaceAll("[^0-9]", "");
            total += Double.parseDouble(priceStr);
        } catch(Exception e){}
        %>

    <% } %>

    <h3>Total: Ghc <%= total %></h3>

    <form action="checkout" method="post">
        <button type="submit" class="btn">Order via WhatsApp</button>
    </form>

<% } else { %>

    <p>Cart is empty</p>

<% } %>
</body>
</html>