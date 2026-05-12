<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
String adminName = (String) session.getAttribute("admin");

if(adminName == null){
    response.sendRedirect("login.jsp");
    return;
}

java.util.Calendar cal = java.util.Calendar.getInstance();
int hour = cal.get(java.util.Calendar.HOUR_OF_DAY);

String greeting = "";

if(hour < 12){
    greeting = "Good Morning";
}
else if(hour < 17){
    greeting = "Good Afternoon";
}
else{
    greeting = "Good Evening";
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1>Admin Dashboard</h1>
<h2>
    <%= greeting %>,
    <%= adminName %> 👋
</h2>

<h3>
Welcome back Admin 👋
</h3>

<p>
Manage products, orders and customer requests here.
</p>
<div class="logo center-logo">

    <img src="images/BBS.png" alt="BBS Klassics Logo" class="site-logo">

    <h2>Admin Dashboard</h2>

</div>
<div class="admin-buttons">

    <a href="addProduct.jsp" class="btn">
        Add Product
    </a>

    <a href="Products.jsp" class="btn">
        View Products
    </a>

    <a href="ViewOrdersServlet" class="btn">
        View Orders
    </a>

    <a href="UpdateOrderServlet" class="btn">
        Update Orders
    </a>

    <a href="LogoutServlet" class="btn">
        Logout
    </a>
<jsp:include page="footer.jsp"/>
</div>