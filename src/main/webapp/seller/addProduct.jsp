<%@ page import="com.onlineecommerce.model.Seller"%>

<%
Seller seller = (Seller) session.getAttribute("loggedSeller");

if (seller == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add Product</title>

</head>

<body>

<h2>Add Product</h2>

<form action="../seller/addProduct" method="post">

    Product Name <br>
    <input type="text" name="productName" required>

    <br><br>

    Description <br>
    <textarea name="description" rows="4" cols="40"></textarea>

    <br><br>

    Price <br>
    <input type="number" step="0.01" name="price" required>

    <br><br>

    Stock <br>
    <input type="number" name="stock" required>

    <br><br>

    Image URL <br>
    <input type="text" name="image">

    <br><br>

    <input type="submit" value="Add Product">

</form>

<br><br>

<a href="dashboard.jsp">Back to Dashboard</a>

</body>

</html>