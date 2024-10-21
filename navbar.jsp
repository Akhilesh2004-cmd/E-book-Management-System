
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>

<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3 style="margin-top:10px;">
				<i class="fa-solid fa-book"></i> Ebooks
			</h3>
		</div>
		<div class="col-md-6">
			<form class="d-flex" action="search.jsp" method="post">
				<input class="form-control me-2" type="search" name="ch" placeholder="Search"
					aria-label="Search" style="width: 200px; margin-top: 10px;">
				<button class="btn btn-primary" type="submit" style="margin-top:10px;">Search</button>
			</form>
		</div>

		<c:if test="${not empty userobj}">
			<div class="col-md-3">
				<a href="checkout.jsp" style="position: relative; top: 10px; left: -10px;"><i
					class="fa-solid fa-cart-plus fa-2x"></i></a> 
					
					<a href="Login.jsp"class="btn btn-success"><i class="fa-solid fa-user-plus"></i>
					${userobj.name}</a>
					
					 <a href="logout" class="btn btn-primary text-white"><i
					class="fa-solid fa-right-to-bracket"></i> Logout</a>
			</div>
		</c:if>

		<c:if test="${empty userobj}">
			<div class="col-md-3">
				<a href="Login.jsp" class="btn btn-success" style="margin-top:10px;"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a> <a
					href="Register.jsp" class="btn btn-primary text-white" style="margin-top:10px;"><i
					class="fa-solid fa-user-plus"></i> Register</a>
			</div>
		</c:if>
	</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item active"><a class="nav-link"
					href="NewFile.jsp"><i class="fa-solid fa-house"></i> Home <span
						class="sr-only">(current)</span> </a></li>
				<li class="nav-item active"><a class="nav-link"
					href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i>
						Recent Book</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i>
						New Book</a></li>

				<li class="nav-item active"><a class="nav-link disabled"
					href="all_old_book.jsp"><i class="fa-solid fa-book-open"></i>
						Old Book</a></li>
			</ul>
			<form class="d-flex">
				<a  href="setting.jsp" class="btn btn-light" type="submit">
					<i class="fa-solid fa-gear"></i> Setting
				</a>
				<button class="btn btn-light ms-1" type="submit">
					<i class="fa-solid fa-phone"></i> Contact Us
				</button>
			</form>
		</div>
	</div>
</nav>