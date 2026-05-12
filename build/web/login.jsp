<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <a href="index.jsp">HOME</a>
<div class="form-box">

    <h2>Admin Login</h2>

    <form action="AdminLoginServlet" method="post">

        <input type="text"
               name="username"
               placeholder="Username"
               required>

        <input type="password"
               name="password"
               placeholder="Password"
               required>

        <button type="submit" class="btn">
            Login
        </button>

    </form>

</div>
<jsp:include page="footer.jsp"/>
</body>
</html>