<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Books</title>
<%@include file="all_component/allCsss.jsp"%>
</head>
<body style="background-color: #ededed;">
<%
User u=(User)session.getAttribute("userobj");
%>

	<%@include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="bookname/<%=b.getPhotoName()%>"
					style="height: 200px; width: 150px">
				<h4 class="mt-3">
					Book Name:<span class="text-success"><%=b.getBookName()%></span>
				</h4>
				<h4>
					Author Name:<span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=b.getBookcategory()%></span>
				</h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>

				<%
				if ("Old".equals(b.getBookcategory())) {
				%>
				<h5 class="text-primary">Contact to Seller</h5>
				<h5 class="text-primary">
					<i class="fa-regular fa-envelope"></i> Email:
					<%=b.getEmail()%></h5>
				<%
				}
				%>
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shipping</p>
					</div>

				</div>
				<%
				if ("Old".equals(b.getBookcategory())) {
				%>

				<div class=" text-center p-3">
					<a href="NewFile.jsp" class="btn btn-success"><i
						class="fa-solid fa-cart-shopping"></i>Continue Shopping</a> 
						<a href="cart?bid=<%=b.getBookId() %>"
						class="btn btn-danger">₹200</a>
					<%
					} else {
					%>
					<div class=" text-center p-3">
					
						<%if(u==null)
								{%>
								<a href="Login.jsp" class="btn btn-primary"> Add Cart</a>
								<%}
							else
							{%>
								<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-primary"><i
							class="fa-solid fa-cart-shopping"></i> Add Cart</a>
							<%}
								%>
					
							 <a href=""	class="btn btn-danger">₹200</a>
						<%
						}
						%>
						
					</div>
				</div>
			</div>
</body>
</html>