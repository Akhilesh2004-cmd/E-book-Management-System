<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Address</title>
<%@include file="all_component/allCsss.jsp"%>
</head>
<body style="background-color: #ededed;">
<%@include file="all_component/navbar.jsp"%>

<div class="container">
<div class="row p-3">
<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-body">
<form class="row g-3">
							<h3 class="text-center text-success">Add Address</h3>
							<hr>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Address :</label>
								<input type="text" class="form-control" id="inputPassword4">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Landmark :</label> <input
									type="text" class="form-control" id="inputEmail4">
							</div>
							<div class="col-md-4">
								<label for="inputPassword4" class="form-label">City :</label> <input
									type="text" class="form-control" id="inputPassword4">
							</div>

							<div class="col-md-4">
								<label for="inputEmail4" class="form-label">State :</label> <input
									type="text" class="form-control" id="inputEmail4">
							</div>
							<div class="col-md-4">
								<label for="inputPassword4" class="form-label">Pincode :</label>
								<input type="number" class="form-control" id="inputPassword4">
							</div>

							<div class="text-center">
								<button class="btn btn-warning text-white">Add Address</button>
							
							</div>
						</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>