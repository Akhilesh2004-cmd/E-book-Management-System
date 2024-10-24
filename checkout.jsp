<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.CartDAOimpl"%>
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
<title>Cart Page</title>
<%@include file="all_component/allCsss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	
	<c:if test="${empty userobj}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg}">
		<div class="alert alert-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />

	</c:if>

	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />

	</c:if>

	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>

						<table class="table table-striped">
							<thead>

								<tr>

									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");

								CartDAOimpl dao = new CartDAOimpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
							</tbody>
						</table>


					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<form class="row g-3" action="order" method="post">
						<input type="hidden" value="${userobj.id}" name="id">
						
							<h3 class="text-center text-success">Your Details for Order</h3>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Name :</label> <input
									type="text" name="username" class="form-control" id="inputEmail4"value="<%=u.getName()%>" required>

							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Email :</label> <input
									type="email" name="email" class="form-control" id="inputPassword4"value="<%=u.getEmail()%>" required>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No. :</label>
								<input type="number" name="phno" class="form-control" id="inputEmail4"value="<%=u.getPhoneno()%>" required>
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Address :</label>
								<input type="text" name="address" class="form-control" id="inputPassword4" required>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Landmark :</label> <input
									type="text" name="landmark" class="form-control" id="inputEmail4" required>
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">City :</label> <input
									type="text" name="city"class="form-control" id="inputPassword4" required>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">State :</label> <input
									type="text" name="state" class="form-control" id="inputEmail4" required>
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Pincode :</label>
								<input type="number" name="pincode" class="form-control" id="inputPassword4" required>
							</div>
							<div class="form-group">
								<label>Payment Mode :</label> <select class="form-control" name="payment">
									<option value="noselect">--Select--</option>
									<option value="COD">Cash on Delivery</option>
								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="NewFile.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>