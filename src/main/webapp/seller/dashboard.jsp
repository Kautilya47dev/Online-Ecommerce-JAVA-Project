<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.onlineecommerce.model.Seller"%>

<%
Seller seller=(Seller)session.getAttribute("loggedSeller");

if(seller==null){
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

<title>Seller Dashboard</title>

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

.dashboard-title{
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

ShopEase Seller

</a>

<a href="<%=cp%>/seller/logout" class="btn btn-outline-danger rounded-pill px-4">

Logout

</a>

</div>

</nav>

<div class="container">

<div class="hero">

<h1>

Welcome,
<%=seller.getBusinessName()%>

</h1>

<p>

Manage your products, view listings and grow your business from one dashboard.

</p>

</div>

<h2 class="dashboard-title">

Seller Dashboard

</h2>

<div class="row g-4">

<div class="col-lg-6">

<div class="dashboard-card">

<div class="card-icon">

📦

</div>

<h3>

Add Product

</h3>

<p>

Add new products to your online store.

</p>

<a href="<%=cp%>/seller/addProduct.jsp" class="btn btn-primary action-btn">

Open

</a>

</div>

</div>

<div class="col-lg-6">

<div class="dashboard-card">

<div class="card-icon">

🛍

</div>

<h3>

My Products

</h3>

<p>

View, edit and remove your listed products.

</p>

<a href="<%=cp%>/seller/products.jsp" class="btn btn-primary action-btn">

Open

</a>

</div>

</div>

<div class="col-lg-6">

<div class="dashboard-card">

<div class="card-icon">

📋

</div>

<h3>

Customer Orders

</h3>

<p>

This feature is coming soon.

</p>

<button class="btn btn-secondary action-btn" disabled>

Coming Soon

</button>

</div>

</div>

<div class="col-lg-6">

<div class="dashboard-card">

<div class="card-icon">

🚪

</div>

<h3>

Logout

</h3>

<p>

Securely sign out from your seller account.

</p>

<a href="<%=cp%>/seller/logout" class="btn btn-danger action-btn">

Logout

</a>

</div>

</div>

</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>