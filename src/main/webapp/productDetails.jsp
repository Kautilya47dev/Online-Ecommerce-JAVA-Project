<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.onlineecommerce.dao.ProductDAO"%>
<%@ page import="com.onlineecommerce.model.Product"%>

<%
String id=request.getParameter("id");

if(id==null){

    response.sendRedirect("index.jsp");
    return;

}

ProductDAO dao=new ProductDAO();

Product product=dao.getProductById(Integer.parseInt(id));

if(product==null){

    out.println("<h2>Product Not Found</h2>");
    return;

}
%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><%=product.getProductName()%></title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<style>

*{

margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;

}

body{

background:#F5F9FF;

}

.navbar{

background:white;
padding:18px 0;
box-shadow:0 8px 25px rgba(0,0,0,.05);

}

.logo{

font-size:32px;
font-weight:800;
color:#2563EB;
text-decoration:none;

}

.product-card{

margin-top:45px;
background:white;
border-radius:28px;
padding:40px;
box-shadow:0 15px 40px rgba(37,99,235,.08);

}

.product-image{

width:100%;
height:520px;
object-fit:cover;
border-radius:22px;
background:#F8FAFC;

}

.product-name{

font-size:40px;
font-weight:700;
margin-bottom:15px;

}

.price{

font-size:34px;
font-weight:700;
color:#2563EB;
margin:20px 0;

}

.info{

font-size:17px;
color:#475569;
margin-bottom:12px;

}

.buy-btn{

padding:14px 45px;
font-size:18px;
font-weight:600;
border-radius:12px;

}

.back-btn{

padding:14px 45px;
font-size:18px;
font-weight:600;
border-radius:12px;

}

</style>

</head>
<body>

<nav class="navbar">

<div class="container">

<a href="index.jsp" class="logo">

ShopEase

</a>

<a href="cart.jsp" class="btn btn-primary rounded-pill px-4">

View Cart

</a>

</div>

</nav>

<div class="container">

<div class="product-card">

<div class="row align-items-center">

<div class="col-lg-6">

<img
class="product-image"
src="<%=product.getImage()==null || product.getImage().isEmpty()
? "https://placehold.co/700x700?text=Product"
: product.getImage()%>">

</div>

<div class="col-lg-6">

<h1 class="product-name">

<%=product.getProductName()%>

</h1>

<div class="price">

Rs. <%=String.format("%.0f",product.getPrice())%>

</div>

<p class="info">

<b>Description :</b>

<br><br>

<%=product.getDescription()%>

</p>

<hr>

<p class="info">

<b>Available Stock :</b>

<%=product.getStock()%>

</p>

<p class="info">

<b>Seller :</b>

<%=product.getSellerName()%>

</p>

<p class="info">

<b>Business :</b>

<%=product.getBusinessName()%>

</p>

<br>

<form action="addToCart" method="post">

<input
type="hidden"
name="productId"
value="<%=product.getProductId()%>">

<button
type="submit"
class="btn btn-primary buy-btn">

Add To Cart

</button>

<a
href="index.jsp"
class="btn btn-outline-primary back-btn ms-3">

Continue Shopping

</a>

</form>

</div>

</div>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>