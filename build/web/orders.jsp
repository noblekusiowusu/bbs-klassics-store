<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.List"%>
<%@page import="model.Order"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Orders</title>
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

<h2>All Orders</h2>

<%
List<Order> orders = (List<Order>) request.getAttribute("orders");

for(Order o : orders){
%>

<div class="product">

    <h3><%= o.getCustomerName() %></h3>

    <p>Phone: <%= o.getPhone() %></p>
    <p>Product: <%= o.getProductName() %></p>
    <p>Price: GHS <%= o.getPrice() %></p>
    <p>Size: <%= o.getSize() %></p>
    <p>Status: <%= o.getStatus() %></p>

</div>

<%
}
%>
<a href="https://wa.me/233552894940" class="whatsapp-float" target="_blank">
    <img src="images/whatsapp-icon.png" width="55">
</a>
<jsp:include page="footer.jsp"/>
</body>
</html>