	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="common-css.jsp"></jsp:include>
<jsp:include page="common-js.jsp"></jsp:include>


<% 
	 String username = (String)request.getSession().getAttribute("	"); 
	String fullName = (String)request.getSession().getAttribute("fullName"); 
	String token = (String)request.getSession().getAttribute("CSRFToken"); 
	if(null == token){
		response.sendRedirect("/login");
	} 
%>
<style>
.alert{
    display: none;
}
</style>
<body>
	<%-- <%
if(request.getSession().getAttribute("CSRFToken") != null){
%> --%>

	<!-- -------------------------------------------header start----------------------------------------------->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- -------------------------------------------header end------------------------------------------------->
 <div class="alert alert alert-danger alert-dismissable" id="alert-danger">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            Select product to update..
        </div>
       


 <div class="alert alert-success alert-dismissable" id="alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            Product updated successfully!
        </div>
        
<div class="modal fade" id="your-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<center><div id="result"></div></center>

</div>
	<div class="modal fade" id="Update_products_model" tabindex="-1"
		role="dialog" aria-labelledby="AllUpdate_product" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Update
						Products</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				
				<div class="modal-body">
					<div class="form-group">
						<label>Slug Name</label>
						<div class="input-group">
							<input type="text" class="form-control" id="updateslugName"
								placeholder="Enter Slug Name" onKeyUp="showResults(this.value)" />
							<div class="input-group-append"></div>
						</div>
						<div id="showupsluglist">
							<ul class="list-group"></ul>
						</div>


						<div>
							<sapn>Seleted slugs:</sapn>
							<p id="seleted_slugs"></p>
						</div>
					</div>

					<div class="form-group">
						<label>Label Name</label>
						<div class="input-group">
							<input type="text" class="form-control" id="updateProductLabel"
								placeholder="Enter Label Name"
								onKeyUp="showLabelResults(this.value)" />
							<div class="input-group-append"></div>
						</div>
						<div id="showuplabellist">
							<ul class="list-group"></ul>
						</div>


						<div>
							<sapn>Seleted Labels:</sapn>
							<p id="seleted_labels"></p>
						</div>
					</div>


					<div class="form-group">
						<label>Intro</label> <input type="text" class="form-control"
							id="updateProductInto" placeholder="Enter Intro">
					</div>
					<div class="form-group">
						<label>ByLine</label> <input type="text" class="form-control"
							id="updateProductByLine" placeholder="Enter ByLine">
					</div>
					<div class="form-group">
						<label>AboutTheBrand</label> <input type="text"
							class="form-control" id="updateProductAboutTheBrand"
							placeholder="Enter AboutTheBrand">
					</div>
					<div class="form-group">
						<label>ServiceCode</label> <input type="text" class="form-control"
							id="updateProductServiceCode" placeholder="Enter ServiceCode">
					</div>
					<div class="form-group">
						<label>Keyword</label> <input type="text" class="form-control"
							id="updateProductKeyword" placeholder="Enter Keyword">
					</div>
					<div class="form-group">
						<label>MixedFile</label> <input type="text" class="form-control"
							id="updateProductMixedFile" placeholder="Enter MixedFile">
					</div>
					<div class="form-group">
						<label>File3d</label> <input type="text" class="form-control"
							id="updateProductFile3d" placeholder="Enter File3d">
					</div>
					<div class="form-group">
						<label>ImageTransition</label> <input type="text"
							class="form-control" id="updateProductFile3d"
							placeholder="Enter ImageTransition">
					</div>
					<div class="form-group">
						<label>videoTransition</label> <input type="text"
							class="form-control" id="videoTransition"
							placeholder="Enter videoTransition">
					</div>
					<div class="alert alert-success alert-dismissable"
                        id="alert-keyword-save">
                        <button type="button" class="close" data-dismiss="alert"
                           aria-hidden="true">&times;</button>
                        Keyword Added successfully!
                     </div>
                     <span> <b>Keywords:</b></span>
                     <div>
                        <div class="position-relative form-group">
                           <label for="keywordKey" class="">Keyword Key</label> <input
                              name="keywordKey" id="keywordKey"
                              placeholder="Enter Keyword Key" type="text"
                              class="form-control" maxlength="500"  required>
                           <small style="color:red;" id="keywordKeyError"></small>
                        </div>
                        <div class="position-relative form-group">
                           <label for="keywordValue" class="">Keyword Url</label> <input
                              name="keywordValue" id="keywordValue"
                              placeholder="Enter Keyword Value" type="text"
                              class="form-control" maxlength="50">
                           <small style="color:red;" id="keywordValueError"></small>
                        </div>
                        <div class="position-relative form-group text-center">
                           <button type="button" id="keywordclear"
                              class="btn btn-secondary" onclick="clearKeyword()">Clear</button>
                           <button type="button" id="keywordsave" class="btn btn-primary"
                              onclick="saveKeyword()">Save</button>
                        </div>
                        <table id="keywordTable" class="table table-striped" style="font-size: 12px;">
                           <tr>
                              <th>Keyword Key</th>
                              <th>Keyword Value</th>
                              <th>Action</th>
                           </tr>
                        </table>
                        </div>
					
				<span style="color:red; font-weight:bold" id="ProductFormError"></span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						id="close_Updateproduct_modal" data-dismiss="modal">Close</button>
					<button type="button" id="UpdateProducts" class="btn btn-primary" >Save</button>
				</div>
			</div>
		</div>
	</div>

	<!--update end---------------------------->
	<!--update slug start---------------------------->

	<div class="modal fade" id="Update_slug" tabindex="-1" role="dialog"
		aria-labelledby="AllUpdate_slug" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Update Slug</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label>Slug Name</label> <input type="text" class="form-control"
								id="updateslugNameInslug1" placeholder="Enter Slug Name">
						</div>
						<div class="form-group">
							<label for="exampleFormControlSelect1">Slug state</label> <select
								class="form-control" id="updateslugState">
								<option value="InActive" selected>InActive</option>
								<option value="Active">Active</option>
							</select>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						id="close_updateslug_modal" data-dismiss="modal">Close</button>
					<button type="button" id="update_tbslug" class="btn btn-primary">Save</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--update slug end---------------------------->
	<!--update label start---------------------------->

	<div class="modal fade" id="Update_label" tabindex="-1" role="dialog"
		aria-labelledby="update_label" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Update
						Label</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label>Label Name</label> <input type="text" class="form-control"
								id="updatelabel" placeholder="Enter Label Name">
						</div>
						<div class="form-group">
							<label for="exampleFormControlSelect1">Slug state</label> <select
								class="form-control" id="updatelabelState">
								<option value="InActive" selected>InActive</option>
								<option value="Active">Active</option>
							</select>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						id="close_updatelabel_modal" data-dismiss="modal">Close</button>
					<button type="button" id="update_tblabel" class="btn btn-primary">Save</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--update slug end---------------------------->
	<!--update slug start---------------------------->

	<div class="modal fade" id="Delete_slug" tabindex="-1" role="dialog"
		aria-labelledby="AllUpdate_slug" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Delete Slug</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<input type="hidden" class="form-control" name="id" id="slug_id">
						</div>
						<center>
							<p>Are You Sure?</p>
						</center>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						id="close_Delete_modal" data-dismiss="modal">Close</button>
					<button type="button" id="slug_delete_confirm"
						class="btn btn-danger">Yes! Delete It</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--update slug end---------------------------->



	<!-- ADD Tag Modal -->

	<div class="modal fade" id="AddTags" tabindex="-1" role="dialog"
		aria-labelledby="AddTags" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Add New
						Slug</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="exampleInputEmail1">Slug Name</label> <input
								type="text" class="form-control" id="slugName"
								placeholder="Enter Slug">
								<small style="color:red;" id="slugNameError"></small>
						</div>
						<div class="form-group">
							<label for="exampleFormControlSelect1">Slug state</label> <select
								class="form-control" id="slugState">
								<option value="0" selected>InActive</option>
								<option value="1">Active</option>
							</select>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						id="close_addnewslug_modal" data-dismiss="modal">Close</button>
					<button type="button" id="save_data" class="btn btn-primary">Save</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- ADD Tag Modal -->


	<!-- ADD Lable Start -->

	<div class="modal fade" id="AddLabels" tabindex="-1" role="dialog"
		aria-labelledby="AddLabels" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Add New
						Label</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="inputLabel">Label Name</label> <input type="text"
								class="form-control" id="labelName" placeholder="Enter Label">
								<small style="color:red;" id="lableNameError"></small>
						</div>
						<div class="form-group">
							<label for="exampleFormControlSelect1">Label state</label> <select
								class="form-control" id="labelState">
								<option value="0" selected>InActive</option>
								<option value="1">Active</option>
							</select>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						id="close_savelabel_modal" data-dismiss="modal">Close</button>
					<button type="button" id="save_label" class="btn btn-primary">Save</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- ADD Lable End -->
	<!--Delete Label start---------------------------->

	<div class="modal fade" id="Delete_label" tabindex="-1" role="dialog"
		aria-labelledby="delete_label" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Delete
						Label</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<input type="hidden" class="form-control" name="id" id="label_id">
						</div>
						<center>
							<p>Are You Sure?</p>
						</center>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						id="close_Delete_modal" data-dismiss="modal">Close</button>
					<button type="button" id="label_delete_confirm"
						class="btn btn-danger">Yes! Delete It</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--Delete Label End---------------------------->
	
	<!-- Upload Modal Start -->
	
	<div class="modal fade" id="upload_files" tabindex="-1" role="dialog"
		aria-labelledby="upload_files" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Upload Images/Videos</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					 <input name="id" id="upload_productId" type="hidden" class="form-control">
                        <label for="images" class="">Upload Images/Videos : </label> 
                        <input type="file" id="product_images" multiple />
                        <small style="color:red;" id="imageError"></small>
						
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						id="close_Delete_modal" data-dismiss="modal">Close</button>
					<button type="button" id="label_delete_confirm"
						class="btn btn-primary" onclick="uploadBlogFiles()">Upload</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Upload Model End -->

	<!----------------ends modals--------------------------------------------------->

	<div class="container-fluid ">

		<div class="row">
			<div class="container card col-md-6 ">
				<div class="card-body">
					<button type='button' class='btn btn-primary m-2 float-right'
						data-toggle='modal' id="Update_products_model_button"
						data-target='#Update_products_model'>Update</button>
						
						
						
					<h5 class="card-title">Products</h5>
					<table class="table table-hover mt-4">
						<thead>
							<tr>
								<th><input type="checkbox" id="selectAll" value="selectAll"></th>
								<th>ProductName</th>
								<th>BrandName</th>
								<th>Color</th>
								<th>action</th>
							</tr>
						</thead>
						<tbody id="tbody">
						</tbody>
					</table>
					<nav aria-label="Page navigation example">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</div>


			<div class="container card col-md-4 ">
				<div class="card-body">
					<button type="button" class="btn btn-primary m-2 float-right"
						data-toggle="modal" data-target="#AddTags">+ADD</button>
					<h5 class="card-title">Product Slug</h5>
					<table class="table table-hover mt-4">
						<thead>
							<tr>
								<th>Product Slug Name</th>
								<th style="display: none;">Product Slug Name</th>
								<th>Update</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody id="tslug">
						</tbody>
					</table>
					<nav aria-label="Page navigation example">
						<ul class="pagination" id="Slug_pagination"></ul>
					</nav>
				</div>
			</div>

			<div class="container card col-md-6">
				<div class="card-body">
					<button type="button" class="btn btn-primary m-2 float-right"
						data-toggle="modal" data-target="#AddLabels">+ADD</button>
					<h5 class="card-title">Product Label</h5>
					<table class="table table-hover mt-4">
						<thead>
							<tr>
								<th>Product Label Name</th>
								<th style="display: none;">Product Label Name</th>
								<th>Update</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody id="tlabel">
						</tbody>
					</table>
					<nav aria-label="Page navigation example">
						<ul class="pagination" id="label_pagination"></ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	 
</body>
<script>
	var baseURL = '${pageContext.servletContext.contextPath}';
	var pageNumber = 0;
	var search_terms = [];
	var search_label_terms = [];
	var keywordData = [];
	  function saveKeywordValidation(obj){
    	  
	      	var error=false;
	      	if(obj?.key==="" || obj?.key===null){
	            	 document.getElementById('keywordKeyError').innerHTML="Please Enter Keyword Key";
	            	error= true;
	           }else{
	        	   document.getElementById('keywordKeyError').innerHTML="";
	           }
	      	if(obj?.value==="" || obj?.value===null){
	          	 document.getElementById('keywordValueError').innerHTML="Please Enter Keyword Value";
	          	 error= true;
	           }else if(obj?.value.match(/(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/g)==null){
	       	    document.getElementById('keywordValueError').innerHTML="Please Enter Correct Url ( Ex: https://www.xyz.com/ )";
	       		error= true;
	       }else{
	        	   document.getElementById('keywordValueError').innerHTML="";
	           }
	      	
	      	return error;
	      }
	
	function saveKeyword() {
    	keyword = {}
    	var key = document.getElementById("keywordKey").value?.trim();
    	var value = document.getElementById("keywordValue").value?.trim();
    	
    	if(saveKeywordValidation({key,value})===true){
    		return false;
    	}
    	
    	if(key && value && key.length>0 && value.length>0) {
    		keyword ["key"] = key;
    		keyword ["value"] = value;

    		keywordData.push(keyword);
    		if(keywordData && keywordData.length > 0) {
    			var keywordTable = document.getElementById("keywordTable");
                	var row = keywordTable.insertRow(1);
                    var cell1 = row.insertCell(0);
                    var cell2 = row.insertCell(1);
                    var cell3 = row.insertCell(2);
                    cell1.innerHTML = key;
                    cell2.innerHTML = value;
                    cell3.innerHTML ="<button type='button' class='btn btn-danger btn-sm' onclick='deleteAddKeyword(this)' id='"+(keywordData.length-1)+"'>Delete</button>"; 
                	
    			showKeywordSuccessMessge();
    			clearKeyword();
    		}
    	}
    }
  
  function deleteAddKeyword(btn){
	  var row = btn.parentNode.parentNode;
	  row.parentNode.removeChild(row);
	  $("#keywordTable").find("tr:gt(0)").remove(); 
	  keywordData=keywordData.filter((data,index)=>index != btn.attributes.id.value);
  	var keywordTable = document.getElementById("keywordTable");
  	keywordData?.map((item,index) => {
        	if(item){
        		var row = keywordTable.insertRow(1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                cell1.innerHTML = item.key;
                cell2.innerHTML = item.value;
                cell3.innerHTML ="<button type='button' class='btn btn-danger btn-sm' onclick='deleteAddKeyword(this)' id='"+index+"'>Delete</button>"; 
            	}
        });
  }
    
    function showKeywordSuccessMessge(){
    	$("#alert-keyword-save").fadeTo(2000, 500).slideUp(500, function() {
    			$("#alert-keyword-save").slideUp(1000);
    	});  
    }
  
  function clearKeyword() {
      	document.getElementById("keywordKey").value = "";
      	document.getElementById("keywordValue").value = ""; 
    }

	function initPageNumbers(pageNumber) {
				$.ajax({
					type : "get",
					url : baseURL + "/products?page=" + pageNumber,
					//data: "pageNumber=" + JSON.stringify(pageNumber),               
					success : function(prodata) {
						var Products = [];
						Products = prodata.products;
						var totalRecords = prodata.totalItems;
						var totalpage = prodata.totalPages;
						$("#tbody").html("");
						for (i = 0; i < Products.length; i++) {
							$('#tbody').append('<tr>');
							$('#tbody')
									.append(
											'<td><input type="checkbox" class="myCheckBox" name="productId" value="'+Products[i].skuCode+'" id="'+Products[i].skuCode+'"></td>');
							$('#tbody').append(
									"<td>" + Products[i].skuName + "</td><td>"
											+ Products[i].brandText
											+ "</td><td>" + Products[i].color
											+ "</td><td><button type='button' class='btn btn-primary btn-sm' id='uploadFiles' data-toggle='modal' data-target='#upload_files' onclick='openUploadModal(\""+Products[i].uId+"\")' >Upload File</button>"
											+ "</td>");
							$('#tbody').append('</tr>');
						}

						$('#pagination').html("");

						for (var j = 1; j <= totalpage; j++) {
							$('#pagination').append(
									'<li class="page-item"><button class="page-link" onclick="initPageNumbers('
											+ (j-1) + ')" href="#">' + j
											+ '</button></li>');
						}
					},
				});
	}
	
	function openUploadModal(id){
		console.log(id);
	
		$('#upload_productId').val(id);
	}
	
	function uploadBlogFiles(){
		
	var id=document.getElementById("upload_productId").value;
	var productfiles=document.getElementById("product_images");
	
		var productFormData = new FormData();
        var productFiles = productfiles.files;
        if(productFiles){
      	  for(var i=0;i<productFiles.length;i++) {
      		productFormData.append('productFiles', productFiles[i]);
       	  }
        }
      	productFormData.append("id",id);
      	productFormData.append("type","product");
      	  
	          $.ajax({
	       	        url : baseURL + "/uploadFiles",
	       	        data : productFormData,
	       	        	   processData : false,
	       	          	   contentType: false,
	       	          	   type : 'POST',
	       	          	   success : function(data) {
	       	          		   
	       	          	   },
	       	       	 
	       	       error : function(err) {
	       	        	 console.log(err);
	       	       }
	       	  });
        }
	

	var slugpage = 1;
	function slugsLoad(slugpage) {
		slugpage = slugpage * 10;
		$
				.ajax({
					type : "POST",
					url : baseURL + "/productSlugList",
					success : function(data) {
						var Slugdata = JSON.parse(data);
						var total_page = Math.ceil(Slugdata.length / 10);
						$("#tslug").html("");
						for (var i = (slugpage - 10); i < slugpage; i++) {
							if (Slugdata[i]) {
								$('#tslug')
										.append(
												"<tr><td>"
														+ Slugdata[i].slugName
														+ "</td><td style=' display:none;'>"
														+ Slugdata[i].slugId
														+ "</td><td><button type='button' class='btn btn-primary update_slugtb' data-toggle='modal' data-target='#Update_slug'>Update</button></td><td><button type='button' class='btn btn-primary delete_slugtb' data-toggle='modal' data-target='#Delete_slug'>Delete</button></td></tr>");
							}
						}
						$('#Slug_pagination').html("");
						for (var j = 1; j <= total_page; j++) {
							$('#Slug_pagination').append(
									'<li class="page-item"><button class="page-link" onclick="slugsLoad('
											+ (j) + ')" href="#">' + j
											+ '</button></li>');
						}

					}
				});
	}

	var labelpage = 1;
	function labelsLoad(labelpage) {
		labelpage = labelpage * 10;
		$
				.ajax({
					type : "POST",
					url : baseURL + "/product/label/list",
					success : function(data) {
						var labelsData = JSON.parse(data);
						var total_page = Math.ceil(labelsData.length / 10);
						$("#tlabel").html("");
						for (var i = (labelpage - 10); i < labelpage; i++) {
							if (labelsData[i]) {
								$('#tlabel')
										.append(
												"<tr><td>"
														+ labelsData[i].labelName
														+ "</td><td style=' display:none;'>"
														+ labelsData[i].labelId
														+ "</td><td><button type='button' class='btn btn-primary update_labeltb' data-toggle='modal' data-target='#Update_label'>Update</button></td><td><button type='button' class='btn btn-primary delete_labeltb' data-toggle='modal' data-target='#Delete_label'>Delete</button></td></tr>");
							}
						}
						$('#label_pagination').html("");
						for (var k = 1; k <= total_page; k++) {
							$('#label_pagination').append(
									'<li class="page-item"><button class="page-link" onclick="labelsLoad('
											+ (k) + ')" href="#">' + k
											+ '</button></li>');
						}

					}
				});
	}

	$(document)
			.ready(
					function() {

						initPageNumbers(0);
						slugsLoad(1);
						loadAvailableSlugs();

						$("#save_data").click(function() {
							
							var slugName = $('#slugName').val()?.trim();
							if(slugName==="" || slugName===null){
								document.getElementById("slugNameError").innerHTML="Please Enter Slug Name";
								return false;
							}
							$.ajax({
						        type: "GET",
						        url: baseURL+"/productSlugSearch/"+slugName,
						        contentType: false,
				                processData: false,
						        data: "",
						        success : function(data) { 
						        	
						        	if(data.length >0){
						        		document.getElementById("slugNameError").innerHTML="Please Enter Unique Slug Name";
						        		return false;
						        	}
						        	
							    }
						    });
							if(slugName && slugName.length>0) {
							    $.ajax({
							        type: "POST",
							        url: baseURL+"/createProductSlug",
							        data: {slugName:$('#slugName').val(),slugState:$('#slugState').val()},
							        success : function(data) { console.log(data);
							        	slugsLoad(1);
							        	location.reload();
							            document.getElementById("close_addnewslug_modal").click();
								    }
							    });
							}
						});

						labelsLoad(1);
						loadAvailableLabels();	
						$("#save_label").click(function() {
							var labelName = $('#labelName').val()?.trim();
							
							if(labelName==="" || labelName===null){
								document.getElementById("lableNameError").innerHTML="Please Enter Lable Name";
				        		return false;
							}
							
							$.ajax({
						        type: "GET",
						        url: baseURL+"/getLabel/"+labelName,
						        contentType: false,
				                processData: false,
						        data: "",
						        success : function(data) { 
						        	
						        	if(!data || data===null || data===""){
						        		document.getElementById("lableNameError").innerHTML="Please Enter Unique Lable Name";
						        		return false;
						        	}
						        	
							    }
						    });
							
							if(labelName && labelName.length>0) {
							    $.ajax({
							        type: "POST",
							        url: baseURL+"/product/label/create",
							        data: {labelName:$('#labelName').val(),state:$('#labelState').val()},
							        success : function(data) { 
							        	initPageNumbers(0);
							        	labelsLoad(1);
							        	location.reload();
							            document.getElementById("close_savelabel_modal").click();
								    }
							    });
							}
						});

						$("#update_tblabel").click(function() {	
						    $.ajax({
						        type: "POST",
						        url: baseURL+"/product/label/update",
						        data: {labelName:$('#updatelabel').val(),Id:$('#label_id').val(),state:$('#updatelabelState').val()},
						        success : function(data) { 
						        	labelsLoad(1);
						        	location.reload();
						            document.getElementById("close_updatelabel_modal").click();
							    }
						    });
						});

						$("#label_delete_confirm").click(function() {
							var labelId = $('#label_id').val();
							var deleteLabelURL = baseURL+"/product/label/delete/" + labelId;
						    $.ajax({
						        type: 'POST',
						        url: deleteLabelURL,
						        success : function(data) {
						        	labelsLoad(1);
						        	location.reload();
						        	document.getElementById("Delete_label").click();
							    }
						    });
						});


						$("#slug_delete_confirm").click(function() {
							var slugId = $('#slug_id').val();
							var deleteSulgURL = baseURL+"/deleteProductSlug/" + slugId;
						    $.ajax({
						        type: 'POST',
						        url: deleteSulgURL,
						        success : function(data) {
						        	slugsLoad(1);
						        	location.reload();
						        	document.getElementById("close_Delete_modal").click();
							    }
						    });
						});



						$("#update_tbslug").click(function() {	
						    $.ajax({
						        type: "POST",
						        url: baseURL+"/updateProductSlug",
						        data: {slugName:$('#updateslugNameInslug1').val(),Id:$('#slug_id').val(),state:$('#updateslugState').val()},
						        success : function(data) { 
						        	slugsLoad(1);
						        	location.reload();
						            document.getElementById("close_updateslug_modal").click();
							    }
						    });
						});



						$("#UpdateProducts").click(function() {
							var productIds = get_selected_checkboxes_array();
							var slugList = document.getElementById("seleted_slugs").innerHTML;// document.getElementById('seleted_slugs').getAttribute('value');
						    var selectedLabel = document.getElementById("seleted_labels").innerHTML;// document.getElementById('seleted_slugs').getAttribute('value');
						    
						    var updateProductInto =$('#updateProductInto').val()
						    var updateProductByLine =$('#updateProductByLine').val()
						    var updateProductAboutTheBrand =$('#updateProductAboutTheBrand').val()
						    var updateProductServiceCode =$('#updateProductServiceCode').val()
						    var updateProductKeyword =$('#updateProductKeyword').val()
						    var updateProductMixedFile =$('#updateProductMixedFile').val()
						    var updateProductFile3d =$('#updateProductFile3d').val()
						    var imageTransition =$('#imageTransition').val()
						    var videoTransition =$('#videoTransition').val()
						     const keywords = keywordData;

						    if(!slugList && !selectedLabel && !updateProductInto && !updateProductByLine && !updateProductAboutTheBrand && !updateProductServiceCode && !updateProductKeyword && !updateProductMixedFile && !updateProductFile3d && !imageTransition && !videoTransition && keywords.length == 0){
						    	document.getElementById("ProductFormError").innerHTML="*Please enter atleast one field";
						    	return false;
						    }

						    
						    $.ajax({
						        type: "POST",
						        url: baseURL+"/updateProduct",
						        data: { slugName:"'"+slugList+"'",
						        	    label:"'"+selectedLabel+"'",
						        	    productIdList: "'"+productIds+"'",
						        	    updateProductInto: updateProductInto,
						        	    updateProductByLine: updateProductByLine,
						        	    updateProductAboutTheBrand: updateProductAboutTheBrand,
						        	    updateProductServiceCode: updateProductServiceCode,
						        	    updateProductKeyword: updateProductKeyword,
						        	    updateProductMixedFile: updateProductMixedFile,
						        	    updateProductFile3d: updateProductFile3d,
						        	    imageTransition: imageTransition,
						        	    videoTransition: videoTransition,
						        	    keywords:keywords,						        	
						        },
						        success : function(data) {
							        	 document.getElementById("close_Updateproduct_modal").click();
							        	 //$('#Update_products_model').modal('hide');
							        	 //$('.modal').each(function(){$(this).modal('hide');});
							             $("#alert-success").fadeTo(2000, 500).slideUp(500, function(){
									            $("#alert-success").slideUp(1000);
									     });  
							             setTimeout(function () {

					                            window.location.reload();

					                        }, 500);
							             /* setTimeout(function () {
							                 location.reload(true);
							               }, 3000);
							             location.reload(); */

							    }
						    });
						});

						$("#tbody").on('click','.update_btn_product',function(){
						     // get the current row
						     var currentRow=$(this).closest("tr"); 
						     
						     var col1=currentRow.find("td:eq(0)").text(); // get current row 1st TD value
						     var col2=currentRow.find("td:eq(1)").text(); // get current row 2nd TD
						     var col3=currentRow.find("td:eq(2)").text(); // get current row 3rd TD
						     document.getElementById("updateProductLabel").value=col1;
						     document.getElementById("updateslugName").value=col2;
						});

						$("#tslug").on('click','.update_slugtb',function(){
						     // get the current row
						     var currentRow=$(this).closest("tr"); 
						     var col1=currentRow.find("td:eq(0)").text();
						     var col2=currentRow.find("td:eq(1)").text();
						     document.getElementById("updateslugNameInslug1").value=col1;
						     document.getElementById("slug_id").value=col2;

						});

						$("#tlabel").on('click','.update_labeltb',function(){
						    // get the current row
						    var currentRow=$(this).closest("tr"); 
						    var col1=currentRow.find("td:eq(0)").text();
						    var col2=currentRow.find("td:eq(1)").text();
						    document.getElementById("updatelabel").value=col1;
						    document.getElementById("label_id").value=col2;

						});


						$("#tslug").on('click','.delete_slugtb',function(){
						    // get the current row
						    var currentRow=$(this).closest("tr"); 
						    var col1=currentRow.find("td:eq(1)").text();
						    document.getElementById("slug_id").value=col1;
						});

						$("#tlabel").on('click','.delete_labeltb',function(){
						    // get the current row
						    var currentRow=$(this).closest("tr"); 
						    var col1=currentRow.find("td:eq(1)").text();
						    document.getElementById("label_id").value=col1;
						});

						$('#updateslugName').keyup(function() {
							var searchValue =  document.getElementById("updateslugName").value;
							if(searchValue && searchValue !== '') {
								  var res = document.getElementById("showupsluglist");
								  console.log(res);
								  res.innerHTML = '';
								  let list = '<br>';
								  let terms = autocompleteMatch(searchValue);
								  for (i=0; i<terms.length; i++) {
								    list += '<button class="btn btn-outline-dark" onclick="seleted_slug(this.value)" value="'+ terms[i] + '">' + terms[i] + '</button>';
								  }
								  res.innerHTML = list;
							}
						}); 

						$(document).on('click', 'li', function() {
							$('#showupsluglist').val($(this).text());
						});

						$('#selectAll').click(function() {
							if (this.checked) {
								$(':checkbox').each(function() {
									this.checked = true;
								});
							} else {
								$(':checkbox').each(function() {
									this.checked = false;
								});
							}
						});

						function get_selected_checkboxes_array() {
							var ids_list = Array();
							$("input:checkbox[type=checkbox]:checked").each(
									function() {
										ids_list.push($(this).val());
									});
							return ids_list;
						}
						
						/* window.setTimeout(function() {
						    $(".alert").fadeTo(1000, 0).slideUp(1000, function(){
						    	
						    	$(this).remove(); 
						    	$(this).parent().hide();
						    });
						}, 5000); */
						
						 $('#Update_products_model_button').click(function(){
							 
							 var productIds = get_selected_checkboxes_array();
								if(productIds.length<=0){
									 $("#alert-danger").fadeTo(2000, 500).slideUp(500, function(){
								            $("#alert-danger").slideUp(1000);
								     });  
									 return false;
								}
								return true;
						    });
					
						 $('#alert-danger .close').click(function(){
						        $(this).parent().hide();
						    });
					});


	
	function loadAvailableSlugs() {
		$.ajax({
			type : 'POST',
			url : '/productSlugList',
			success : function(lldata) {
				search_terms = [];
				var slugArray = [];
				var slugData = JSON.parse(lldata);
				for (var i = 0; i < slugData.length; i++) {
					if (slugData[i].slugName != null) {
						search_terms.push(slugData[i].slugName);
					}
				}
			}
		});
	}

	function loadAvailableLabels() {
		$.ajax({
			type : 'POST',
			url : '/product/label/list',
			success : function(lldata) {
				search_label_terms = [];
				var slugArray = [];
				var labelsData = JSON.parse(lldata);
				for (var i = 0; i < labelsData.length; i++) {
					if (labelsData[i].labelName != null) {
						search_label_terms.push(labelsData[i].labelName);
					}
				}
			}
		});
	}

	function autocompleteMatch(input) {
		if (input == '') {
			return [];
		} else {
			var filterdSlugs = search_terms.filter(function(str) {
				return str.includes(input);
			});
			return filterdSlugs;
		}
	}

	function seleted_slug(val) {
		var slugsStr = document.getElementById("seleted_slugs").innerHTML;
		var values = slugsStr + '' + val + ",";
		document.getElementById("seleted_slugs").innerHTML = values;
	}

	function showResults(val) {
		if (val && val !== '') {
			var res = document.getElementById("showupsluglist");
			console.log(res);
			res.innerHTML = '';
			let list = '<br>';
			let terms = autocompleteMatch(val);
			for (i = 0; i < terms.length; i++) {
				list += '<button class="btn btn-outline-dark" onclick="seleted_slug(this.value)" value="'
						+ terms[i] + '">' + terms[i] + '</button>';
			}
			res.innerHTML = list;
		}
	}

	function seleted_label(val) {
		var labelStr = document.getElementById("seleted_labels").innerHTML;
		var values = val;
		document.getElementById("seleted_labels").innerHTML = values;
	}

	function autocompleteLabelMatch(input) {
		if (input == '') {
			return [];
		} else {
			var filterdLabels = search_label_terms.filter(function(str) {
				return str.includes(input);
			});
			return filterdLabels;
		}
	}

	function showLabelResults(val) {
		if (val && val !== '') {
			var res = document.getElementById("showuplabellist");
			res.innerHTML = '';
			let list = '<br>';
			let terms = autocompleteLabelMatch(val);
			for (i = 0; i < terms.length; i++) {
				list += '<button class="btn btn-outline-dark" onclick="seleted_label(this.value)" value="'
						+ terms[i] + '">' + terms[i] + '</button>';
			}
			res.innerHTML = list;
		}
	}
	
</script>