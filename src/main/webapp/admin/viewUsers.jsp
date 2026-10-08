<%@ page import="java.util.*" %>
<%@ page import="com.onlineecommerce.dao.AdminDAO" %>
<%@ page import="com.onlineecommerce.model.User" %>

<%
AdminDAO dao = new AdminDAO();

List<User> users = dao.getAllUsers();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>View Users</title>

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

button{
    padding:8px 15px;
    cursor:pointer;
}

</style>

</head>

<body>

<h2>Registered Users</h2>

<table>

<tr>

<th>User ID</th>
<th>Name</th>
<th>Email</th>
<th>Phone</th>
<th>Address</th>

</tr>

<%
for(User user : users){
%>

<tr>

<td><%=user.getUserId()%></td>

<td><%=user.getName()%></td>

<td><%=user.getEmail()%></td>

<td><%=user.getPhone()%></td>

<td><%=user.getAddress()%></td>

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