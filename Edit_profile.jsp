<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
  
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="all_component/allCsss.jsp"%>
</head>
<body style="background-color: #ededed;">
	<%@include file="all_component/navbar.jsp"%>
<div class="container">
<div class="row p-3">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center text-primary">Edit Profile</h4>

<c:if test="${not empty failedMsg}">
<h5 class="text-center text-danger">${failedMsg}</h5>
<c:remove var="failedMsg" scope="session"/>
</c:if>

<c:if test="${not empty succMsg}">
<h5 class="text-center text-success">${succMsg}</h5>
<c:remove var="succMsg" scope="session"/>
</c:if>

<hr>

						<style>
.form-group {
	margin-bottom: 15px; /* Adds space between form inputs */
}
</style>
	<form action="update_profile" method="post">
	<input type="hidden" value="${userobj.id}" name="id">

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Enter
									Full Name:</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="fname" value="${userobj.name} ">
							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address:</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="email" value="${userobj.email} ">
							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone
									No:</label> <input type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="phno" value="${userobj.phoneno }">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password:</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required="required" name="password">
							</div>


							<button type="submit" class="btn btn-primary">Update</button>

						</form>

</div>
</div>
</div>
</div>
</div>
</body>
</html>