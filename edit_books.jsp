<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.BookDtls"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit Books</title>
<%@include file="/admin/allCsss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="/admin/navbar.jsp"%>
	<div class="container" style="margin-top: 50px;">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Edit Books</h4>

						<hr>
						<style>
.form-group {
	margin-bottom: 15px; /* Adds space between form inputs */
}
</style>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDtls b = dao.getBookById(id);
						%>
						<form action="../edit_books" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name:</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getBookName()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name:</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getAuthor()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Price:</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1" value="<%=b.getPrice()%>">
							</div>


							<div class="form-group">
								<label for="inputState">Book Status:</label> <select
									id="inputState" name="status" class="form-control">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>

								</select>
							</div>



							<button type="submit" class="btn btn-primary">Update</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 40px;">
		<%@include file="/admin/footer.jsp"%>
	</div>
</body>
</html>