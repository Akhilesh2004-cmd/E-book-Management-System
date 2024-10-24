<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookOrderImpl"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.entity.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Order</title>
<%@include file="/admin/allCsss.jsp"%>
</head>
<body>

<c:if test="${empty userobj}">
	<c:redirect url="../Login.jsp"/>
	</c:if>

	<%@include file="/admin/navbar.jsp"%>
	<h3 class="text-center">Hello,Admin</h3>

	<table class="table table-striped ">
		<thead class="bg-dark text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No.</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
		
		<%
		BookOrderImpl dao=new BookOrderImpl(DBConnect.getConn());
		List<Book_Order> blist=dao.getAllOrder();
		for(Book_Order b:blist)
		{%>
			<tr>
				<th scope="row"><%=b.getOrderId() %></th>
				<td><%=b.getUserName() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFulladd() %></td>
				<td><%=b.getPhno() %></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPaymentType() %></td>
			</tr>
		<%}
		
		%>
		
			
		</tbody>
	</table>
	<div style="margin-top: 207px;">
	<%@include file="/admin/footer.jsp" %>
	</div>
</body>
</html>