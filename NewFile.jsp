<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@include file="all_component/allCsss.jsp"%>
<style type="text/css">
.back-img {
	background: url("all_component/img/a.jpg");
	height: 60vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #f7e9e9;
}
</style>
</head>
<body style="background-color: #ededed;">
<%
User u=(User)session.getAttribute("userobj");
%>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-blue">
			<i class="fa-solid fa-book"></i> E-Book Management System
		</h2>
	</div>

	<!-- Start Recent Book  -->

	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="bookname/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookcategory().equals("Old")) {
							%>
							Categories:<%=b.getBookcategory()%></p>
						<div class="row">
							<div class="col text-center">
								<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ms-1">View Details</a>
								<a href="" class="btn btn-danger btn-sm">₹<%=b.getPrice()%></a>

							</div>
							<%
							} else {
							%>
							Categories:<%=b.getBookcategory()%></p>
							<div class="row">
							<div class="col text-center">
							
								<%if(u==null)
								{%>
								<a href="Login.jsp" class="btn btn-danger btn-sm">Add Cart</a>
								<%}
							else
							{%>
								<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm">Add Cart</a>
							<%}
								%>
							
									<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ms-1">View Details</a>
									
									 <a href="" class="btn btn-danger btn-sm">₹<%=b.getPrice()%></a>
								</div>
								<%
								}
								%>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>
			<div class="row">
				<div class="col text-center mt-1">
					<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
				</div>
			</div>
		</div>
		<!-- End Recent Book  -->
		<hr>
		<!-- Start New Book  -->

		<div class="container">
			<h3 class="text-center">New Book</h3>
			<div class="row">

				<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list = dao.getNewBook();
				for (BookDtls b : list) {
				%>
				<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="bookname/<%=b.getPhotoName()%>"
								style="width: 150px; height: 200px" class="img-thumblin">
							<p><%=b.getBookName()%></p>
							<p><%=b.getAuthor()%></p>
							<p>
								Categories:<%=b.getBookcategory()%></p>
							<div class="row">
								<div class="col text-center">
							<%if(u==null)
								{%>
								<a href="Login.jsp" class="btn btn-danger btn-sm">Add Cart</a>
								<%}
							else
							{%>
								<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm">Add Cart</a>
							<%}
								%>
									 <a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ms-1">View Details</a> 
									 
									 <a href="" class="btn btn-danger btn-sm">₹<%=b.getPrice()%></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>
			<div class="row">
				<div class="col text-center mt-1">
					<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
				</div>
			</div>
		</div>
		<!-- End New Book  -->
		<hr>
		<!-- Start Old Book  -->

		<div class="container">
			<h3 class="text-center">Old Book</h3>
			<div class="row">
				<%
				BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list3 = dao2.getOldBooks();
				for (BookDtls b : list3) {
				%>
				<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="bookname/<%=b.getPhotoName()%>"
								style="width: 150px; height: 200px" class="img-thumblin">
							<p><%=b.getBookName()%></p>
							<p><%=b.getAuthor()%></p>
							<p>Categories:<%=b.getBookcategory()%></p>

							<div class="row">
								<div class="col text-center">
									<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ms-1">View Details</a>
									<a href="" class="btn btn-danger btn-sm">₹<%=b.getPrice()%></a>
								</div>

							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>
			<div class="row">
				<div class="col text-center mt-1">
					<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
				</div>
			</div>
		</div>
		<!-- End Old Book  -->
		<%@include file="all_component/footer.jsp"%>
</body>
</html>