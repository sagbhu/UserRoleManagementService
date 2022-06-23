
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="common-css.jsp"></jsp:include>

<div class="maindiv align-items-center"
	style="display: flex; justify-content: center;">
	<div class="main-card mb-3 col-md-4 ">
		<div class="card-body align-items-center h-60 mt-100">
			<center>
				<h1 class="loginlogo">DHybrid</h1>
			</center>
		</div>
	</div>
</div>
<div class="maindiv align-items-center h-70"
	style="display: flex; justify-content: center;">
	<div class="main-card mb-3 col-md-4 card">
		<div class="card-body">
			<form method="POST" action="${contextPath}/login" class="form-signin">
				<div style="color: red">${error}</div>
				<div class="position-relative form-group mb-0">
					<label for="emailorno" class=""></label> <input type="text"
						id="username" name="username" class="form-control"
						placeholder="Email Address" required="" autofocus="">
				</div>

				<div class="position-relative form-group mb-2">
					<label for="password" class=""> </label> <input type="password"
						id="password" name="password" class="form-control"
						placeholder="Password" required="">
				</div>

				<button class="mb-2 mr-2 btn btn-primary btn-block mt-0"
					type="submit">Login</button>
			</form>
		</div>
	</div>
</div>
