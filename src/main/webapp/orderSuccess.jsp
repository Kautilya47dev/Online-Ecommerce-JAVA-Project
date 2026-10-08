<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Order Successful</title>

<style>

body{
    font-family:Arial;
    text-align:center;
    margin-top:80px;
}

button{
    padding:12px 20px;
}

</style>

</head>

<body>

<h1 style="color:green;">
Order Placed Successfully
</h1>

<h2>

Your Order ID is

<%=request.getParameter("orderId")%>

</h2>

<br>

<a href="index.jsp">

<button>

Continue Shopping

</button>

</a>

</body>

</html>