<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book</title>
<%@include file="all_component/allCsss.jsp"%>
</head>
<body style="background-color: #ededed;">
<c:if test="${empty userobj}">
<c:redirect url="Login.jsp"/>
</c:if>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary">Sell Old Book</h4>
							<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						<hr>
						
						<style>
.form-group {
	margin-bottom: 15px; /* Adds space between form inputs */
}
</style>

						<form action="add_old_book" method="post"
							enctype="multipart/form-data">
							
							<input type="hidden" value="${userobj.email}" name="user">
							
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name:</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name:</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Price:</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1" required="required">
							</div>


							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo:</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">Sell</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>