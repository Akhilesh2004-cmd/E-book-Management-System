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
<title>All Recent Book</title>
<%@include file="all_component/allCsss.jsp"%>
<style type="text/css">
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
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getAllRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="bookname/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
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
									
									
									 <a
										href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ms-1">View Details</a> <a
										href="" class="btn btn-danger btn-sm">₹<%=b.getPrice()%></a>
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
	</div>
</body>
</html>