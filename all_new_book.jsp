<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.User"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
  
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Book</title>
<%@include file="all_component/allCsss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #f7e9e9;
}

#toast {
    min-width: 300px;
    position: fixed;
    bottom: 30px;
    left: 50%;
    transform: translateX(-50%);
    background: #333;
    padding: 10px;
    color: white;
    text-align: center;
    z-index: 9999;
    font-size: 18px;
    visibility: hidden;
    opacity: 0;
    transition: opacity 0.5s ease-in-out, bottom 0.5s ease-in-out;
}

#toast.display {
    visibility: visible;
    opacity: 1;
    bottom: 30px;
}
</style>

</head>
<body style="background-color: #ededed;">
<%
User u=(User)session.getAttribute("userobj");
%>

<!-- Toast message box (included on the page for notifications) -->
<div id="toast"></div>

<!-- This will only display the toast if "addCart" is not empty -->
<c:if test="${not empty addCart}">
    <script type="text/javascript">
        // Ensure DOM is loaded
        document.addEventListener("DOMContentLoaded", function() {
            // Call showToast with the addCart message content
            showToast("${addCart}");
        });

        // Function to show the toast message
        function showToast(content) {
            var toast = document.getElementById("toast");
            toast.innerHTML = content;
            toast.classList.add("display");

            // Hide the toast after 2.5 seconds
            setTimeout(function() {
                toast.classList.remove("display");
            }, 2500);
        }
    </script>
</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
		<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list = dao.getAllNewBook();
				for (BookDtls b : list) {
				%>
				<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="bookname/<%=b.getPhotoName()%>"
								style="width: 100px; height: 150px" class="img-thumblin">
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
									
									
									<a
										href="" class="btn btn-success btn-sm ms-1">View Details</a> <a
										href="" class="btn btn-danger btn-sm">₹<%=b.getPrice()%></a>
								</div>
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