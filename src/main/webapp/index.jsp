<%@ page import="java.util.List" %>
<%@ page import="com.onlineecommerce.dao.ProductDAO" %>
<%@ page import="com.onlineecommerce.model.Product" %>
<%@ page import="com.onlineecommerce.model.User" %>

<%
ProductDAO dao = new ProductDAO();
List<Product> products = dao.getAllProducts();
    User loggedUser = (User)session.getAttribute("loggedUser");
%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>ShopEase</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

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
color:#1E293B;
overflow-x:hidden;
}

/* NAVBAR */

.navbar{

background:white;

padding:18px 0;

box-shadow:0 8px 30px rgba(0,0,0,.05);

}

.logo{

font-size:34px;

font-weight:800;

color:#2563EB;

text-decoration:none;

}

.nav-link{

font-weight:500;

color:#475569!important;

margin-left:25px;

transition:.3s;

}

.nav-link:hover{

color:#2563EB!important;

}

.search{

width:420px;

border:none;

background:#EEF4FF;

padding:13px 22px;

border-radius:50px;

outline:none;

}

/* HERO */

.hero{

margin-top:45px;

border-radius:30px;

background:linear-gradient(135deg,#2563EB,#1D4ED8);

padding:70px;

color:white;

overflow:hidden;

}

.hero h1{

font-size:60px;

font-weight:800;

line-height:1.15;

}

.hero p{

margin-top:25px;

font-size:18px;

color:#E2E8F0;

line-height:1.8;

}

.shop-btn{

margin-top:35px;

padding:16px 42px;

border:none;

border-radius:50px;

background:white;

color:#2563EB;

font-weight:700;

transition:.3s;

}

.shop-btn:hover{

transform:translateY(-3px);

}

.hero img{

width:100%;

animation:float 4s ease-in-out infinite;

}

@keyframes float{

0%{transform:translateY(0);}

50%{transform:translateY(-12px);}

100%{transform:translateY(0);}

}

/* SECTION */

.section-title{

font-size:42px;

font-weight:700;

margin-top:70px;

margin-bottom:35px;

}

/* CARD */

.product-card{

background:white;

border-radius:22px;

overflow:hidden;

transition:.35s;

box-shadow:0 15px 35px rgba(37,99,235,.08);

height:100%;

}

.product-card:hover{

transform:translateY(-12px);

box-shadow:0 25px 50px rgba(37,99,235,.15);

}

.image-box{

height:280px;

background:white;

display:flex;

align-items:center;

justify-content:center;

overflow:hidden;

}

.image-box img{

width:100%;

height:100%;

object-fit:contain;

padding:20px;

transition:.35s;

}

.product-card:hover img{

transform:scale(1.08);

}

.product-info{

padding:22px;

}

.product-name{

font-size:20px;

font-weight:600;

height:58px;

overflow:hidden;

}

.price{

font-size:26px;

font-weight:700;

color:#2563EB;

margin-top:10px;

}

.stock{

color:#64748B;

margin-bottom:18px;

}

.details-btn{

width:100%;

padding:12px;

border-radius:12px;

font-weight:600;

}

/* CATEGORY */

.category{

background:white;

border-radius:50px;

padding:12px 24px;

box-shadow:0 8px 20px rgba(0,0,0,.05);

font-weight:500;

}

/* FOOTER */

footer{

margin-top:90px;

background:#0F172A;

color:white;

padding:70px 0;

}

footer h4{

font-weight:700;

}

footer p{

color:#CBD5E1;

margin-top:12px;

}

</style>

</head>
<body>

<nav class="navbar navbar-expand-lg">

<div class="container">

<a class="logo" href="index.jsp">

ShopEase

</a>

<button
class="navbar-toggler"
type="button"
data-bs-toggle="collapse"
data-bs-target="#navbar">

<span class="navbar-toggler-icon"></span>

</button>

<div
class="collapse navbar-collapse"
id="navbar">

<form class="mx-auto">

<input
class="search"
type="text"
placeholder="Search products...">

</form>

<ul class="navbar-nav align-items-center">

<li class="nav-item">

<a class="nav-link" href="index.jsp">

Home

</a>

</li>

<li class="nav-item">

<a class="nav-link" href="user/login.jsp">

User Login

</a>

</li>

<li class="nav-item">

<a class="nav-link" href="seller/login.jsp">

Seller

</a>

</li>

<li class="nav-item">

<a class="nav-link" href="admin/login.jsp">

Admin

</a>

</li>

<li class="nav-item ms-3">

<a
href="cart.jsp"
class="btn btn-primary rounded-pill px-4">

<i class="bi bi-cart3"></i>

Cart

</a>

</li>

<%

if(loggedUser!=null){

%>

<li class="nav-item ms-3">

<a
href="user/dashboard.jsp"
class="btn btn-outline-primary rounded-circle d-flex align-items-center justify-content-center"
style="width:45px;height:45px;">

<i class="bi bi-person-fill fs-5"></i>

</a>

</li>

<%

}

%>

</ul>

</div>

</div>

</nav>

<div class="container">

<div class="hero">

<div class="row align-items-center">

<div class="col-lg-6">

<span
class="badge bg-light text-primary rounded-pill px-3 py-2">

NEW ARRIVALS

</span>

<h1 class="mt-4">

Shop Smarter.
Live Better.

</h1>

<p>

Discover premium products from trusted sellers.
Fast delivery, secure checkout and unbeatable prices,
all in one place.

</p>

<div class="mt-4">

<a
href="#products"
class="btn btn-light btn-lg rounded-pill px-5">

Shop Now

</a>

<a
href="#products"
class="btn btn-outline-light btn-lg rounded-pill px-5 ms-3">

Explore

</a>

</div>

</div>

<div class="col-lg-6 text-center">

<img
src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=900&q=80"
class="img-fluid">

</div>

</div>

</div>

<div class="row mt-5 g-3">

<div class="col-lg-2 col-md-4 col-6">

<div class="category text-center">

💻 Electronics

</div>

</div>

<div class="col-lg-2 col-md-4 col-6">

<div class="category text-center">

👕 Fashion

</div>

</div>

<div class="col-lg-2 col-md-4 col-6">

<div class="category text-center">

⌚ Watches

</div>

</div>

<div class="col-lg-2 col-md-4 col-6">

<div class="category text-center">

📚 Books

</div>

</div>

<div class="col-lg-2 col-md-4 col-6">

<div class="category text-center">

🏠 Home

</div>

</div>

<div class="col-lg-2 col-md-4 col-6">

<div class="category text-center">

🎮 Gaming

</div>

</div>

</div>

<div
class="d-flex justify-content-between align-items-center mt-5">

<div>

<h2
id="products"
class="section-title mb-1">

Featured Products

</h2>

<p class="text-secondary">

<%=products.size()%> products available

</p>

</div>

<div>

<button class="btn btn-primary rounded-pill px-4">

View All

</button>

</div>

</div>

<div class="row g-4">
    <%
for(Product product : products){
%>

<div class="col-xl-3 col-lg-4 col-md-6">

    <div class="product-card">

        <div class="image-box">

            <img
src="<%= product.getImage()==null || product.getImage().isEmpty()
? "https://placehold.co/400x400?text=Product"
: product.getImage() %>">

        </div>

        <div class="product-info">

            <div class="mb-2">

                <span class="badge bg-primary-subtle text-primary">

                    Premium Seller

                </span>

            </div>

            <h5 class="product-name">

                <%=product.getProductName()%>

            </h5>

           <div class="mb-3">

    <b>Rating :</b> 4.8 / 5

    <span class="text-secondary">

        (124 Reviews)

    </span>

</div>

            <div class="d-flex justify-content-between align-items-center mb-3">

                <div>

                    <div class="price">

    Rs. <%=String.format("%.0f",product.getPrice())%>

</div>

                    <small class="stock">

                        <i class="bi bi-box-seam"></i>

                        <%=product.getStock()%> In Stock

                    </small>

                </div>

                <button class="btn btn-light rounded-circle border">

                    <i class="bi bi-heart"></i>

                </button>

            </div>

            <div class="d-grid gap-2">

                <a
                href="productDetails.jsp?id=<%=product.getProductId()%>"
                class="btn btn-primary details-btn">

                    View Details

                </a>

                <a
                href="productDetails.jsp?id=<%=product.getProductId()%>"
                class="btn btn-outline-primary rounded-3">

                    <i class="bi bi-cart-plus"></i>

                    Buy Now

                </a>

            </div>

        </div>

    </div>

</div>

<%
}
%>

</div>

</div>
<!-- Newsletter -->

<section class="container mt-5">

    <div class="p-5 rounded-5 text-center"
         style="background:linear-gradient(135deg,#2563EB,#1D4ED8); color:white;">

        <h2 class="fw-bold mb-3">

            Stay Updated

        </h2>

        <p class="mb-4">

            Get the latest products and exclusive offers delivered to your inbox.

        </p>

        <div class="row justify-content-center">

            <div class="col-lg-6">

                <div class="input-group">

                    <input
                    type="email"
                    class="form-control form-control-lg"
                    placeholder="Enter your email">

                    <button
                    class="btn btn-light fw-bold">

                        Subscribe

                    </button>

                </div>

            </div>

        </div>

    </div>

</section>

<!-- Footer -->

<footer>

<div class="container">

<div class="row gy-4">

<div class="col-lg-4">

<h4>

ShopEase

</h4>

<p>

Your trusted online marketplace connecting buyers with verified sellers.

</p>

<div class="mt-4">

<i class="bi bi-facebook fs-4 me-3"></i>

<i class="bi bi-instagram fs-4 me-3"></i>

<i class="bi bi-twitter-x fs-4 me-3"></i>

<i class="bi bi-linkedin fs-4"></i>

</div>

</div>

<div class="col-lg-2">

<h5 class="mb-3">

Shop

</h5>

<p>Electronics</p>

<p>Fashion</p>

<p>Books</p>

<p>Home</p>

</div>

<div class="col-lg-2">

<h5 class="mb-3">

Account

</h5>

<p>

<a href="user/login.jsp" class="text-light text-decoration-none">

User Login

</a>

</p>

<p>

<a href="seller/login.jsp" class="text-light text-decoration-none">

Seller Login

</a>

</p>

<p>

<a href="admin/login.jsp" class="text-light text-decoration-none">

Admin Login

</a>

</p>

</div>

<div class="col-lg-4">

<h5 class="mb-3">

Contact

</h5>

<p>

<i class="bi bi-envelope-fill me-2"></i>

support@shopease.com

</p>

<p>

<i class="bi bi-telephone-fill me-2"></i>

+91 9876543210

</p>

<p>

<i class="bi bi-geo-alt-fill me-2"></i>

Greater Noida, India

</p>

</div>

</div>

<hr class="my-4 text-secondary">

<div class="text-center">

© 2026 ShopEase | Built with Java, JSP, Servlets & MySQL

</div>

</div>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>