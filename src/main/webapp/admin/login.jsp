<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Admin Login</title>

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

background:linear-gradient(135deg,#EEF5FF,#DCEBFF);

min-height:100vh;

display:flex;

justify-content:center;

align-items:center;

padding:30px;

}

.login-card{

width:100%;

max-width:1100px;

background:white;

border-radius:30px;

overflow:hidden;

box-shadow:0 20px 60px rgba(37,99,235,.15);

}

.left-panel{

background:linear-gradient(135deg,#2563EB,#1D4ED8);

color:white;

padding:70px 60px;

display:flex;

flex-direction:column;

justify-content:center;

height:100%;

}

.left-panel h1{

font-size:46px;

font-weight:800;

margin-bottom:20px;

}

.left-panel p{

font-size:17px;

line-height:1.8;

color:#E2E8F0;

}

.left-panel img{

width:100%;

margin-top:40px;

border-radius:20px;

}

.right-panel{

padding:70px 60px;

}

.right-panel h2{

font-size:34px;

font-weight:700;

margin-bottom:10px;

}

.subtitle{

color:#64748B;

margin-bottom:35px;

}

.form-control{

height:56px;

border-radius:14px;

border:1px solid #D1D5DB;

margin-bottom:20px;

padding-left:18px;

}

.form-control:focus{

border-color:#2563EB;

box-shadow:none;

}

.btn-login{

width:100%;

height:56px;

background:#2563EB;

border:none;

border-radius:14px;

font-size:18px;

font-weight:600;

}

.btn-login:hover{

background:#1D4ED8;

}

.home-link{

margin-top:25px;

text-align:center;

}

.home-link a{

text-decoration:none;

color:#475569;

}

</style>

</head>
<body>

<div class="container">

<div class="login-card">

<div class="row g-0">

<div class="col-lg-6">

<div class="left-panel">

<h1>

Admin Portal

</h1>

<p>

Manage sellers, monitor users, approve registrations, and maintain the entire e-commerce platform from one secure dashboard.

</p>

<img
src="https://images.unsplash.com/photo-1552664730-d307ca884978?w=900&q=80"
alt="Admin Panel">

</div>

</div>

<div class="col-lg-6">

<div class="right-panel">

<h2>

Administrator Login

</h2>

<p class="subtitle">

Sign in to access the admin dashboard

</p>

<form action="<%=request.getContextPath()%>/admin/login" method="post">

<label class="form-label fw-semibold">

Email Address

</label>

<input
type="email"
name="email"
class="form-control"
placeholder="Enter admin email"
required>

<label class="form-label fw-semibold">

Password

</label>

<input
type="password"
name="password"
class="form-control"
placeholder="Enter password"
required>

<button
type="submit"
class="btn btn-primary btn-login">

Login to Dashboard

</button>

</form>

<div class="home-link">

<a href="../index.jsp">

← Back to Home

</a>

</div>

</div>

</div>

</div>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>