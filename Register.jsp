<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
  
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Register</title>
<%@include file="all_component/allCsss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Registration</h3>
						<c:if test="${not empty failedmsg }">
						<p class="text-center text-danger">${failedmsg}</p>
						<c:remove var="failedmsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg}</p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<hr>
						<form action="register" method="post">

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Enter
									Full Name:</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="fname">
							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address:</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="email">
							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone
									No:</label> <input type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="phno">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password:</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required="required" name="password">
							</div>

							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">By accepting terms and conditions*</label>
							</div>

							<button type="submit" class="btn btn-primary">Register</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>