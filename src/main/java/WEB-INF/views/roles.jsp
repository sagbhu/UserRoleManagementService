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

			<div class="modal fade" id="roleModel" role="dialog">
				<div class="alert alert-success alert-dismissable" id="role-add">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					Role Added Successfully!
				</div>

				<div class="alert alert-success alert-dismissable" id="role-update">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					Role Updated Successfully!
				</div>

				<div class="modal-dialog modal-lg">
					<div class="modal-content">

						<div class="modal-header ">
							<h5 class="modal-title" id="exampleModalLongTitle">Role</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<form class="" method="post" action="" id="roleform" onsubmit="return false">
							<div class="modal-body scroll">

								<input name="roleid" id="roleid" type="hidden" class="form-control">

								<div class="position-relative form-group">
									<label for="roleName" class=""><b>Role Name</b></label> <input name="roleName"
										id="roleName" placeholder="Enter Role Name" type="text" class="form-control"
										maxlength="20" pattern="[A-Za-z]{1,32}" required>
									<b><span id="rolenameerror" style="color: red;"></span></b>
								</div>

								<fieldset>
									<div class="position-relative form-group">
										<label for="rolePermission" class=""> <b>Role
												Permission</b><br> <b><span id="permissionserror"
													style="color: red;"></span></b></label>
									</div>
									<div>


										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="MANAGE_ALL_ADMIN_USERS"> <label>Manage
												All Admin Users</label><br>
										</div>

										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="MANAGE_CATEGORIES/SUB-CATEGORIES">
											<label>Manage Categories/Sub-Categories</label><br>
										</div>

										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="MANAGE_MIS_REPORTS_&_DASHBOARDS">
											<label>Manage MIS Reports & Dashboards</label><br>
										</div>

										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="BLOG_RELATED_TASKS"> <label>Blog
												Related Tasks</label><br>
										</div>

										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="VIEWS_(READ_ONLY)_CONTENT">
											<label>Views (Read Only) Content</label><br>
										</div>

										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="MANAGE_CONTENT_RELATED_USERS">
											<label>Manage Content Related Users</label><br>
										</div>

										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="ARCHIVE_ARTICLE"> <label>Archive
												Article</label><br>
										</div>

										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="WRITE_ARTICLE"> <label>Write
												Article</label><br>
										</div>

										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="SAVE_ARTICLE_DRAFTS"> <label>Save
												Article Drafts</label><br>
										</div>

										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="SUBMIT_ARTICLE_FOR_REVIEW">
											<label>Submit Article for Review</label><br>
										</div>

										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="COMPARE_ARTICLE_VERSIONS">
											<label>Compare Article Versions</label><br>
										</div>

										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="VIEW_ARTICLE_PREVIEW"> <label>View
												Article Preview</label><br>
										</div>

										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="MODIFY_ARTICLE"> <label>Modify
												Article</label><br>
										</div>

										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="SEND_ARTICLE_BACK_WITH_COMMENTS">
											<label>Send Article Back with Comments</label><br>
										</div>

										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="APPROVE/REJECT_ARTICLE"> <label>Approve/Reject
												Article</label><br>
										</div>

										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="PUBLISH_ARTICLE"> <label>Publish
												Article</label><br>
										</div>

										<div class="position-relative form-group">
											<input type="checkbox" name="rolepermissions" id="rolepermissions"
												value="SCHEDULE_ARTICLE_FOR_PUBLISHING">
											<label>Schedule Article for Publishing</label><br>
										</div>
									</div>
								</fieldset>

								<div class="position-relative form-group">
									<label for="description" class=""><b>Role Description</b></label>
									<textarea rows="4" cols="45" name="description" id="description"
										class="form-control" placeholder="Enter Role Description Here.." minlength="3"
										maxlength="40" required></textarea>
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" id="roleclose" data-dismiss="modal"
									onclick="clearRoleData();">Close</button>
								<button type="button" id="roleSubmitdata" class="btn btn-primary"
									onclick="roleSubmit();">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- ----------------------------------------Model End-------------------------------------------- -->

			<div class="container card col-md-6">
				<div class="card-body">
					<button type="button" class="btn btn-primary btn-lg float-right" data-toggle="modal"
						data-target="#roleModel" onclick="clearRoleData();clearValidationData();">+ADD</button>
					<h5 class="card-title">Roles</h5>

					<table class="table table-hover mt-4" id="tblData">
						<thead>
							<tr>
								<th style="display: none;">id</th>
								<th>Role Name</th>
								<th>Description</th>
								<th class="tdaction text-right">Action</th>
								<th></th>
							</tr>
						</thead>

						<tbody id="tbody">
							<tr>
								<td colspan="6" id="trLoader">
									<div class="text-center">Loading .....</div>
								</td>
							</tr>
						</tbody>

					</table>
				</div>
			</div>

			<div class="modal fade" id="DeleteRole" tabindex="-1" role="dialog" aria-labelledby="AllUpdate_slug"
				aria-hidden="true">
				<div class="alert alert-danger alert-dismissable mt-10" id="role-delete">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					Role Deleted Successfully!
				</div>
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">

						<div class="modal-header">
							<h5 class="modal-title">Delete Role</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<input type="hidden" class="form-control" name="id" id="role_id">
							</div>
							<center>
								<p>Are You Sure?</p>
							</center>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" id="close_Delete_modal" data-dismiss="modal"
								onclick="clearRoleData();">Close</button>
							<button type="button" onclick="roleDelete();" class="btn btn-danger">Yes! Delete It</button>

						</div>
					</div>
				</div>
			</div>
			<!-----------------------------------------Role Ajax Script Start--------------------------------------->
			<!-----------------------------------------Role Form Data Add Start--------------------------------------->
			<script type="text/javascript">

				var baseURL = '${pageContext.servletContext.contextPath}';

				function roleFormValidation(roleObj) {
					let name = roleObj.roleName;
					if (name == null || name == "") {
						document.getElementById("rolenameerror").innerHTML = "Role Name must be required!";
						return false;
					} else if (!/^[a-zA-Z0-9]*( [a-zA-Z0-9]*)?$/.test(name)) {
						document.getElementById("rolenameerror").innerHTML = "Enter Valid RoleName!";
						return false;
					} else if ((3 > name.length) || (name.length > 20)) {
						document.getElementById("rolenameerror").innerHTML = "Role name minimum 3 and maxmum 20";
						return false;
					} else {
						document.getElementById("rolenameerror").innerHTML = "";
					}

					let permission = roleObj?.rolepermissions || [];
					if (permission.length <= 0) {
						document.getElementById("permissionserror").innerHTML = "Please Select atleast One Permission";
						return false;
					} else {
						document.getElementById("permissionserror").innerHTML = " ";
					}
					return true;
				}

				function clearValidationData() {
					document.getElementById("rolenameerror").innerHTML = "";
					document.getElementById("permissionserror").innerHTML = "";

				}

				function roleSave() {
					var roleForm = document.getElementById('roleform');
					var formData = new FormData(roleForm);
					var roleName = document.getElementById("roleName").value;
					var roleDataArray = document.getElementsByName("rolepermissions");
					var description = document.getElementById("description").value;

					var roleDataValues = [];
					for (var i = 0; i < roleDataArray.length; i++) {
						if (roleDataArray[i].checked)
							roleDataValues.push(roleDataArray[i].value);
					}

					const roleObj = {
						"roleName": roleName,
						"description": description,
						"rolepermissions": roleDataValues
					}

					if (roleFormValidation(roleObj) === false) {
						return false;
					}
					$.ajax({
						url: baseURL + "/role",
						data: JSON.stringify(roleObj),
						processData: false,
						contentType: 'application/json',
						type: 'POST',
						success: function (results) {
							$("#role-add").fadeTo(2000, 800).slideUp(800, function () {
								$("#role-add").slideUp(1000);
							});

							setTimeout(function () {
								window.location.reload();
							}, 900);
						}
					});
				}

				function clearRoleData() {
					document.getElementById("roleid").value = "";
					document.getElementById("roleform").reset();
				}

			</script>

			<!-----------------------------------------Role Form Data Add End--------------------------------------->

			<script type="text/javascript">
				var emptyRow = "<tr><td colspan='6' class='text-center'> No Records Available</td></tr>";
				var emptyNewRow = "<tr class='trNewRow'>";

				$(document).ready(function () {
					loadRolesData();
					$("#tblData tbody").append(emptyRow);
					$("#btnAdd").click(function () {
						if ($("#tblData tbody").children().children().length == 1) {
							$("#tblData tbody").html("");
						}
						$("#tblData tbody").prepend(emptyNewRow);
					});

					$("#tblData").on('click', '.btn-danger', function () {
						const id = $(this).data('id');
						document.getElementById("role_id").value = id;
					});
				});


				function loadRolesData() {
					$.ajax({
						type: "GET",
						url: baseURL + "/roles/list?size=100",
						//url : baseURL + "/roles/list?roleName=100",
						contentType: false,
						processData: false,
						data: "",
						beforeSend: function () {
							$("#trLoader").remove();
						},
						success: function (results) {
							let roleslist = results?.data;
							$("#trLoader").show();
							if ($("#tblData tbody").children().children().length == 1) {
								$("#tblData tbody").html("");
							}
							$("#tbody").html("");
							for (i = 0; i < roleslist?.length || 0; i++) {
								let dynamicTR = "<tr>";
								dynamicTR = dynamicTR + "<td style='display:none;'>" + roleslist[i].roleId + "</td>";
								dynamicTR = dynamicTR + "<td>" + roleslist[i].roleName + "</td>";
								dynamicTR = dynamicTR + "<td>" + roleslist[i].description + "</td>";
								dynamicTR = dynamicTR + "<td class='tdaction'>" + "<button  class='btn btn-primary btn-sm btn-edit' data-toggle='modal' data-target='#roleModel' onclick='openEditModal(\"" + roleslist[i].roleId + "\");clearValidationData();' id='openEditModal' data-id='" + roleslist[i].roleId + "'> Edit </button>" + "</td>";
								dynamicTR = dynamicTR + "<td class='tdaction'><button type='button' class='btn btn-danger btn-sm' data-toggle='modal' data-target='#DeleteRole'  data-id='" + roleslist[i].roleId + "'>Delete</button> </td>";
								dynamicTR = dynamicTR + "</tr>";
								$("#tblData tbody").append(dynamicTR);
							}
						}
					});
				}
			//	<!------------------------To Show data  on edit popup Form start--------------------------------------- -->
        
					function openEditModal(roleId) {

						$.ajax({
							type: "GET",
							url: baseURL + "/role/" + roleId,
							contentType: 'application/json',
							processData: false,
							data: "",
							success: function (results) {
								var data = results.data;

								$('#roleid').val(data.roleId);
								$('#roleName').val(data.roleName);
								//  if(data.permission==true){
								// $('#rolepermissions').attr('checked','checked');
								// } 
								$('#description').val(data.description);
							}
						});
					}

				//	< !----------------------------------------------- To Show data  on edit popup Form End----------------------------->

						function roleSubmit() {
							var id = document.getElementById("roleid").value;
							if (id == null || id.length <= 0) {
								roleSave();
							} else {
								roleEdit();
							}
						}

						//< !------------------------------------------------------------------>

							function roleEdit() {
								var roleId = document.getElementById("roleid").value;
								var roleName = document.getElementById("roleName").value;
								var roleDataArray = document.getElementsByName("rolepermissions");
								var description = document.getElementById("description").value;

								var roleDataValues = [];
								for (var i = 0; i < roleDataArray.length; i++) {
									if (roleDataArray[i].checked)
										roleDataValues.push(roleDataArray[i].value);
								}

								const roleObj = {
									"roleId": roleId,
									"roleName": roleName,
									"description": description,
									"rolepermissions": roleDataValues
								}

								if (roleFormValidation(roleObj) === false) {
									return false;
								}
								$.ajax({
									url: baseURL + "/role",
									data: JSON.stringify(roleObj),
									processData: false,
									contentType: 'application/json',
									type: 'PUT',
									success: function (role) {
										$("#role-update").fadeTo(2000, 800).slideUp(800, function () {
											$("#role-update").slideUp(1000);
										});

										setTimeout(function () {
											window.location.reload();
										}, 900);
									}
								});

							}
						//	< !------------------------------------------------------------------>

								function roleDelete() {
									const id = $('#role_id').val();
									$.ajax({
										type: "DELETE",
										url: baseURL + "/role/" + id,
										contentType: false,
										processData: false,
										data: "",
										beforeSend: function () {
											$("#trLoader").show();
										},
										success: function (results) {
											$("#role-delete").fadeTo(2000, 800).slideUp(800, function () {
												$("#role-delete").slideUp(1000);
											});
											setTimeout(function () {
												window.location.reload();
											}, 900);
										}
									});
								}

							//	< !------------------------------------------- role List loading end---------------------------------------------------->


			</script>
			<!-----------------------------------------role Ajax Script End--------------------------------------->
	</body>