<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<jsp:include page="common-css.jsp"></jsp:include>
	<jsp:include page="common-js.jsp"></jsp:include>

	<style type="text/css">
		.alert {
			display: none;
		}
	</style>

	<body>
	<% String token=(String)request.getSession().getAttribute("CSRFToken"); if(null==token){
			response.sendRedirect("/login"); } %> 
			<!-- -------------------------------------------header start----------------------------------------------->
			<jsp:include page="header.jsp"></jsp:include>
			<!-- -------------------------------------------header end------------------------------------------------->

			<!-- ----------------------------------------Model start-------------------------------------------- -->

			<div class="modal fade" id="userModal" role="dialog">
				<div class="alert alert-success alert-dismissable" id="user-add">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					User Added Successfully!
				</div>

				<div class="alert alert-success alert-dismissable" id="user-update">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					User Updated Successfully!
				</div>
				<div class="modal-dialog modal-lg">

					<div class="modal-content">
						<div class="modal-header ">
							<h5 class="modal-title" id="exampleModalLongTitle">User</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<div class="modal-body scroll">
							<form class="" method="post" action="" id="userform" onsubmit="return false">

								<input name="userid" id="userid" type="hidden" class="form-control">

								<div class="col-md-12">
									<div class="position-relative form-group">
										<label for="firstName" class="">First Name</label> <input name="firstName"
											id="firstName" placeholder="Enter First Name" type="text"
											class="form-control" maxlength="32" pattern="[A-Za-z]{1,32}" required>
										<b><span id="firstnameerror" style="color: red;"></span></b>
									</div>
								</div>
								<div class="col-md-12">
									<div class="position-relative form-group">
										<label for="lastName" class="">Last Name</label> <input name="lastName"
											id="lastName" placeholder="Enter Last Name" type="text" class="form-control"
											maxlength="32" pattern="[A-Za-z]{1,32}" required> <b><span
												id="lastnameerror" style="color: red;"></span></b>
									</div>
								</div>
								<div class="col-md-12">
									<div class="position-relative form-group">
										<label for="exampleFormControlSelect1">Roles</label> <select
											class="form-control" id="roleSelect" name="roleSelect" multiple></select>
										<b><span id="roleselecterror" style="color: red;"></span></b>
									</div>
								</div>


								<div class="col-md-12">
									<div class="position-relative form-group">
										<label for="email" class="">Email</label> <input name="email" id="email"
											placeholder="Enter Email" type="email" class="form-control" maxlength="260"
											required> <b><span id="emailerror" style="color: red;"></span></b>
									</div>
								</div>
								<div class="col-md-12">
									<div class="position-relative form-group">
										<label for="mobileNumber" class="">Phone No.</label> <input name="mobileNumber"
											id="mobileNumber" placeholder="Enter Phone" type="text" class="form-control"
											maxlength="10" minlength="10" pattern="[6-9]{1}[0-9]{9}" required> <b><span
												id="mobilenumbererror" style="color: red;"></span></b>
									</div>
								</div>


								<div class="col-md-12">
									<div class="position-relative form-group">
										<label for="gender" class="" id="gender">Gender</label>
										<fieldset class="position-relative form-group">
											<div class="form-row">
												<div class="col-md-4">
													<div class="position-relative form-check">
														<label class="form-check-label"> <input name="gender"
																type="radio" id="male" class="form-check-input"
																value="male" required> Male
														</label>
													</div>
												</div>
												<div class="col-md-4">
													<div class="position-relative form-check">
														<label class="form-check-label"> <input name="gender"
																type="radio" id="female" class="form-check-input"
																value="female" required>Female
														</label>
													</div>
												</div>
												<div class="col-md-4">
													<div class="position-relative form-check">
														<label class="form-check-label"> <input name="gender"
																type="radio" id="other" class="form-check-input"
																value="other" required>Other
														</label>
													</div>
												</div>
												<b><span id="gendererror" style="color: red;"></span></b>
											</div>
										</fieldset>
									</div>
								</div>

								<div class="col-md-12">
									<div class="position-relative form-group">
										<label for="dateOfBirth" class="">Date of Birth</label> <input
											name="dateOfBirth" id="dateOfBirth" type="date" class="form-control"
											required> <b><span id="doberror" style="color: red;"></span></b>
									</div>
								</div>

								<div class="col-md-12">
									<div class="position-relative form-group">
										<label for="password" class="">Password</label> <input name="password"
											id="password" placeholder="Enter Password" type="password"
											class="form-control" maxlength="20"
											pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
											title="atleast 1 Alphabet and 1 Number" required> <b><span
												id="passworderror" style="color: red;"></span></b>
									</div>
								</div>
								<div class="col-md-12">
									<div class="position-relative form-group">
										<label for="confirmpassword" class="">Confirm Password</label> <input
											name="confirmpassword" id="confirmpassword"
											placeholder="Enter Confirm Password" type="password" class="form-control"
											maxlength="20"> <b><span id="confirmpasserror"
												style="color: red;"></span></b>
									</div>
								</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" id="close_Updateproduct_modal"
								data-dismiss="modal" onclick="clearUserData()" ;>Close</button>
							<button type="button" id="UpdateProducts" class="btn btn-primary"
								onclick="validateForm()">Save</button>
						</div>
						</form>
					</div>
				</div>
			</div>
			<!-- ----------------------------------------Model End-------------------------------------------- -->

			<div class="container card col-md-8">
				<div class="card-body">
					<button type="button" class="btn btn-primary btn-lg float-right" data-toggle="modal"
						data-target="#userModal" onclick="clearUserData();clearValidationData();">+ ADD</button>
					<h5 class="card-title">Users</h5>
					<table class="table table-hover mt-4" id="tblData">
						<thead>
							<tr>
								<th style="display: none;">id</th>
								<th>Full Name</th>
								<th>Email</th>
								<th>Phone</th>
								<th class="tdaction">Action</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="6" id="trLoader">
									<div class="text-center">Loading .....</div>
								</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
			</div>
			</div>

			<div class="modal fade" id="DeleteUserSuccess" tabindex="-1" role="dialog" aria-labelledby=""
				aria-hidden="true">
				<div class="alert alert-danger alert-dismissable" id="user-delete">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					user Deleted Successfully!
				</div>
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">

						<div class="modal-header">
							<h5 class="modal-title">Delete User</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<input type="hidden" class="form-control" name="id" id="user_id">
							</div>
							<center>
								<p>Are You Sure?</p>
							</center>
						</div>
						<div class="modal-footer">
							<button type="reset" class="btn btn-secondary" id="close_Delete_modal" data-dismiss="modal"
								onclick="clearUserData();">Close</button>
							<button type="button" onclick="userDelete();" class="btn btn-danger">Yes! Delete It</button>

						</div>
					</div>
				</div>
			</div>
			<!-----------------------------------------User Ajax Script Start--------------------------------------->
			<!-----------------------------------------User Form Data Add Start--------------------------------------->
			<script type="text/javascript">

				var baseURL = '${pageContext.servletContext.contextPath}';
				//< !--------------------------- User Add Start------------------------------------>

				function validateForm() {
					let name = document.forms["userform"]["firstName"].value;
					if (name == "") {
						document.getElementById("firstnameerror").innerHTML = "FirstName must be required!";
						return false;
					} else if (!/^[a-zA-Z0-9]*( [a-zA-Z0-9]*)?$/.test(name)) {
						document.getElementById("firstnameerror").innerHTML = "Enter Valid FirstName!";
						return false;
					} else if ((3 > name.length) || (name.length > 32)) {
						document.getElementById("firstnameerror").innerHTML = "FirstName minimum 3 and maxmum 32";
						return false;
					} else {
						document.getElementById("firstnameerror").innerHTML = "";
					}


					let lname = document.forms["userform"]["lastName"].value;
					if (lname == "") {
						document.getElementById("lastnameerror").innerHTML = "LastName must be required!";
						return false;
					} else if (!/^[a-zA-Z0-9]*( [a-zA-Z0-9]*)?$/.test(lname)) {
						document.getElementById("lastnameerror").innerHTML = "Enter Valid LastName!";
						return false;
					} else if ((3 > lname.length) || (lname.length > 32)) {
						document.getElementById("lastnameerror").innerHTML = "LastName minimum 3 and maxmum 32";
						return false;
					} else {
						document.getElementById("lastnameerror").innerHTML = "";
					}

					/*var roleSelect = $("#roleSelect");
					if (roleSelect.val() == "") {
					document.getElementById("roleselecterror").innerHTML = "Please Select a Option."
						return false;
					}else {
						document.getElementById("roleselecterror").innerHTML = "";
					} */


					let email = document.forms["userform"]["email"].value;
					if (email == "") {
						document.getElementById("emailerror").innerHTML = "Email must be required!";
						return false;
					} else if (!/^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,6}$/
						.test(email)) {
						document.getElementById("emailerror").innerHTML = "Enter Valid Email!";
						return false;
					} else {
						document.getElementById("emailerror").innerHTML = "";
					}

					let phone = document.forms["userform"]["mobileNumber"].value;
					if (phone == "") {
						document.getElementById("mobilenumbererror").innerHTML = "Phone Number must be required!";
						return false;
					} else if (!(/^[6-9]{1}[0-9]+$/.test(phone))) {
						document.getElementById("mobilenumbererror").innerHTML = "Enter Valid number";
						return false;
					} else {
						document.getElementById("mobilenumbererror").innerHTML = "";
					}


					var gender = document.getElementsByName("gender");
					if (!gender[0].checked && !gender[1].checked && !gender[2].checked) {
						document.getElementById("gendererror").innerHTML = "Please choose your Gender: Male or Female or Other";
						return false;
					} else {
						document.getElementById("gendererror").innerHTML = "";
					}

					let date = document.forms["userform"]["dateOfBirth"].value;
					if (date == "") {
						document.getElementById("doberror").innerHTML = "Date must be required!";
						return false;
					} else {
						document.getElementById("doberror").innerHTML = "";
					}

					let password = document.forms["userform"]["password"].value;
					if (password == "") {
						document.getElementById("passworderror").innerHTML = "Password must be required!";
						return false;
					} else {
						document.getElementById("passworderror").innerHTML = "";
					}

					let confirmpassword = document.forms["userform"]["confirmpassword"].value;
					if (confirmpassword == "") {
						document.getElementById("confirmpasserror").innerHTML = "Password must be required!";
						return false;
					} else if (confirmpassword != password) {
						document.getElementById("confirmpasserror").innerHTML = "Passwords do not match.";
						return false;
					} else {
						document.getElementById("confirmpasserror").innerHTML = "";
					}
					userSubmit();
				}

				function clearValidationData() {
					document.getElementById("firstnameerror").innerHTML = "";
					document.getElementById("lastnameerror").innerHTML = "";
					document.getElementById("roleselecterror").innerHTML = "";
					document.getElementById("emailerror").innerHTML = "";
					document.getElementById("mobilenumbererror").innerHTML = "";
					document.getElementById("gendererror").innerHTML = "";
					document.getElementById("doberror").innerHTML = "";
					document.getElementById("passworderror").innerHTML = "";
					document.getElementById("confirmpasserror").innerHTML = "";
				}



				function userSave() {
					var userForm = document.getElementById('userform');
					var formData = new FormData(userForm);
					document.getElementById("userid").value = "";
					var firstName = document.getElementById('firstName').value;
					var lastName = document.getElementById('lastName').value;

					var fullName = firstName + " " + lastName;
					var email = document.getElementById('email').value;
					var mobileNumber = document.getElementById('mobileNumber').value;
					var dateOfBirth = document.getElementById('dateOfBirth').value;
					var genderObj = document.getElementsByName('gender');
					var gender;
					for (var i = 0; i < genderObj.length; i++) {
						if (genderObj[i].checked == true) {
							gender = genderObj[i].value;
						}
					}

					//var genderval = document.getElementById('male').checked;
					var password = document.getElementById('password').value;
					//var roles = $('#roleSelect').val();

					const userObj = {
						fullName: fullName,
						//roles: roles,
						email: email,
						mobileNumber: mobileNumber,
						dateOfBirth: dateOfBirth,
						gender: gender,
						password: password
					}

					
					$.ajax({
						url: "http://localhost:8080/userService/createUser",
						data: JSON.stringify(userObj),
						processData: false,
						contentType: 'application/json',
						type: 'POST',
						success: function (results) {
							$("#user-add").fadeTo(2000, 800).slideUp(800, function () {
								$("#user-add").slideUp(1000);

							});

							setTimeout(function () {
								window.location.reload();
							}, 900);
						}

					});
				}

				function clearUserData() {
					//document.getElementById("userId").value = "";
					document.getElementById("userform").reset();
				}
			</script>
			<!---------------------------User Add End------------------------------------>
			<!-----------------------------------------User Form Data Add End--------------------------------------->
			<script type="text/javascript">
				var emptyRow = "<tr><td colspan='6' class='text-center'> No Records Available</td></tr>";
				var emptyNewRow = "<tr class='trNewRow'>";

				$(document).ready(function () {
					loadUserData();
					loadrolecategories();
					$("#tblData tbody").append(emptyRow);

					$("#btnAdd").click(function () {
						if ($("#tblData tbody").children().children().length == 1) {
							$("#tblData tbody").html("");
						}
						$("#tblData tbody").prepend(emptyNewRow);
					});
				});

				$("#tblData").on('click', '.btn-danger', function () {
					const id = $(this).data('id');
					document.getElementById("user_id").value = id;
				});

				function loadUserData(pageNumber) {
					$.ajax({
						type: "GET",
						url: "http://localhost:8080/userService/users",
						contentType: false,
						processData: false,
						data: "",
						beforeSend: function () {
							$("#trLoader").remove();
						},
						success: function (results) {
							let userlist = results?.data;
							var totalpage = results.totalPages;
							$("#trLoader").show();
							if ($("#tblData tbody").children().children().length == 1) {
								$("#tblData tbody").html("");
							}

							for (var i = 0; i < userlist?.length || 0; i++) {
								let dynamicTR = "<tr>";
								dynamicTR = dynamicTR + "<td style='display:none;'>" + userlist[i].userId + "</td>";
								dynamicTR = dynamicTR + "<td>" + userlist[i].fullName + "</td>";
								dynamicTR = dynamicTR + "<td>" + userlist[i].email + "</td>";
								dynamicTR = dynamicTR + "<td>" + userlist[i].mobileNumber + "</td>";
								dynamicTR = dynamicTR + "<td class='tdaction'>" + "<button  class='btn btn-primary btn-sm btn-edit' data-toggle='modal' data-target='#userModal' onclick='openUserModal(\"" + userlist[i].userId + "\");clearValidationData();' id='openUserModal' data-id='" + userlist[i].userId + "'> Edit </button>" + "</td>";
								dynamicTR = dynamicTR + "<td class='tdaction'><button type='button' class='btn btn-danger btn-sm' data-toggle='modal' data-target='#DeleteUserSuccess'  data-id='" + userlist[i].userId + "'>Delete</button></td>";
								dynamicTR = dynamicTR + "</tr>";
								$("#tblData tbody").append(dynamicTR);
							}
							$('#pagination').html("");
							for (var j = 1; j <= totalpage; j++) {
								$('#pagination').append(
									'<li class="page-item"><button class="page-link" onclick="initPageNumbers('
									+ (j - 1) + ')" href="#">' + j
									+ '</button></li>');
							}
						}
					});
				}

			</script>
			<!----------------------------------------To Show data  on edit popup Form start----------------------------------------------------->
			<script>
				function userSubmit() {
					const userId = document.getElementById("userid").value;
					if (userId) {
						userEdit();
					} else {
						userSave();
					}
				}

				//  < !------------------------------------------------------------------>
				function openUserModal(userId) {

					$.ajax({
						type: "GET",
						url: "http://localhost:8080/userService/user/" + userId,
						contentType: 'application/json',
						processData: false,
						data: "",
						success: function (results) {

							const fullName = results.fullName;
							var names = [];
							names = fullName.split(" ");
							const firstName = names[0];
							const lastName = names[1];
							$('#userid').val(results.userId);
							$('#firstName').val(firstName);
							$('#lastName').val(lastName);
							$('#email').val(results.email);
							$('#mobileNumber').val(results.mobileNumber);
							if (results.gender == "male") {
								$('#male').attr('checked', 'checked');
							} else if (results.gender == "female") {
								$('#female').attr('checked', 'checked');
							} else if (results.gender == "other") {
								$('#other').attr('checked', 'checked');
							}
							$('#dateOfBirth').val(results.dateOfBirth);


						}
					});
				}

				function userEdit() {
					var userId = document.getElementById("userid").value;
					var firstName = document.getElementById('firstName').value;
					var lastName = document.getElementById('lastName').value;
					const fullName = firstName + " " + lastName;
					var email = document.getElementById('email').value;
					var mobileNumber = document.getElementById('mobileNumber').value;
					var dateOfBirth = document.getElementById('dateOfBirth').value;
					var password = document.getElementById('password').value;
					var genderObj = document.getElementsByName('gender');
					var gender;
					for (var i = 0; i < genderObj.length; i++) {
						if (genderObj[i].checked == true) {
							gender = genderObj[i].value;
						}
					}
					//	var roles = $('#roleSelect').val();

					const userObj = {
						"userId": userId,
						fullName: fullName,
						//roles: roles,
						email: email,
						mobileNumber: mobileNumber,
						dateOfBirth: dateOfBirth,
						gender: gender,
						password: password
					}
		

					$.ajax({
						url: "http://localhost:8080/userService/updateUser",
						data: JSON.stringify(userObj),
						processData: false,
						contentType: 'application/json',
						type: 'PUT',
						success: function (user) {
							$("#user-update").fadeTo(2000, 800).slideUp(800, function () {
								$("#user-update").slideUp(1000);

							});

							setTimeout(function () {
								window.location.reload();
							}, 900);
						}
					});

				}
  //<!------------------------------------------------------------------>

			</script>
			<script>
				function userDelete() {
					const id = $('#user_id').val();
					$.ajax({
						type: "DELETE",
						url: "http://localhost:8080/userService/deleteUser/" + id,
						contentType: false,
						processData: false,
						data: "",
						beforeSend: function () {
							$("#trLoader").show();
						},
						success: function (results) {
							$("#user-delete").fadeTo(2000, 800).slideUp(800, function () {
								$("#user-delete").slideUp(1000);
							});
							setTimeout(function () {
								window.location.reload();
							}, 900);
						}
					});
				} 
			</script>

			<!-----------------------------------------------To Show data  on edit popup Form End----------------------------->

			<script>
				function loadrolecategories() {
					$.ajax({
						type: "GET",
						url: baseURL + "/roles/list",
						contentType: false,
						processData: false,
						data: "",
						success: function (result) {
							createRoleSelectBox(result);
						}
					});
				}

				function createRoleSelectBox(roles) {
					const roleList = roles.data;
					if (roleList && roleList.length > 0) {
						for (var i = 0; i < roleList.length; i++) {
							$('#roleSelect').append('<option  value="' + roleList[i].roleId + '">' + roleList[i].roleName + '</option>');
						}
					}
				}
			</script>


	</body>