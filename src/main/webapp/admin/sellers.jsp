<%@ page import="java.util.List" %>
<%@ page import="com.onlineecommerce.dao.SellerDAO" %>
<%@ page import="com.onlineecommerce.model.Seller" %>
<%@ page import="com.onlineecommerce.model.Admin" %>

<%
Admin admin = (Admin) session.getAttribute("loggedAdmin");

if(admin == null){
    response.sendRedirect("login.jsp");
    return;
}

SellerDAO dao = new SellerDAO();
List<Seller> sellers = dao.getAllSellers();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Manage Sellers</title>

<style>

table{
border-collapse:collapse;
width:100%;
}

table,th,td{
border:1px solid black;
padding:10px;
text-align:center;
}

a{
text-decoration:none;
padding:5px 10px;
}

</style>

</head>

<body>

<h2>Manage Sellers</h2>

<table>

<tr>

<th>ID</th>

<th>Name</th>

<th>Business</th>

<th>Email</th>

<th>Phone</th>

<th>Status</th>

<th>Action</th>

</tr>

<%
for(Seller seller : sellers){
%>

<tr>

<td><%=seller.getSellerId()%></td>

<td><%=seller.getName()%></td>

<td><%=seller.getBusinessName()%></td>

<td><%=seller.getEmail()%></td>

<td><%=seller.getPhone()%></td>

<td><%=seller.getStatus()%></td>

<td>

<a href="../admin/updateSellerStatus?id=<%=seller.getSellerId()%>&status=APPROVED">Approve</a>

|

<a href="../admin/updateSellerStatus?id=<%=seller.getSellerId()%>&status=REJECTED">Reject</a>

</td>

</tr>

<%
}
%>

</table>

<br>

<a href="dashboard.jsp">Back to Dashboard</a>

</body>

</html>