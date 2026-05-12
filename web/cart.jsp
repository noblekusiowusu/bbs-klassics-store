<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, model.Cart" %>

<%
List<Cart> cart = (List<Cart>) session.getAttribute("cart");
double total = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <link rel="stylesheet" href="css/style.css">

    <style>
        body {
            background: url('images/bg.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial;
        }

        .cart-container {
            width: 60%;
            margin: 60px auto;
            background: rosybrown;
            padding: 25px;
            border-radius: 10px;
            text-align: center;
        }

        .cart-item {
            margin-bottom: 15px;
        }

        .cart-item img {
            width: 120px;
            height: 120px;
            object-fit: cover;
        }

        .btn {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            background: #00cfff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
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

<div class="cart-container">

    <h2>Your Cart</h2>

    <% if(cart != null && !cart.isEmpty()){ %>

        <% for(Cart c : cart){ %>

            <div class="cart-item">
                <img src="<%= c.getImage() %>">
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

        <!-- ✅ ORDER BUTTON -->
        <form action="checkout" method="post">
            <button type="submit" class="btn">Order via WhatsApp</button>
        </form>

        <!-- ✅ ADD MORE BUTTON -->
        <a href="index.jsp" class="btn">Add More</a>

    <% } else { %>

        <p>Cart is empty</p>

        <!-- still allow adding more -->
        <a href="index.jsp" class="btn">Add More</a>

    <% } %>

</div>

<jsp:include page="footer.jsp"/>

</body>
</html>