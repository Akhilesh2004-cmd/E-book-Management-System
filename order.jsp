<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.Connection"%>
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
<title>Order</title>
<%@include file="all_component/allCsss.jsp"%>
</head>
<body>
	<c:if test="${empty userobj}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if> 
	
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-1">
	<h3 class="text-center text-primary">Your Order</h3>

		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Method</th>

				</tr>
			</thead>
			<tbody>
			<%
			User u=(User)session.getAttribute("userobj");
			BookOrderImpl dao=new BookOrderImpl(DBConnect.getConn());
			List<Book_Order> blist=dao.getBook(u.getEmail());
			
			for(Book_Order b:blist)
			{%>
				<tr>
					<th scope="row"><%=b.getOrderId() %></th>
					<td><%=b.getUserName() %></td>
					<td><%=b.getBookName() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>
				</tr>
			<%
			}
			%>
			</tbody>
		</table>


	</div>
</body>
</html>