<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.onlineecommerce.dao.CartDAO"%>
<%@ page import="com.onlineecommerce.model.*"%>

<%
User user=(User)session.getAttribute("loggedUser");

if(user==null){

    response.sendRedirect("user/login.jsp");
    return;

}

CartDAO dao=new CartDAO();

int cartId=dao.getCartId(user.getUserId());

List<CartItem> cart=dao.getCartItems(cartId);

double grandTotal=0;
%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Shopping Cart</title>

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
text-decoration:none;
color:#2563EB;

}

.cart-card{

margin-top:40px;
background:white;
padding:35px;
border-radius:24px;
box-shadow:0 15px 40px rgba(37,99,235,.08);

}

.page-title{

font-size:36px;
font-weight:700;
margin-bottom:30px;

}

.table img{

width:90px;
height:90px;
object-fit:cover;
border-radius:12px;

}

.table th{

background:#2563EB;
color:white;

}

.table td{

vertical-align:middle;

}

.form-control{

width:90px;

}

.summary{

margin-top:30px;
background:#EEF5FF;
padding:25px;
border-radius:18px;

}

.summary h3{

font-weight:700;

}

.action-btn{

padding:12px 30px;
border-radius:12px;
font-weight:600;

}

</style>

</head>
<body>

<nav class="navbar">

<div class="container">

<a href="index.jsp" class="logo">

ShopEase

</a>

<a href="index.jsp" class="btn btn-outline-primary rounded-pill px-4">

Continue Shopping

</a>

</div>

</nav>

<div class="container">

<div class="cart-card">

<h2 class="page-title">

My Shopping Cart

</h2>

<%

if(cart.isEmpty()){

%>

<div class="text-center py-5">

<h3>

Your cart is empty

</h3>

<p class="text-secondary">

Looks like you haven't added any products yet.

</p>

<a href="index.jsp" class="btn btn-primary action-btn">

Shop Now

</a>

</div>

<%

}else{

%>

<div class="table-responsive">

<table class="table table-hover align-middle">

<thead>

<tr>

<th>Product</th>

<th>Price</th>

<th>Quantity</th>

<th>Total</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%

for(CartItem item:cart){

double total=item.getTotalPrice();

grandTotal+=total;

%>

<tr>

<td>

<div class="d-flex align-items-center">

<img
src="<%=item.getProduct().getImage()==null || item.getProduct().getImage().isEmpty()
? "https://placehold.co/150x150?text=Product"
: item.getProduct().getImage()%>">

<div class="ms-3">

<h6 class="mb-1">

<%=item.getProduct().getProductName()%>

</h6>

<small class="text-secondary">

Stock :
<%=item.getProduct().getStock()%>

</small>

</div>

</div>

</td>

<td>

Rs. <%=String.format("%.0f",item.getProduct().getPrice())%>

</td>

<td>

<form action="updateCart" method="post" class="d-flex">

<input
type="hidden"
name="productId"
value="<%=item.getProduct().getProductId()%>">

<input
type="number"
class="form-control me-2"
name="quantity"
min="1"
value="<%=item.getQuantity()%>">

<button
class="btn btn-primary">

Update

</button>

</form>

</td>

<td>

Rs. <%=String.format("%.0f",total)%>

</td>

<td>

<a
href="removeFromCart?productId=<%=item.getProduct().getProductId()%>"
class="btn btn-danger">

Remove

</a>

</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

<div class="summary">

<div class="row align-items-center">

<div class="col-md-6">

<h3>

Grand Total

</h3>

<h2 class="text-primary">

Rs. <%=String.format("%.0f",grandTotal)%>

</h2>

</div>

<div class="col-md-6 text-md-end mt-3 mt-md-0">

<a
href="index.jsp"
class="btn btn-outline-primary action-btn me-2">

Continue Shopping

</a>

<a
href="checkout.jsp"
class="btn btn-primary action-btn">

Checkout

</a>

</div>

</div>

</div>

<%

}

%>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>