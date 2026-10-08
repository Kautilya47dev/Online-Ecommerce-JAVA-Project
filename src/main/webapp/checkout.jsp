<%@ page import="java.util.*" %>
<%@ page import="com.onlineecommerce.dao.CartDAO" %>
<%@ page import="com.onlineecommerce.model.*" %>

<%
User user = (User)session.getAttribute("loggedUser");

if(user == null){
    response.sendRedirect("user/login.jsp");
    return;
}

CartDAO dao = new CartDAO();

int cartId = dao.getCartId(user.getUserId());

List<CartItem> cart = dao.getCartItems(cartId);

double grandTotal = 0;

for(CartItem item : cart){
    grandTotal += item.getTotalPrice();
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Checkout</title>

<style>

body{
    font-family:Arial;
    background:#f4f4f4;
    margin:30px;
}

.container{
    width:700px;
    margin:auto;
    background:white;
    padding:20px;
    border-radius:8px;
}

table{
    width:100%;
    border-collapse:collapse;
}

th,td{
    border:1px solid #ddd;
    padding:10px;
    text-align:center;
}

button{
    padding:10px 20px;
    cursor:pointer;
    font-size:16px;
}

</style>

</head>

<body>

<div class="container">

<h2>Checkout</h2>

<table>

<tr>
    <th>Product</th>
    <th>Price</th>
    <th>Qty</th>
    <th>Total</th>
</tr>

<%
for(CartItem item : cart){
%>

<tr>

<td><%=item.getProduct().getProductName()%></td>

<td>₹ <%=item.getProduct().getPrice()%></td>

<td><%=item.getQuantity()%></td>

<td>₹ <%=item.getTotalPrice()%></td>

</tr>

<%
}
%>

<tr>

<td colspan="3">

<b>Grand Total</b>

</td>

<td>

<b>₹ <%=grandTotal%></b>

</td>

</tr>

</table>

<br>

<h3>Shipping Address</h3>

<p><%=user.getAddress()%></p>

<br>

<form action="placeOrder" method="post">

<input
type="submit"
value="Place Order">

</form>

<br>

<a href="cart.jsp">

<button>

Back to Cart

</button>

</a>

</div>

</body>

</html>