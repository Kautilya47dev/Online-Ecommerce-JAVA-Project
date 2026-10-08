<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Seller Registration</title>

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

.register-card{

width:100%;

max-width:1200px;

background:white;

border-radius:30px;

overflow:hidden;

box-shadow:0 20px 60px rgba(37,99,235,.15);

}

.left-panel{

background:linear-gradient(135deg,#2563EB,#1D4ED8);

color:white;

padding:60px;

display:flex;

flex-direction:column;

justify-content:center;

height:100%;

}

.left-panel h1{

font-size:44px;

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

padding:55px;

}

.right-panel h2{

font-size:34px;

font-weight:700;

margin-bottom:10px;

}

.subtitle{

color:#64748B;

margin-bottom:30px;

}

.form-control{

height:54px;

border-radius:14px;

border:1px solid #D1D5DB;

margin-bottom:18px;

padding-left:18px;

}

.form-control:focus{

border-color:#2563EB;

box-shadow:none;

}

.btn-register{

width:100%;

height:56px;

border:none;

border-radius:14px;

font-size:18px;

font-weight:600;

background:#2563EB;

}

.btn-register:hover{

background:#1D4ED8;

}

.bottom-link{

margin-top:25px;

text-align:center;

}

.bottom-link a{

text-decoration:none;

font-weight:600;

color:#2563EB;

}

.home-link{

margin-top:18px;

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

<div class="register-card">

<div class="row g-0">

<div class="col-lg-5">

<div class="left-panel">

<h1>

Become a Seller

</h1>

<p>

Create your seller account, list your products, manage orders, and reach customers across the platform.

</p>

<img
src="https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=900&q=80"
alt="Seller Registration">

</div>

</div>

<div class="col-lg-7">

<div class="right-panel">

<h2>

Seller Registration

</h2>

<p class="subtitle">

Create your seller account

</p>

<form action="../sellerRegister" method="post">

<div class="row">

<div class="col-md-6">

<label class="form-label fw-semibold">

Business Name

</label>

<input
type="text"
name="businessName"
class="form-control"
placeholder="Enter business name"
required>

</div>

<div class="col-md-6">

<label class="form-label fw-semibold">

Owner Name

</label>

<input
type="text"
name="name"
class="form-control"
placeholder="Enter owner name"
required>

</div>

</div>

<div class="row">

<div class="col-md-6">

<label class="form-label fw-semibold">

Email Address

</label>

<input
type="email"
name="email"
class="form-control"
placeholder="Enter email"
required>

</div>

<div class="col-md-6">

<label class="form-label fw-semibold">

Password

</label>

<input
type="password"
name="password"
class="form-control"
placeholder="Create password"
required>

</div>

</div>

<div class="row">

<div class="col-md-6">

<label class="form-label fw-semibold">

Phone Number

</label>

<input
type="text"
name="phone"
class="form-control"
placeholder="Enter phone number"
required>

</div>

<div class="col-md-6">

<label class="form-label fw-semibold">

Business Address

</label>

<input
type="text"
name="address"
class="form-control"
placeholder="Enter address"
required>

</div>

</div>

<button
type="submit"
class="btn btn-primary btn-register mt-3">

Register as Seller

</button>

</form>

<div class="bottom-link">

Already have a seller account?

<a href="login.jsp">

Login Here

</a>

</div>

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