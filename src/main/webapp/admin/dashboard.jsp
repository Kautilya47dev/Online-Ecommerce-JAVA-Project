<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.onlineecommerce.model.Admin"%>

<%
Admin admin=(Admin)session.getAttribute("loggedAdmin");

if(admin==null){

    response.sendRedirect("login.jsp");
    return;

}
%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Admin Dashboard</title>

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
padding:55px;
border-radius:28px;
background:linear-gradient(135deg,#2563EB,#1D4ED8);
color:white;

}

.hero h1{

font-size:42px;
font-weight:800;

}

.hero p{

margin-top:12px;
font-size:17px;
color:#E2E8F0;

}

.section-title{

font-size:34px;
font-weight:700;
margin-top:45px;
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
border-radius:18px;
background:#EAF2FF;
display:flex;
justify-content:center;
align-items:center;
font-size:34px;
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

<a href="../index.jsp" class="logo">

ShopEase Admin

</a>

<div>

<a href="logout.jsp" class="btn btn-outline-danger rounded-pill px-4">

Logout

</a>

</div>

</div>

</nav>

<div class="container">

<div class="hero">

<h1>

Welcome,

<%=admin.getName()%>

</h1>

<p>

Manage sellers, users and maintain the complete ShopEase platform from one place.

</p>

</div>

<h2 class="section-title">

Admin Dashboard

</h2>

<div class="row g-4">

<div class="col-lg-6">

<div class="dashboard-card">

<div class="card-icon">

👥

</div>

<h3>

View Sellers

</h3>

<p>

Approve, reject or remove registered sellers.

</p>

<a
href="viewSellers.jsp"
class="btn btn-primary action-btn">

Open

</a>

</div>

</div>

<div class="col-lg-6">

<div class="dashboard-card">

<div class="card-icon">

🙍

</div>

<h3>

View Users

</h3>

<p>

See all registered users of the platform.

</p>

<a
href="viewUsers.jsp"
class="btn btn-primary action-btn">

Open

</a>

</div>

</div>

<div class="col-lg-6">

<div class="dashboard-card">

<div class="card-icon">

✔

</div>

<h3>

Pending Sellers

</h3>

<p>

Approve or reject newly registered sellers.

</p>

<a
href="viewSellers.jsp"
class="btn btn-primary action-btn">

Open

</a>

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

Securely sign out from the administrator account.

</p>

<a
href="logout.jsp"
class="btn btn-danger action-btn">

Logout

</a>

</div>

</div>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>