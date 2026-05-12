<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<a href="dashboard.jsp" class="back-btn">
    ← Back
</a>
<div class="form-box">

<h2>Add New Product</h2>

<form action="add-product" method="post">

    <input type="text" name="name" placeholder="Product Name" required>

    <select name="category" required>
        <option value="">Select Category</option>
        <option value="Shirt">Shirt</option>
        <option value="Long Sleeves">Long Sleeves</option>
        <option value="Two-piece set">Two-piece set</option>
    </select>

    <input type="text" name="price" placeholder="Price" required>

    <input type="text" name="image" placeholder="Image name (optional)">

    <button type="submit">Add Product</button>

</form>

</div>
<jsp:include page="footer.jsp"/>
</body>
</html>