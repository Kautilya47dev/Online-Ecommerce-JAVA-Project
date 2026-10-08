<%@ page import="java.util.List" %>
<%@ page import="com.onlineecommerce.dao.ProductDAO" %>
<%@ page import="com.onlineecommerce.model.Product" %>
<%@ page import="com.onlineecommerce.model.Seller" %>

<%
Seller seller = (Seller) session.getAttribute("loggedSeller");

if (seller == null) {
    response.sendRedirect("login.jsp");
    return;
}

ProductDAO dao = new ProductDAO();

List<Product> products = dao.getProductsBySeller(seller.getSellerId());
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Products</title>

</head>

<body>

<h2>My Products</h2>

<table border="1" cellpadding="10">

<tr>

<th>ID</th>
<th>Name</th>
<th>Description</th>
<th>Price</th>
<th>Stock</th>
<th>Image</th>
<th>Action</th>

</tr>

<%
for(Product product : products){
%>

<tr>

<td><%=product.getProductId()%></td>

<td><%=product.getProductName()%></td>

<td><%=product.getDescription()%></td>

<td><%=product.getPrice()%></td>

<td><%=product.getStock()%></td>

<td><%=product.getImage()%></td>

<td>

<a href="editProduct.jsp?id=<%=product.getProductId()%>">Edit</a>

|

<a href="../seller/deleteProduct?id=<%=product.getProductId()%>"
   onclick="return confirm('Delete this product?')">
    Delete
</a>

</td>

</tr>

<%
}
%>

</table>

<br><br>

<a href="dashboard.jsp">Back to Dashboard</a>

</body>

</html>