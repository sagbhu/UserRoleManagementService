<head>
<style>
.dropbtn {
	background-color: #3498DB;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
	background-color: #2980B9;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #fff;
	min-width: 120px;
	overflow: auto;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown a:hover {
	background-color: #ddd;
}

.show {
	display: block;
}
</style>

<script>

function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>
</head>
<form id="logoutForm" method="POST" action="${contextPath}/logout">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>
<div class="app-header header-shadow">
	<div class="app-header__logo">

		<p class="headerfontsize">DHybrid</p>
		<div class="header__pane ml-auto">
			<div>
				<button type="button"
					class="hamburger close-sidebar-btn hamburger--elastic"
					data-class="closed-sidebar">
					<span class="hamburger-box"> </span>
				</button>
			</div>
		</div>
	</div>
	<div class="app-header__mobile-menu">
		<div>
			<button type="button"
				class="hamburger hamburger--elastic mobile-toggle-nav">
				<span class="hamburger-box"> <span class="hamburger-inner"></span>
				</span>
			</button>
		</div>
	</div>
	<div class="app-header__content">
		<div class="app-header-left">

			<ul class="header-menu nav">
				<li class="nav-item"><a href="/dashboard" class="nav-link">
						PRODUCTS<!--- DASHBOARD--->
				</a></li>

			</ul>
			<ul class="header-menu nav">
				<li class="nav-item"><a href="users" class="nav-link">
						USERS<!--- USERSMANAGEMENTS--->
				</a></li>
			</ul>
			<ul class="header-menu nav">
				<li class="nav-item"><a href="roles" class="nav-link">
						ROLES<!--- ROLEMANAGEMENTS--->
				</a></li>
			</ul>
			<ul class="header-menu nav">
				<li class="nav-item"><a href="blogs" class="nav-link">
						BLOGS<!--- ROLEMANAGEMENTS--->
				</a></li>
			</ul>
		</div>
		<div class="app-header-right">
			<div class="header-btn-lg pr-0">
				<div class="widget-content p-0">
					<div class="widget-content-wrapper">




						<div class="dropdown">
							<button class="btn  dropdown-toggle" type="button"
								class="dropbtn" id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"
								onclick="myFunction()"></button>
							<div id="myDropdown" class="dropdown-content">
								<button type="button" tabindex="0" class="dropdown-item">My
									Account</button>
								<button type="button" tabindex="0" class="dropdown-item">
									<a class="nav-link"
										onclick="document.forms['logoutForm'].submit()">Logout</a>
								</button>
							</div>
						</div>

						<div class="widget-content-left  ml-3 header-user-info">
							<div class="widget-heading" >Administrator</div>
							<div class="widget-subheading" style="color:blue">${fullName}</div>
						</div>




					</div>
				</div>
			</div>
		</div>
	</div>
</div>

