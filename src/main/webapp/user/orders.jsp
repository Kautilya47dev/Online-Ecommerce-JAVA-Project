<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.onlineecommerce.model.User"%>

<%
User user = (User)session.getAttribute("loggedUser");

if(user==null){
    response.sendRedirect("login.jsp");
    return;
}

String cp=request.getContextPath();
%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Orders</title>

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

.page-title{
font-size:34px;
font-weight:700;
margin-top:45px;
margin-bottom:25px;
color:#2563EB;
}

.order-card{
background:white;
border-radius:22px;
padding:30px;
box-shadow:0 12px 30px rgba(37,99,235,.08);
margin-bottom:25px;
}

.order-table th{
background:#2563EB;
color:white;
text-align:center;
}

.order-table td{
text-align:center;
vertical-align:middle;
}

.status{
padding:8px 18px;
border-radius:30px;
font-size:14px;
font-weight:600;
background:#DCFCE7;
color:#166534;
display:inline-block;
}

.empty-box{
background:white;
padding:60px;
border-radius:22px;
box-shadow:0 12px 30px rgba(37,99,235,.08);
text-align:center;
margin-top:30px;
}

.empty-box h3{
font-weight:700;
margin-bottom:15px;
}

.empty-box p{
color:#64748B;
margin-bottom:25px;
}

</style>

</head>
<body>

<nav class="navbar">

<div class="container">

<a href="<%=cp%>/index.jsp" class="logo">

ShopEase

</a>

<div>

<a href="<%=cp%>/user/dashboard.jsp" class="btn btn-outline-primary rounded-pill px-4">

Dashboard

</a>

<a href="<%=cp%>/logout" class="btn btn-outline-danger rounded-pill px-4 ms-2">

Logout

</a>

</div>

</div>

</nav>

<div class="container">

<h2 class="page-title">

My Orders

</h2>

<div class="order-card">

<table class="table table-bordered order-table">

<thead>

<tr>

<th>Order ID</th>

<th>Product</th>

<th>Quantity</th>

<th>Total Price</th>

<th>Status</th>

<th>Order Date</th>

</tr>

</thead>

<tbody>

<tr>

<td colspan="6">

<div class="empty-box">

<h3>

No Orders Found

</h3>

<p>

You haven't placed any orders yet. Once you purchase products, your orders will appear here.

</p>

<a href="<%=cp%>/index.jsp" class="btn btn-primary px-4">

Continue Shopping

</a>

</div>

</td>

</tr>

</tbody>

</table>

</div>

<div class="text-end mt-4">

<a href="<%=cp%>/user/dashboard.jsp" class="btn btn-secondary me-2">

Back to Dashboard

</a>

<a href="<%=cp%>/index.jsp" class="btn btn-primary">

Browse Products

</a>

</div>

</div>
<footer class="mt-5 py-4">

<div class="container">

<hr>

<div class="text-center text-muted">

<p class="mb-0">

© 2026 ShopEase. All Rights Reserved.

</p>

<p class="mt-2">

My Orders | Online E-Commerce Platform

</p>

</div>

</div>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>