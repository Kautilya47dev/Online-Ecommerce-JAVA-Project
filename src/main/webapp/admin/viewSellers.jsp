<%@ page import="java.util.*" %>
<%@ page import="com.onlineecommerce.dao.AdminDAO" %>
<%@ page import="com.onlineecommerce.model.Seller" %>

<%
AdminDAO dao = new AdminDAO();

List<Seller> sellers = dao.getAllSellers();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>View Sellers</title>

<style>

body{
    font-family:Arial;
    background:#f4f4f4;
    margin:30px;
}

table{
    width:100%;
    border-collapse:collapse;
    background:white;
}

th,td{
    border:1px solid #ddd;
    padding:10px;
    text-align:center;
}

th{
    background:#333;
    color:white;
}

a{
    text-decoration:none;
}

button{
    padding:6px 12px;
    margin:2px;
    cursor:pointer;
}

</style>

</head>

<body>

<h2>All Sellers</h2>

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

<% if(seller.getStatus().equals("PENDING")){ %>

<a href="../updateSellerStatus?sellerId=<%=seller.getSellerId()%>&status=APPROVED">

<button>

Approve

</button>

</a>

<a href="../updateSellerStatus?sellerId=<%=seller.getSellerId()%>&status=REJECTED">

<button>

Reject

</button>

</a>

<% } %>

<a href="../deleteSeller?sellerId=<%=seller.getSellerId()%>"
   onclick="return confirm('Are you sure you want to delete this seller?');">

<button>

Delete

</button>

</a>

</td>

</tr>

<%

}

%>

</table>

<br>

<a href="dashboard.jsp">

<button>

Back to Dashboard

</button>

</a>

</body>

</html>