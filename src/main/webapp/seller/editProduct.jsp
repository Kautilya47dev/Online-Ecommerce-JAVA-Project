<%@ page import="com.onlineecommerce.dao.ProductDAO"%>
<%@ page import="com.onlineecommerce.model.Product"%>
<%@ page import="com.onlineecommerce.model.Seller"%>

<%
Seller seller = (Seller) session.getAttribute("loggedSeller");

if(seller == null){
    response.sendRedirect("login.jsp");
    return;
}

int productId = Integer.parseInt(request.getParameter("id"));

ProductDAO dao = new ProductDAO();

Product product = dao.getProductById(productId);

if(product == null || product.getSellerId() != seller.getSellerId()){
    response.sendRedirect("products.jsp");
    return;
}
%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>Edit Product</title>
</head>

<body>

<h2>Edit Product</h2>

<form action="../seller/updateProduct" method="post">

<input type="hidden" name="productId" value="<%=product.getProductId()%>">

Product Name<br>
<input type="text" name="productName" value="<%=product.getProductName()%>" required>

<br><br>

Description<br>
<textarea name="description" rows="4" cols="40"><%=product.getDescription()%></textarea>

<br><br>

Price<br>
<input type="number" step="0.01" name="price" value="<%=product.getPrice()%>" required>

<br><br>

Stock<br>
<input type="number" name="stock" value="<%=product.getStock()%>" required>

<br><br>

Image<br>
<input type="text" name="image" value="<%=product.getImage()%>">

<br><br>

<input type="submit" value="Update Product">

</form>

</body>

</html>