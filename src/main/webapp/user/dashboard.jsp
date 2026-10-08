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

<title>User Dashboard</title>

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

.hero{
margin-top:40px;
background:linear-gradient(135deg,#2563EB,#1D4ED8);
padding:55px;
border-radius:28px;
color:white;
}

.hero h1{
font-size:42px;
font-weight:800;
margin-bottom:15px;
}

.hero p{
font-size:17px;
color:#E2E8F0;
}

.section-title{
font-size:34px;
font-weight:700;
margin-top:50px;
margin-bottom:30px;
}

.dashboard-card{
background:white;
border-radius:22px;
padding:35px;
height:100%;
box-shadow:0 12px 30px rgba(37,99,235,.08);
transition:.3s;
}

.dashboard-card:hover{
transform:translateY(-8px);
box-shadow:0 18px 40px rgba(37,99,235,.15);
}

.card-icon{
width:70px;
height:70px;
background:#EAF2FF;
border-radius:18px;
display:flex;
justify-content:center;
align-items:center;
font-size:30px;
margin-bottom:20px;
}

.dashboard-card h3{
font-size:24px;
font-weight:700;
margin-bottom:12px;
}

.dashboard-card p{
color:#64748B;
margin-bottom:25px;
}

.action-btn{
width:100%;
padding:12px;
border-radius:12px;
font-weight:600;
}

</style>

</head>
<body>

<nav class="navbar">

<div class="container">

<a href="<%=cp%>/index.jsp" class="logo">

ShopEase

</a>

<a href="<%=cp%>/logout" class="btn btn-outline-danger rounded-pill px-4">
    Logout
</a>
</div>

</nav>

<div class="container">

<div class="hero">

<h1>

Welcome, <%=user.getName()%>

</h1>

<p>

Discover products, manage your orders, view your cart and enjoy a seamless shopping experience.

</p>

</div>

<h2 class="section-title">

My Dashboard

</h2>

<div class="row g-4">

<div class="col-lg-4 col-md-6">

<div class="dashboard-card">

<div class="card-icon">

🛍

</div>

<h3>

Browse Products

</h3>

<p>

Explore all products listed by approved sellers.

</p>

<a href="<%=cp%>/index.jsp" class="btn btn-primary action-btn">

Browse Now

</a>

</div>

</div>

<div class="col-lg-4 col-md-6">

<div class="dashboard-card">

<div class="card-icon">

🛒

</div>

<h3>

Shopping Cart

</h3>

<p>

View the products you have added to your cart.

</p>

<a href="<%=cp%>/cart.jsp" class="btn btn-primary action-btn"></a>

Open Cart

</a>

</div>

</div>

<div class="col-lg-4 col-md-6">

<div class="dashboard-card">

<div class="card-icon">

📦

</div>

<h3>

My Orders

</h3>

<p>

Track your orders and view your purchase history.

</p>

<a href="<%=cp%>/user/orders.jsp" class="btn btn-primary action-btn"></a>

View Orders

</a>

</div>

</div>

<div class="col-lg-4 col-md-6">

<div class="dashboard-card">

<div class="card-icon">

👤

</div>

<h3>

My Profile

</h3>

<p>

View and manage your account information.

</p>

<a href="<%=cp%>/user/profile.jsp" class="btn btn-primary action-btn"></a>

Coming Soon

</a>

</div>

</div>

<div class="col-lg-4 col-md-6">

<div class="dashboard-card">

<div class="card-icon">

❤️

</div>

<h3>

Wishlist

</h3>

<p>

Save your favourite products for later.

</p>

<a href="#" class="btn btn-primary action-btn">

Coming Soon

</a>

</div>

</div>

<div class="col-lg-4 col-md-6">

<div class="dashboard-card">

<div class="card-icon">

🚪

</div>

<h3>

Logout

</h3>

<p>

Securely sign out from your account.

</p>

<a href="<%=cp%>/logout" class="btn btn-danger action-btn">
    Logout
</a>

</div>

</div>

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

Built with Java, JSP, Servlets, JDBC and MySQL.

</p>

</div>

</div>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>