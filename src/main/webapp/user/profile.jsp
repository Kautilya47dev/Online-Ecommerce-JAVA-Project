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

<title>My Profile</title>

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

.profile-card{
margin-top:50px;
background:white;
border-radius:25px;
padding:40px;
box-shadow:0 15px 35px rgba(37,99,235,.08);
}

.profile-title{
font-size:34px;
font-weight:700;
margin-bottom:30px;
color:#2563EB;
}

.info-box{
background:#F8FAFC;
padding:18px;
border-radius:14px;
margin-bottom:20px;
}

.info-label{
font-size:14px;
color:#64748B;
font-weight:600;
}

.info-value{
font-size:18px;
font-weight:600;
margin-top:5px;
}

.btn-blue{
background:#2563EB;
border:none;
padding:12px 30px;
border-radius:12px;
font-weight:600;
}

.btn-blue:hover{
background:#1D4ED8;
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

<div class="profile-card">

<h2 class="profile-title">

My Profile

</h2>

<div class="row">

<div class="col-md-6">

<div class="info-box">

<div class="info-label">

Full Name

</div>

<div class="info-value">

<%=user.getName()%>

</div>

</div>

</div>

<div class="col-md-6">

<div class="info-box">

<div class="info-label">

Email Address

</div>

<div class="info-value">

<%=user.getEmail()%>

</div>

</div>

</div>

<div class="col-md-6">

<div class="info-box">

<div class="info-label">

Phone Number

</div>

<div class="info-value">

<%=user.getPhone()%>

</div>

</div>

</div>

<div class="col-md-6">

<div class="info-box">

<div class="info-label">

Address

</div>

<div class="info-value">

<%=user.getAddress()%>

</div>

</div>

</div>

</div>

<div class="mt-4">

<a href="#" class="btn btn-blue">

Edit Profile

</a>

<a href="<%=cp%>/user/dashboard.jsp" class="btn btn-outline-secondary ms-2">

Back to Dashboard

</a>

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

User Profile | Online E-Commerce Platform

</p>

</div>

</div>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>