<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
   <style type="text/css">
      .alert {
      display: none;
      }
   </style>
</head>
<jsp:include page="common-css.jsp"></jsp:include>
<jsp:include page="common-js.jsp"></jsp:include>
<body>

<%
String token = (String)request.getSession().getAttribute("CSRFToken"); 
if(null == token){
	response.sendRedirect("/login");
}
%>
	<!-- -------------------------------------------header start----------------------------------------------->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- -------------------------------------------header end------------------------------------------------->

	<div class="alert alert-success alert-dismissable" id="alert-delete">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">&times;</button>
		Deleted successfully!
	</div>
	<!-- ----------------------------------------Model start-------------------------------------------- -->
	<div>
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header ">
						<h5 class="modal-title" id="exampleModalLongTitle">Blog</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body scroll" id="">
						<form class="" method="post" action="" id="blogform"
							onsubmit="return false">

							<div class="position-relative form-group">
								<label for="title" class="">Title</label> <input name="title"
									id="title" placeholder="Enter Blog Title" type="text"
									class="form-control" maxlength="100" pattern="[A-Za-z]{1,100}"
									required>
							</div>

							<div class="position-relative form-group">
								<label for="subtitle" class="">SubTitle</label> <input
									name="subTitle" id="subTitle"
									placeholder="Enter Blog Sub Title" type="text"
									class="form-control" maxlength="100" pattern="[A-Za-z]{1,100}"
									required>
							</div>

							<div class="alert alert-success alert-dismissable"
								id="alert-content-save">
								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">&times;</button>
								Contents Added successfully!
							</div>
							<sapn> <b>Contents:</b></sapn>
							<div class="col-sm-8">
								<br>
								<div class="position-relative form-group">
									<label for="contentUrl" class="">Contents URL</label> <input
										name="contentUrl" id="contentUrl"
										placeholder="Enter Contents URL" type="text"
										class="form-control" maxlength="500"  required>
								</div>


								<div class="form-group">
									<label for="contentType">Contents Type</label> <select
										class="form-control" id="contentType">
										<option value="image" selected>image</option>
										<option value="video">video</option>
									</select>
								</div>

								<div class="position-relative form-group">
									<label for="contentDuration" class="">Contents Duration</label>
									<input name="contentDuration" id="contentDuration"
										placeholder="Enter Contents Duration " type="text"
										class="form-control" maxlength="5"
										pattern="[123456789][0-9]{9}" required>
								</div>
								<div class="position-relative form-group">
									<label for="skuCode" class="">Product Sku Code</label> <input
										name="skuCode" id="skuCode"
										placeholder="Enter Product Sku Code " type="text"
										class="form-control" maxlength="50">
								</div>
								<div class="position-relative form-group text-center">
									<button type="button" id="contentclear"
										class="btn btn-secondary" onclick="clearContent()">Clear</button>
									<button type="button" id="contentsave" class="btn btn-primary"
										onclick="saveContent()">Save</button>
								</div>
							</div>
							<div class="position-relative form-group">
								<label for="tags" class="">Tags</label> <input name="tags"
									id="tags" placeholder="Enter tags " type="text"
									class="form-control" maxlength="200" pattern="[A-Za-z]{1,200}"
									required>
							</div>

							<div class="position-relative form-group">
								<label for="poweredBy" class="">Powered By</label> <input
									name="poweredBy" id="poweredBy" placeholder="Enter Powered By"
									type="text" class="form-control" maxlength="50"
									pattern="[A-Za-z]{1,50}" required>
							</div>

							<div class="position-relative form-group">
								<label for="selfTags" class="">Self Tags</label> <input
									name="selfTags" id="selfTags" placeholder="Enter Self Tags"
									type="text" class="form-control" maxlength="200"
									pattern="[A-Za-z]{1,200}" required>
							</div>

							<div class="position-relative form-group">
								<label for="Powered" class="">Cross Tags</label> <input
									name="crosstags" id="crosstags" placeholder="Enter Cross Tags"
									type="text" class="form-control" maxlength="200"
									pattern="[A-Za-z]{1,200}" required>
							</div>


							<div class="position-relative form-group">
								<label for="exernalLink" class="">Exernal Link</label> <input
									name="exernalLink" id="exernalLink"
									placeholder="Enter Exernal Link" type="text"
									class="form-control" maxlength="200" pattern="[A-Za-z]{1,200}"
									required>
							</div>


							<div class="form-group">
								<label for="exampleFormControlSelect1">Blog Category</label> <select
									class="form-control" id="blogCategorySelect"></select>
							</div>

							<div class="position-relative form-group">
								<label for="addToBag" class="" id="addToBag">AddTo Bag</label>
								<fieldset class="position-relative form-group">
									<div class="form-row">
										<div class="col-md-2">
											<div class="position-relative form-check">
												<label class="form-check-label"> <input
													name="radio1" type="radio" id="addToBagYes" class="form-check-input"
													required> yes
												</label>
											</div>
										</div>
										<div class="col-md-2">
											<div class="position-relative form-check">
												<label class="form-check-label"> <input
													name="radio1" type="radio" id="addToBagNo" class="form-check-input"
													required>no
												</label>
											</div>
										</div>
									</div>
								</fieldset>
							</div>


							<div class="position-relative form-group">
								<label for="authorName" class="">Author Name</label> <input
									name="authorName" id="authorName"
									placeholder="Enter Author Name" type="text"
									class="form-control" maxlength="50" pattern="[A-Za-z]{1,50}"
									required>
							</div>


							<div class="position-relative form-group">
								<label for="publishDate" class="">Publish Date</label> <input
									type="date" id="publishDate" name="publishDate"
									class="form-control" required>
							</div>

							<div class="form-group">
								<label for="state">State</label> <select class="form-control"
									id="state">
									<option value="Draft" selected>Draft</option>
									<option value="Active">Active</option>
									<option value="InActive">InActive</option>
								</select>
							</div>

							<div class="position-relative form-group">
								<label for="expiryDate" class="">Expiry Date</label> <input
									type="date" id="expiryDate" name="expiryDate"
									class="form-control" required>
							</div>
							<div class="alert alert-success alert-dismissable"
								id="alert-bloglabels-save">
								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">&times;</button>
								Blog Labels Added successfully!
							</div>
							<sapn> <b>Blog Labels:</b></sapn>
							<div class="col-sm-8">
								<br>
								<div class="position-relative form-group">
									<label for="blogcolor" class="">Label Color</label> <input
										name="blogcolor" id="blogcolor" type="color"
										class="form-control" required>
								</div>


								<div class="position-relative form-group">
									<label for="blogtext" class="">Label Text</label> <input
										name="blogtext" id="blogtext" placeholder="Enter Blog Text"
										type="text" class="form-control" maxlength="100"
										pattern="[A-Za-z]{1,100}" required>
								</div>


								<div class="position-relative form-group">
									<label for="blogicon" class="">Label Icon</label> <input
										name="blogicon" id="blogicon" placeholder="Enter Blog Icon"
										type="text" class="form-control" maxlength="100"
										pattern="[A-Za-z]{1,100}" required>
								</div>

								<div class="position-relative form-group text-center">
									<button type="button" id="bloglabelclear"
										class="btn btn-secondary" onclick="clearBlogLabel()">Clear</button>
									<button type="button" id="bloglabelsave"
										class="btn btn-primary" onclick="saveBlogLabel()">Save</button>
								</div>
							</div>
							<div class="position-relative form-group">
								<label for="description" class="">Blog Description</label>
								<textarea rows="12" cols="90" name="description"
									id="description" class="form-control"
									placeholder="Enter Blog Description Here.." minlength="50"
									maxlength="10000" required></textarea>
							</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							id="close_Updateproduct_modal" data-dismiss="modal">Close</button>
						<button type="button" id="UpdateProducts" class="btn btn-primary"
							onclick="saveBlog()">Save</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- ----------------------------------------Model End-------------------------------------------- -->

	<div class="container card col-md-8">
		<div class="card-body">

			<div class="">
				<div class="row">
					<div class="col-sm">
						<h5 class="card-title">Blogs</h5>
					</div>
					<div class="col-sm">

						<form
							class="form-inline d-flex justify-content-center md-form form-sm mt-0">
							<i class="fas fa-search" aria-hidden="true"></i> <input
								class="form-control form-control-sm ml-3 w-75" type="text"
								placeholder="Search" aria-label="Search"
								onKeyUp="loadBlogData(this.value,0)">
						</form>
					</div>
					<div class="col-sm">
						<button type="button" class="btn btn-primary btn-lg float-right"
							data-toggle="modal" data-target="#myModal">Add Blog</button>
					</div>
				</div>
			</div>


			<table class="table table-hover mt-6" id="tblData">
				<thead>
					<tr>
						<th style="display: none;">id</th>
						<th>Title</th>
						<!-- <th>Blog Sub Title</th> -->
						<th class="tdaction text-right">Action</th>
						<th class=""></th>
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
			<nav aria-label="Page navigation example">
				<ul class="pagination" id="label_pagination"></ul>
			</nav>



		</div>
	</div>
	</div>
	</div>

	<!-----------------------------------------Blog Ajax Script Start--------------------------------------->
	<!-----------------------------------------Blog Form Data Add Start--------------------------------------->
	<script type="text/javascript">
	var contentsData = [];
	var blogLabelsData = [];
	function saveContent() {
		content = {}
		var url = document.getElementById("contentUrl").value;
		var contentType = document.getElementById("contentType").value;
		var contentDuration = document.getElementById("contentDuration").value;
		var skuCode = document.getElementById("skuCode").value;
		
		if(url && contentType && contentDuration && skuCode && url.length>0 && contentType.length>0 && contentDuration.length>0 && skuCode.length>0) {
			content ["url"] = url;
			content ["contentType"] = contentType;
			content ["duration"] = contentDuration; 
			content ["skuCode"] = skuCode;
			contentsData.push(content);
			if(contentsData && contentsData.length > 0) {
				showSuccessMessge();
				clearContent();
			}
		}
	}
	
	function showSuccessMessge(){
		$("#alert-content-save").fadeTo(2000, 500).slideUp(500, function() {
				$("#alert-content-save").slideUp(1000);
		});  
	}
	
	/*function loadContents() {
		if(contents && contents.length > 0) {
			$( "#conetentDiv" ).removeClass( "invisible" )
			for(var i=0;i<contents.length;i++) {
				$("#contentData").append('<tr>') 
				
					$("#contentData").append('<td>')
						$("#contentData").append(contents[i].url)
					$("#contentData").append('<td>')
					
					
					$("#contentData").append('<td>')
						$("#contentData").append(contents[i].contentType)
					$("#contentData").append('</td>')
								
					$("#contentData").append('<td>')
						$("#contentData").append(contents[i].duration)
					$("#contentData").append('</td>')
					
					$("#contentData").append('<td>')
						$("#contentData").append(contents[i].skuCode)
					$("#contentData").append('</td>')
				
				$("#contentData").append('</tr>')
			}
		}
	}*/

	function clearContent() {
		document.getElementById("contentUrl").value = "";
		document.getElementById("contentDuration").value = ""; 
		document.getElementById("skuCode").value = "";
	}
	
	function saveBlogLabel() {
		blogLabel = {}
		var color = document.getElementById("blogcolor").value;
		var text = document.getElementById("blogtext").value;
		var icon = document.getElementById("blogcolor").value;
		
		if(color && text && icon && color.length>0 && text.length>0 && icon.length>0) {
			blogLabel ["color"] = document.getElementById("blogcolor").value;
			blogLabel ["text"] = document.getElementById("blogtext").value;
			blogLabel ["icon"] = document.getElementById("blogicon").value; 
			blogLabelsData.push(blogLabel);
			if(blogLabelsData && blogLabelsData.length > 0) {
				showBlogSuccessMessge();
			}
		}
	}
	
	function clearBlogLabel() {
		document.getElementById("blogcolor").value = "";
		document.getElementById("blogtext").value = ""; 
		document.getElementById("blogicon").value = "";
	}
	
	
	function showBlogSuccessMessge(){
		$("#alert-bloglabels-save").fadeTo(2000, 500).slideUp(500, function() {
				$("#alert-bloglabels-save").slideUp(1000);
		});  
	}
	/*
	function loadBlogLabel() {
		if(contents && contents.length > 0) {
			$( "#conetentDiv" ).removeClass( "invisible" )
			for(var i=0;i<contents.length;i++) {
				$("#contentData").append('<tr>') 
				
					$("#contentData").append('<td>')
						$("#contentData").append(contents[i].url)
					$("#contentData").append('<td>')
					
					
					$("#contentData").append('<td>')
						$("#contentData").append(contents[i].contentType)
					$("#contentData").append('</td>')
								
					$("#contentData").append('<td>')
						$("#contentData").append(contents[i].duration)
					$("#contentData").append('</td>')
					
					$("#contentData").append('<td>')
						$("#contentData").append(contents[i].skuCode)
					$("#contentData").append('</td>')
				
				$("#contentData").append('</tr>')
			}
		}
	} */

	
	</script>
	<script type="text/javascript">
	var baseURL = '${pageContext.servletContext.contextPath}';
	
		 $('#tblData').on('click', '.btn-primary', function () { 
            	id = $(this).attr('data-id');     
			    $.ajax({
                type: "GET",
                url : baseURL + "/blogs/"+id, 
                contentType: false,
                processData: false,
		        contentType: 'application/json',
                data: "",
                success: function (results) {
                var data = results.data;
                	console.log(data.id);
                	 $('#edittitle').val(data.title);
                    $('#editsubTitle').val(data.subTitle);
                    $('#editContents').val(data.Contents);
                    $('#editcategoryMapping').val(data.categoryMapping);
                    $('#editdescription').val(data.description);
                    $('#editdayvalidity').val(data.dayvalidity);
                    $('#editarchivestatus').val(data.archivestatus);
                    $('#edittags').val(data.tags);
                    $('#editsetupSequence').val(data.setupSequence);
                    $('#editpinfactors').val(data.pinfactors);
                    $('#editPowered').val(data.Powered);
                    $('#edituserdemography').val(data.userdemography);
                    $('#editselftags').val(data.selftags);
                    $('#editcrosstags').val(data.crosstags);
                    $('#editexernallink').val(data.exernallink);
                    $('#editcategoryId').val(data.categoryId);
                    $('#editaddtobag').val(data.addtobag);
                    $('#editid').val(data.id);
                	}
                });
			});
			
	function saveBlog(){
		var time = " 00:00:00 UTC+05:30";
		var blogForm = document.getElementById('blogform');
		
	    var formData = new FormData(blogForm);
	    
	    const title = document.getElementById('title').value;
	    const subTitle = document.getElementById('subTitle').value;
	    const contents = contentsData; 
	    var tags = document.getElementById('tags').value;
	    const poweredBy = document.getElementById('poweredBy').value;
	    var selfTagsVals = document.getElementById('selfTags').value;
	    var selfTags = selfTagsVals.split(',');
	    var crosstagsVals = document.getElementById('crosstags').value;
	    var crosstags = crosstagsVals.split(',');;
	    const exernallink = document.getElementById('exernalLink').value;  
	    const categoryId = document.getElementById('blogCategorySelect').value;
	   	const addToBag = document.getElementById('addToBag').value;
	    const authorName = document.getElementById('authorName').value;
	    var publishDateVal =  document.getElementById('publishDate').value.split("-");
	    const publishDate = publishDateVal[1]+"/"+publishDateVal[2]+"/"+publishDateVal[0] + time;
	    const state = document.getElementById('state').value;
	    var expiryDateVal = document.getElementById('expiryDate').value.split("-");
	    const expiryDate = expiryDateVal[1]+"/"+expiryDateVal[2]+"/"+expiryDateVal[0] + time;
	    const blogLabels = blogLabelsData;
	    const description = document.getElementById('description').value;
	    var addToBagVal = document.getElementById('addToBagYes').checked;
	    const claps = 1;
	     
    	const blogObj = {
	           "title": title,
	           "subTitle": subTitle,
	           "contents":contents,             	
	           "tags": tags,               		
	           "poweredBy":poweredBy,
	           "selfTags": selfTags,
	           "crossTags": crosstags,
	           "exernallink": exernallink,
	           "categoryId":categoryId,
	           "addToBag": addToBagVal,
	           "authorName":authorName,
	           "publishDate":publishDate,
	           "state":state,
	           "expiryDate":expiryDate,
	           "blogLabels":blogLabels,
	           "claps":claps
        }
                    
		   		$.ajax({
				      url : baseURL + "/blogs",
					  data : JSON.stringify(blogObj),
				      processData : false,
				      contentType: 'application/json',
				      type : 'POST',
				      success : function(blogs) {
				      location.reload();
				      document.getElementById("close_Updateproduct_modal").click();  				
				    },
					error : function(err) {
						   console.log(err);
		    		}
	          });
	        }
	        
	         function blogEditSubmit() {
				var blogForm = document.getElementById('editblogform');
	    		var formData = new FormData(blogForm);
	    		const id =document.getElementById('editid').value;
	    		const title = document.getElementById('edittitle').value;
	    		const subTitle = document.getElementById('editsubTitle').value;
	     		const Contents = document.getElementById('editContents').value;
	   			const categoryMapping = document.getElementById('editcategoryMapping').value;
			    const description = document.getElementById('editdescription').value;
			    const dayvalidity = document.getElementById('editdayvalidity').value;
			    const archivestatus = document.getElementById('editarchivestatus').value;
			    const tags = document.getElementById('edittags').value;
			    const setupSequence = document.getElementById('editsetupSequence').value;
			    const pinfactors = document.getElementById('editpinfactors').value;
			    const Powered = document.getElementById('editPowered').value;
			    const userdemography = document.getElementById('edituserdemography').value;
			    const selftags = document.getElementById('editselftags').value;
			    const crosstags = document.getElementById('editcrosstags').value;
			    const exernallink = document.getElementById('editexernallink').value;
			    const categoryId = document.getElementById('editcategoryId').value;
			    const addtobag = document.getElementById('editaddtobag').value;
		
			    const blogObj = {
               		"title": title,
               		"subTitle": subTitle,
               		"Contents":Contents,
               		"description": description,
               		"categoryMapping": categoryMapping,
               		"dayvalidity": dayvalidity,
               		"archivestatus": archivestatus,
               		"tags": tags,
               		"setupSequence": setupSequence,
               		"pinfactors": pinfactors,
               		"Powered":Powered,
               		"userdemography": userdemography,
               		"selfTags": selftags,
               		"crossTags": crosstags,
               		"exernallink": exernallink,
               		"categoryId": categoryId,
               		"addtobag": addtobag
                    };
                    
			   		$.ajax({
						  url : baseURL + "/blogs/"+id,
						  data : JSON.stringify(blogObj),
				    	  processData : false,
				      	  contentType: 'application/json',
				      	  type : 'PUT',
				      	  success : function(blogs) {		      
				      	  	results.forEach(bloglist => {
		                                 dynamicTR = dynamicTR + "<td style='display:none;'>" + bloglist.id + "</td>";
		                                 dynamicTR = dynamicTR + "<td>" + bloglist.title + "</td>";
		                                 dynamicTR = dynamicTR + "<td>" + bloglist.subTitle + "</td>"; 
		                                 dynamicTR = dynamicTR + "<td class='tdaction'>" + "<button type='button' class='btn btn-primary btn-lg float-right btn-sm lo' data-toggle='modal' data-target='#editmyModal' data-id='"+bloglist[i].id+"' >Edit</button>" + "</td>";
		                                 dynamicTR = dynamicTR + "<td class='tdaction'><button class='btn btn-danger btn-sm' onclick='userDelete("+userlist.id+")' id='useriddata'> Delete </button></td>";
		                                 dynamicTR = dynamicTR + "</tr>";
		                                $("#tblData tbody").append(dynamicTR);
		                                });
				            },
				    		error : function(err) {
				    			console.log(err);
				    		}
			        	});
		        }
           </script>
	<!-----------------------------------------Blog Form Data Add End--------------------------------------->
	<script type="text/javascript">
    var emptyRow = "<tr><td colspan='4' class='text-center'> No Records Available</td></tr>";
    var emptyNewRow = "<tr class='trNewRow'>";
  
=======
   <%
      String token = (String)request.getSession().getAttribute("CSRFToken"); 
      if(null == token){
      	response.sendRedirect("/login");
      } 
    %>
   <!-- -------------------------------------------header start----------------------------------------------->
   <jsp:include page="header.jsp"></jsp:include>
   <!-- -------------------------------------------header end------------------------------------------------->
   <div class="alert alert-success alert-dismissable" id="alert-delete">
      <button type="button" class="close" data-dismiss="alert"
         aria-hidden="true">&times;</button>
      Deleted successfully!
   </div>
   <div class="container card col-md-8">
      <div class="card-body">
         <div class="row mb-4">
            <div class="col-sm">
               <h5 class="card-title">Blogs</h5>
            </div>
           
            <div class="col-sm">
               <button type="button" class="btn btn-primary btn-lg float-right"
                  data-toggle="modal" data-target="#myModal" onclick='openAddModal()'>Add Blog</button>
            </div>
         </div>
        <table id="table_id" class="display pt-2" style="width:100%">
   <thead>
            <tr>
                <th>Title</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody> 
        </tbody>
        </table>
         <nav aria-label="Page navigation example">
            <ul class="pagination" id="label_pagination"></ul>
         </nav>
      </div>
   </div>
   <!-- ----------------------------------------Model start-------------------------------------------- -->
   <div>
      <div class="modal fade" id="myModal" role="dialog">
         <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
               <div class="modal-header ">
                  <h5 class="modal-title" id="exampleModalLongTitle">Blog</h5>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body scroll" id="">
                  <form class="" method="post" action="" id="blogform"
                     onsubmit="return false" enctype='multipart/form-data'>
                     <input name="id" id="editId" type="hidden" class="form-control">
                     <div class="form-group">
                        <label for="title" class="">Title</label> 
                        <input name="title"
                           id="title" placeholder="Enter Blog Title" type="text"
                           class="form-control">
                        <small style="color:red;" id="titleError"></small>
                     </div>
                     <div class="position-relative form-group">
                        <label for="subtitle" class="">SubTitle</label> <input
                           name="subTitle" id="subTitle"
                           placeholder="Enter Blog Sub Title" type="text"
                           class="form-control" >
                        <small style="color:red;" id="subTitleError"></small>
                     </div>
                     <div class="alert alert-success alert-dismissable"
                        id="alert-content-save">
                        <button type="button" class="close" data-dismiss="alert"
                           aria-hidden="true">&times;</button>
                        Contents Added successfully!
                     </div>
                     <span> <b>Contents:</b></span>
                     <div class="col-sm-8">
                        <br>
                        <div class="position-relative form-group">
                           <label for="contentUrl" class="">Contents URL</label> <input
                              name="contentUrl" id="contentUrl"
                              placeholder="Enter Contents URL" type="text"
                              class="form-control">
                           <small style="color:red;" id="contentUrlError"></small>
                        </div>
                        <div class="form-group">
                           <label for="contentType">Contents Type</label> 
                           <select
                              class="form-control" id="contentType">
                              <option value="image" selected>image</option>
                              <option value="video">video</option>
                           </select>
                        </div>
                        <div class="position-relative form-group">
                           <label for="contentDuration" class="">Contents Duration</label>
                           <input name="contentDuration" id="contentDuration"
                              placeholder="Enter Contents Duration " type="text"
                              class="form-control" maxlength="5"
                              >
                           <small style="color:red;" id="contentDurationError"></small>
                        </div>
                        <div class="position-relative form-group">
                           <label for="skuCode" class="">Product Sku Code</label> <input
                              name="skuCode" id="skuCode"
                              placeholder="Enter Product Sku Code " type="text"
                              class="form-control" maxlength="50">
                           <small style="color:red;" id="skuCodeError"></small>
                        </div>
                        <div class="position-relative form-group text-center">
                           <button type="button" id="contentclear"
                              class="btn btn-secondary" onclick="clearContent()">Clear</button>
                           <button type="button" id="contentsave" class="btn btn-primary"
                              onclick="saveContent()">Save</button>
                        </div>
                        <table id="contentTable" class="table table-striped" style="font-size: 12px;">
                           <tr>
                              <th>Content Url</th>
                              <th>Content Type</th>
                              <th>Content Duration</th>
                              <th>Product Sku Code</th>
                              <th>Action</th>
                           </tr>
                        </table>
                     </div>
                     <div class="alert alert-success alert-dismissable"
                        id="alert-keyword-save">
                        <button type="button" class="close" data-dismiss="alert"
                           aria-hidden="true">&times;</button>
                        Keyword Added successfully!
                     </div>
                     <span> <b>Keywords:</b></span>
                     <div class="col-sm-8">
                        <br>
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
                              class="form-control">
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
                     <div class="alert alert-success alert-dismissable"
                        id="alert-photocredit-save">
                        <button type="button" class="close" data-dismiss="alert"
                           aria-hidden="true">&times;</button>
                        PhotoCredit Added successfully!
                     </div>
                     <span> <b>PhotoCredits:</b></span>
                     <div class="col-sm-8">
                        <br>
                        <div class="position-relative form-group">
                           <label for="photoCreditKey" class="">PhotoCredit Key</label> <input
                              name="photoCreditKey" id="photoCreditKey"
                              placeholder="Enter PhotoCredit Key" type="text"
                              class="form-control" maxlength="500"  required>
                           <small style="color:red;" id="photoCreditKeyError"></small>
                        </div>
                        <div class="position-relative form-group">
                           <label for="photoCreditValue" class="">PhotoCredit Url</label> <input
                              name="photoCreditValue" id="photoCreditValue"
                              placeholder="Enter PhotoCredit Value" type="text"
                              class="form-control">
                           <small style="color:red;" id="photoCreditValueError"></small>
                        </div>
                        <div class="position-relative form-group text-center">
                           <button type="button" id="photocreditclear"
                              class="btn btn-secondary" onclick="clearPhotoCredit()">Clear</button>
                           <button type="button" id="photocreditsave" class="btn btn-primary"
                              onclick="savePhotoCredit()">Save</button>
                        </div>
                        <table id="photoCreditTable" class="table table-striped" style="font-size: 12px;">
                           <tr>
                              <th>PhotoCredit Key</th>
                              <th>PhotoCredit Value</th>
                              <th>Action</th>
                           </tr>
                        </table>
                     </div>
                     <div class="position-relative form-group">
                        <label for="tags" class="">Tags</label> <input name="tags"
                           id="tags" placeholder="Enter tags " type="text"
                           class="form-control" maxlength="200" pattern="[A-Za-z]{1,200}"
                           required>
                        <small style="color:red;" id="tagsError"></small>
                     </div>
                     <div class="position-relative form-group">
                        <label for="poweredBy" class="">Powered By</label> <input
                           name="poweredBy" id="poweredBy" placeholder="Enter Powered By"
                           type="text" class="form-control" maxlength="50"
                           pattern="[A-Za-z]{1,50}" required>
                        <small style="color:red;" id="poweredByError"></small>
                     </div>
                     <div class="position-relative form-group">
                        <label for="selfTags" class="">Self Tags</label> <input
                           name="selfTags" id="selfTags" placeholder="Enter Self Tags"
                           type="text" class="form-control" maxlength="200"
                           pattern="[A-Za-z]{1,200}" required>
                        <small style="color:red;" id="selfTagsError"></small>
                     </div>
                     <div class="position-relative form-group">
                        <label for="Powered" class="">Cross Tags</label> <input
                           name="crosstags" id="crosstags" placeholder="Enter Cross Tags"
                           type="text" class="form-control" maxlength="200"
                           pattern="[A-Za-z]{1,200}" required>
                        <small style="color:red;" id="crossTagsError"></small>
                     </div>
                     <div class="position-relative form-group">
                        <label for="exernalLink" class="">External Link</label> <input
                           name="exernalLink" id="exernalLink"
                           placeholder="Enter External Link" type="text"
                           class="form-control">
                        <small style="color:red;" id="externalLinkError"></small>
                     </div>
                     <div class="form-group">
                        <label for="exampleFormControlSelect1">Blog Category</label> <select
                           class="form-control" id="blogCategorySelect"></select>
                        <small style="color:red;" id="blogCategoryError"></small>
                     </div>
                     <div class="position-relative form-group">
                        <label for="addToBag" class="" id="addToBag">AddTo Bag</label>
                        <fieldset class="position-relative form-group">
                           <div class="form-row">
                              <div class="col-md-2">
                                 <div class="position-relative form-check">
                                    <label class="form-check-label"> <input
                                       name="radio1" type="radio" id="addToBagYes" class="form-check-input"
                                       required checked> yes
                                    </label>
                                 </div>
                              </div>
                              <div class="col-md-2">
                                 <div class="position-relative form-check">
                                    <label class="form-check-label"> <input
                                       name="radio1" type="radio" id="addToBagNo" class="form-check-input"
                                       required>no
                                    </label>
                                 </div>
                              </div>
                           </div>
                        </fieldset>
                     </div>
                     <div class="position-relative form-group">
                        <label for="authorName" class="">Author Name</label> <input
                           name="authorName" id="authorName"
                           placeholder="Enter Author Name" type="text"
                           class="form-control" maxlength="50" pattern="[A-Za-z]{1,50}"
                           required><small style="color:red;" id="authorNameError"></small>
                     </div>
                     <div class="position-relative form-group">
                        <label for="publishDate" class="">Publish Date</label> <input
                           type="date" id="publishDate" name="publishDate"
                           class="form-control" required><small style="color:red;" id="publishDateError"></small>
                     </div>
                     <!-- <div class="form-group">
                        <label for="state">State</label> 
                        <select class="form-control"
                           id="state">
                           <option value="Draft" selected>Draft</option>
                           <option value="Active">Active</option>
                           <option value="InActive">InActive</option>
                        </select> 
                     </div> -->
                     <div class="position-relative form-group">
                        <label for="expiryDate" class="">Expiry Date</label> <input
                           type="date" id="expiryDate" name="expiryDate"
                           class="form-control" required><small style="color:red;" id="expiryDateError"></small>
                     </div>
                     <div class="alert alert-success alert-dismissable"
                        id="alert-bloglabels-save">
                        <button type="button" class="close" data-dismiss="alert"
                           aria-hidden="true">&times;</button>
                        Blog Labels Added successfully!
                     </div>
                     <span> <b>Blog Labels:</b></span>
                     <div class="col-sm-8">
                        <br>
                        <div class="position-relative form-group">
                           <label for="blogcolor" class="">Label Color</label> <input
                              name="blogcolor" id="blogcolor" type="color"
                              class="form-control" required><small style="color:red;" id="blogColorError"></small>
                        </div>
                        <div class="position-relative form-group">
                           <label for="blogtext" class="">Label Text</label> <input
                              name="blogtext" id="blogtext" placeholder="Enter Blog Text"
                              type="text" class="form-control" maxlength="100"
                              pattern="[A-Za-z]{1,100}" required><small style="color:red;" id="blogTextError"></small>
                        </div>
                        <div class="position-relative form-group">
                           <label for="blogicon" class="">Label Icon</label> <input
                              name="blogicon" id="blogicon" placeholder="Enter Blog Icon"
                              type="text" class="form-control" maxlength="100"
                              pattern="[A-Za-z]{1,100}" required><small style="color:red;" id="blogIconError"></small>
                        </div>
                        <div class="position-relative form-group text-center">
                           <button type="button" id="bloglabelclear"
                              class="btn btn-secondary" onclick="clearBlogLabel()">Clear</button>
                           <button type="button" id="bloglabelsave"
                              class="btn btn-primary" onclick="saveBlogLabel()">Save</button>
                        </div>
                        <table id="blogLableTable" class="table table-striped" style="font-size: 12px;">
                           <tr>
                              <th>Label Color</th>
                              <th>Label Text</th>
                              <th>Label Icon</th>
                              <th>Action</th>
                           </tr>
                        </table>
                     </div>
                     <div class="position-relative form-group">
                        <label for="images" class="">Upload Images/Videos : </label> 
                        <input type="file" id="images" multiple />
                        <small style="color:red;" id="imageError"></small>
                     </div>
                     <div class="position-relative form-group">
                        <label for="description" class="">Blog Description</label>
                        <textarea rows="12" cols="90" name="description"
                           id="description" class="form-control"
                           placeholder="Enter Blog Description Here.."
                           maxlength="10000" required></textarea><small style="color:red;" id="descriptionError"></small>
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                           id="close_Updateproduct_modal" data-dismiss="modal">Close</button>
                        <button type="button" id="UpdateProducts" class="btn btn-primary"
                           onclick="saveBlog('Active')">Publish Now</button>
                           <button type="button" id="UpdateProducts" class="btn btn-primary"
                           onclick="saveBlog('Draft')">Save As Draft</button>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- ----------------------------------------Model End-------------------------------------------- -->
   
   <script>
   var baseURL = '${pageContext.servletContext.contextPath}';
>>>>>>> master
    $(document).ready(function () {
        $('#table_id').DataTable({
        	"ajax": function (data, callback, settings) {
                $.ajax({
                   url: baseURL+"/blogs/list",
                   dataType: "json",
                   type: 'GET',
                   success: function(data) {
                      callback(data);
                   }
                });
      },
      "columns": [
    	  {"data":"title"},
    	  { "data": "_id",
    		  "render": function (data, type, row, meta) {
    		         return "<button type='button' class='btn btn-primary btn-sm float-right btn-sm lo edit' data-toggle='modal' data-target='#myModal' onclick='openEditModal(\""+row.id+"\")' id='openEditModal' data-id='"+row.id+"' >Edit</button>";
    		     }  
    	  },
    	  { "data": "_id",
    		  "render": function (data, type, row, meta) {
    		         return "<button type='button' class='btn btn-danger btn-sm' id='deleteblog' onclick='deleteBlog(\""+row.id+"\")' value='"+row.id+"'>Delete</button>";
    		     }  
    	  }
      ]
        });
    });
</script>
   
   <!-- ----------------------------------------Edit Model End-------------------------------------------- -->
   <script type="text/javascript">
   var dtToday = new Date();
   
   var month = dtToday.getMonth()+1;
   var day = dtToday.getDate();
   var ExpiryDay = dtToday.getDate()+1;
   var year = dtToday.getFullYear();
   if(month < 10)
       month = '0' + month.toString();
   if(day < 10){
       day = '0' + day.toString();
       ExpiryDay = '0' + ExpiryDay.toString();
   }
   
   var minPublishDate = year + '-' + month + '-' + day;
   var minExpiryDate = year + '-' + month + '-' + ExpiryDay;
   $('#publishDate').attr('min', minPublishDate);
   $('#expiryDate').attr('min', minExpiryDate);
   $('#editPublishDate').attr('min', minPublishDate);
   $('#editExpiryDate').attr('min', minExpiryDate);
   
      var baseURL = '${pageContext.servletContext.contextPath}';
      
      var contentsData = [];
      var blogLabelsData = [];
      var keywordData = [];
      var photoCreditData = [];
      
      function saveContentValidation(obj){
      	var error=false;
      	if(obj?.url && obj?.url?.match(/(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/g)==null){
        	    document.getElementById('contentUrlError').innerHTML="Please Enter Correct Url ( Ex: https://www.xyz.com/ )";
           		error= true;
           }else{
        	   document.getElementById('contentUrlError').innerHTML="";
           }
      	if(obj?.contentDuration==="" || obj?.contentDuration===null){
          	 document.getElementById('contentDurationError').innerHTML="Please Enter Content Duration";
          	 error= true;
           }else{
        	   document.getElementById('contentDurationError').innerHTML=""; 
           }
      	if(obj?.skuCode==="" || obj?.skuCodes===null){
          	 document.getElementById('skuCodeError').innerHTML="Please Enter Sku Code";
          	 error= true;
           }else{
        	   document.getElementById('skuCodeError').innerHTML="";
           }
      	
      	return error;

      }
      
      function saveContent() {
      	content = {}
      	var url = document.getElementById("contentUrl").value?.trim();
      	var contentType = document.getElementById("contentType").value;
      	var contentDuration = document.getElementById("contentDuration").value?.trim();
      	var skuCode = document.getElementById("skuCode").value?.trim();
      	if(saveContentValidation({url,contentDuration,skuCode})===true){
      		return false;
      	}
      	
      	if(contentType && contentDuration && skuCode && contentType.length>0 && contentDuration.length>0 && skuCode.length>0) {
      		content ["url"] = url;
      		content ["contentType"] = contentType;
      		content ["duration"] = contentDuration; 
      		content ["skuCode"] = skuCode;
      		
      		contentsData.push(content);
      		if(contentsData && contentsData.length > 0) {
      			var contentTable = document.getElementById("contentTable");
           	var row = contentTable.insertRow(1);
               var cell1 = row.insertCell(0);
               var cell2 = row.insertCell(1);
               var cell3 = row.insertCell(2);
               var cell4 = row.insertCell(3);
               var cell5 = row.insertCell(4);
               cell1.innerHTML =url;
               cell2.innerHTML = contentType;
               cell3.innerHTML = contentDuration;
               cell4.innerHTML =skuCode;
               cell5.innerHTML ="<button type='button' class='btn btn-danger btn-sm' onclick='deleteAddContent(this)' id='"+(contentsData.length-1)+"'>Delete</button>";
               showSuccessMessge();
      			clearContent();
      		}
      	}
      }
      
      function deleteAddContent(btn){
    	  var row = btn.parentNode.parentNode;
    	  row.parentNode.removeChild(row);
    	  $("#contentTable").find("tr:gt(0)").remove(); 
    	  contentsData=contentsData.filter((data,index)=>index != btn.attributes.id.value);
      	var contentTable = document.getElementById("contentTable");
            contentsData?.map((item,index) => {
            	if(item){
            	var row = contentTable.insertRow(1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                var cell5 = row.insertCell(4);
                cell1.innerHTML = item?.url;
                cell2.innerHTML = item?.contentType;
                cell3.innerHTML = item?.duration;
                cell4.innerHTML = item?.skuCode;
                cell5.innerHTML ="<button type='button' class='btn btn-danger btn-sm' onclick='deleteAddContent(this)' id='"+index+"'>Delete</button>"; 
            	}
            });
      }
      
      
      
      function showSuccessMessge(){
      	$("#alert-content-save").fadeTo(2000, 500).slideUp(500, function() {
      			$("#alert-content-save").slideUp(1000);
      	});  
      }
      
      function clearContent() {
        	document.getElementById("contentUrl").value = "";
        	document.getElementById("contentDuration").value = ""; 
        	document.getElementById("skuCode").value = "";
      }
      
      function saveBlogLabelValidation(obj){
        	var error=false;
        	if(obj?.text==="" || obj?.text===null){
              	 document.getElementById('blogTextError').innerHTML="Please Enter Blog Text";
              	error= true;
             }else{
            	 document.getElementById('blogTextError').innerHTML="";
             }
        	if(obj?.icon==="" || obj?.icon===null){
            	 document.getElementById('blogIconError').innerHTML="Please Enter Blog Icon";
            	 error= true;
             }else{
            	 document.getElementById('blogIconError').innerHTML="";
             }
        	
        	return error;
        }
      
      function saveBlogLabel() {
      blogLabel = {}
      var color = document.getElementById("blogcolor").value?.trim();
      var text = document.getElementById("blogtext").value?.trim();
      var icon = document.getElementById("blogicon").value?.trim();
      if(saveBlogLabelValidation({text,icon})===true){
    		return false;
    	}
      if(color && text && icon && color.length>0 && text.length>0 && icon.length>0) {
      blogLabel ["color"] = color;
      blogLabel ["text"] = text;
      blogLabel ["icon"] = icon; 
      blogLabelsData.push(blogLabel);
      if(blogLabelsData && blogLabelsData.length > 0) {
      	var blogLableTable = document.getElementById("blogLableTable");
                	var row = blogLableTable.insertRow(1);
                    var cell1 = row.insertCell(0);
                    var cell2 = row.insertCell(1);
                    var cell3 = row.insertCell(2);
                    var cell4 = row.insertCell(3);
                    cell1.innerHTML = color;
                    cell2.innerHTML = text;
                    cell3.innerHTML = icon;
                    cell4.innerHTML ="<button type='button' class='btn btn-danger btn-sm' onclick='deleteAddBloglable(this)' id='"+(blogLabelsData.length-1)+"'>Delete</button>"; 
                	
      	showBlogSuccessMessge();
      	clearBlogLabel();
      }
      }
      }
      
      function deleteAddBloglable(btn){
    	  var row = btn.parentNode.parentNode;
    	  row.parentNode.removeChild(row);
    	  $("#blogLableTable").find("tr:gt(0)").remove(); 
    	  blogLabelsData=blogLabelsData.filter((data,index)=>index != btn.attributes.id.value);
      	var blogLableTable = document.getElementById("blogLableTable");
      	blogLabelsData?.map((item,index) => {
            	if(item){
            		var row = blogLableTable.insertRow(1);
                    var cell1 = row.insertCell(0);
                    var cell2 = row.insertCell(1);
                    var cell3 = row.insertCell(2);
                    var cell4 = row.insertCell(3);
                    cell1.innerHTML = item.color;
                    cell2.innerHTML = item.text;
                    cell3.innerHTML = item.icon;
                    cell4.innerHTML ="<button type='button' class='btn btn-danger btn-sm' onclick='deleteAddBloglable(this)' id='"+index+"'>Delete</button>"; 
                	}
            });
      }
      
      function clearBlogLabel() {
      document.getElementById("blogcolor").value = "";
      document.getElementById("blogtext").value = ""; 
      document.getElementById("blogicon").value = "";
      }
      
      
      function showBlogSuccessMessge(){
      $("#alert-bloglabels-save").fadeTo(2000, 500).slideUp(500, function() {
      	$("#alert-bloglabels-save").slideUp(1000);
      });  
      }
      
      function saveKeywordValidation(obj){
    	  
      	var error=false;
      	if(obj?.key==="" || obj?.key===null){
            	 document.getElementById('keywordKeyError').innerHTML="Please Enter Keyword Key";
            	error= true;
           }else{
        	   document.getElementById('keywordKeyError').innerHTML="";
           }
      	if(obj?.value && obj?.value?.match(/(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/g)==null){
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
        	
        	if(key && key.length>0) {
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
      
      function savePhotoCreditValidation(obj){
    	  var error=false;
        	if(obj?.key==="" || obj?.key===null){
              	 document.getElementById('photoCreditKeyError').innerHTML="Please Enter PhotoCredit Key";
              	error= true;
             }else{
            	 document.getElementById('photoCreditKeyError').innerHTML="";
             }
        	
        	if(obj?.value && obj?.value?.match(/(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/g)==null){
            	    document.getElementById('photoCreditValueError').innerHTML="Please Enter Correct Url ( Ex: https://www.xyz.com/ )";
               		error= true;
               }else{
            	 document.getElementById('photoCreditValueError').innerHTML="";
             }
        	
        	return error;
      }
      
      function savePhotoCredit() {
        	photocredit = {}
        	
        	var key = document.getElementById("photoCreditKey").value?.trim();
        	var value = document.getElementById("photoCreditValue").value?.trim();
        	
        	if(savePhotoCreditValidation({key,value})===true){
	    		return false;
	    	}
        	
        	if(key && key.length>0) {
        		
        		photocredit ["key"] = key;
        		photocredit ["value"] = value;

        		photoCreditData.push(photocredit);
        		if(photoCreditData && photoCreditData.length > 0) {
        			var photoCreditTable = document.getElementById("photoCreditTable");
                	var row = photoCreditTable.insertRow(1);
                	 var cell1 = row.insertCell(0);
                     var cell2 = row.insertCell(1);
                     var cell3 = row.insertCell(2);
                     cell1.innerHTML = key;
                     cell2.innerHTML = value;
                     cell3.innerHTML ="<button type='button' class='btn btn-danger btn-sm' onclick='deleteAddPhotoCredit(this)' id='"+(photoCreditData.length-1)+"'>Delete</button>"; 
                 	
        			showPhotoCreditSuccessMessge();
        			clearPhotoCredit();
        		}
          	}
        }
      
      function deleteAddPhotoCredit(btn){
    	  var row = btn.parentNode.parentNode;
    	  row.parentNode.removeChild(row);
    	  $("#photoCreditTable").find("tr:gt(0)").remove(); 
    	  photoCreditData=photoCreditData.filter((data,index)=>index != btn.attributes.id.value);
      	var photoCreditTable = document.getElementById("photoCreditTable");
      	photoCreditData?.map((item,index) => {
            	if(item){
            		var row = photoCreditTable.insertRow(1);
                    var cell1 = row.insertCell(0);
                    var cell2 = row.insertCell(1);
                    var cell3 = row.insertCell(2);
                    cell1.innerHTML = item.key;
                    cell2.innerHTML = item.value;
                    cell3.innerHTML ="<button type='button' class='btn btn-danger btn-sm' onclick='deleteAddPhotoCredit(this)' id='"+index+"'>Delete</button>"; 
                	}
            });
      }
        
        function clearPhotoCredit() {
        	document.getElementById("photoCreditKey").value = "";
        	document.getElementById("photoCreditValue").value = ""; 
        }
        
        
        function showPhotoCreditSuccessMessge(){
        	$("#alert-photocredit-save").fadeTo(2000, 500).slideUp(500, function() {
        			$("#alert-photocredit-save").slideUp(1000);
        	});  
        }
        
        function saveBlogValidation(blogObj){
        	var error=false;
        	
        	if(blogObj?.title==="" || blogObj?.title===null){
              	 document.getElementById('titleError').innerHTML="Please Enter Title";
              	error= true;
             }else if((blogObj?.title?.length||0) > 100){
            	document.getElementById('titleError').innerHTML="Please Enter Maximum 100 Character";
               	error= true;
             }else{
            	 document.getElementById('titleError').innerHTML="";
             }
        	
        	if(blogObj?.subTitle==="" || blogObj?.subTitle===null){
            	 document.getElementById('subTitleError').innerHTML="Please Enter SubTitle";
            	 error= true;
             }else if((blogObj?.subTitle?.length||0) > 100){ 
            	document.getElementById('subTitleError').innerHTML="Please Enter Maximum 100 Character";
               	error= true;
             }else{
               	 document.getElementById('subTitleError').innerHTML="";
             }
        	
        	if(blogObj?.tags==="" || blogObj?.tags===null){
            	 document.getElementById('tagsError').innerHTML="Please Enter Tags";
            	 error= true;
             }else{
                 document.getElementById('tagsError').innerHTML="";
             }
        	
        	if(blogObj?.poweredBy==="" || blogObj?.poweredBy===null){
            	 document.getElementById('poweredByError').innerHTML="Please Enter PoweredBy";
            	 error= true;
             }else if((blogObj?.poweredBy?.length||0) > 50){
            	document.getElementById('poweredByError').innerHTML="Please Enter Maximum 50 Character";
               	error= true;
             }else{
            	 document.getElementById('poweredByError').innerHTML="";
             }
        	
        	var selfTags=document.getElementById('selfTags').value;
        	if(selfTags==="" ||selfTags===null){
            	 document.getElementById('selfTagsError').innerHTML="Please Enter SelfTags";
            	 error= true;
             }else{
            	 document.getElementById('selfTagsError').innerHTML="";
             }
        	
        	var crossTags=document.getElementById('crosstags').value;
        	if(crossTags==="" || crossTags===null){
            	 document.getElementById('crossTagsError').innerHTML="Please Enter CrossTags";
            	 error= true;
             }else{
            	 document.getElementById('crossTagsError').innerHTML="";
             }
        	
        	var exernallink=document.getElementById('exernalLink').value;
        	if(exernallink && exernallink?.match(/(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/g)==null){
        	    document.getElementById('externalLinkError').innerHTML="Please Enter Correct Url ( Ex: https://www.xyz.com/ )";
           		error= true;
             }else{
            	 document.getElementById('externalLinkError').innerHTML="";
             }
        	
        	if(blogObj?.authorName==="" || blogObj?.authorName===null){
            	 document.getElementById('authorNameError').innerHTML="Please Enter Author Name";
            	 error= true;
             }else if((blogObj?.authorName?.length||0) > 50){
            	document.getElementById('authorNameError').innerHTML="Please Enter Maximum 50 Character";
               	error= true;
             }else{
            	 document.getElementById('authorNameError').innerHTML="";
             }
        	
        	var publishDate=document.getElementById('publishDate').value;
        	if(publishDate==="" || publishDate===null){
            	 document.getElementById('publishDateError').innerHTML="Please Enter Publish Date";
            	 error= true;
             }else{
            	 document.getElementById('publishDateError').innerHTML="";
             }
        	
        	var expiryDate=document.getElementById('expiryDate').value;
        	if(expiryDate==="" || expiryDate===null){
            	 document.getElementById('expiryDateError').innerHTML="Please Enter Expiry Date";
            	 error= true;
             }else{
            	 document.getElementById('expiryDateError').innerHTML="";
             }
        	
        	if(blogObj?.description==="" || blogObj?.description===null){
            	 document.getElementById('descriptionError').innerHTML="Please Enter Description";
            	 error= true;
             }else{
            	 document.getElementById('descriptionError').innerHTML="";
             }
        	
        	return error;
 
        }
        
      function saveBlog(state){
        	var time = " 00:00:00 UTC+05:30";
        	
        	var id= document.getElementById('editId').value;
            const title = document.getElementById('title').value?.trim();
            const subTitle = document.getElementById('subTitle').value?.trim();
            const contents = contentsData; 
            var tags = document.getElementById('tags').value?.trim();
            const poweredBy = document.getElementById('poweredBy').value?.trim();
            var selfTagsVals = document.getElementById('selfTags').value?.trim();
            var selfTags = selfTagsVals.split(',');
            var crosstagsVals = document.getElementById('crosstags').value?.trim();
            var crosstags = crosstagsVals.split(',');
            const exernallinkVals = document.getElementById('exernalLink').value?.trim(); 
            var exernallink = exernallinkVals.split(',');
            const categoryId = document.getElementById('blogCategorySelect').value;
           	const addToBag = document.getElementById('addToBag').value;
            const authorName = document.getElementById('authorName').value?.trim();
            var publishDateVal =  document.getElementById('publishDate').value.split("-");
            const publishDate = publishDateVal[1]+"/"+publishDateVal[2]+"/"+publishDateVal[0] + time;
           // const state = document.getElementById('state').value;
            var expiryDateVal = document.getElementById('expiryDate').value.split("-");
            const expiryDate = expiryDateVal[1]+"/"+expiryDateVal[2]+"/"+expiryDateVal[0] + time;
            const blogLabels = blogLabelsData;
            const description = document.getElementById('description').value?.trim();
            var addToBagVal = document.getElementById('addToBagYes').checked;
            const keywords = keywordData;
            const photoCredits =photoCreditData;
            const claps = 1;
            var blogFileObjs = document.getElementById('images');
             
           	const blogObj = {
                   "title": title,
                   "subTitle": subTitle,
                   "contents":contents,             	
                   "tags": tags,               		
                   "poweredBy":poweredBy,
                   "selfTags": selfTags,
                   "crossTags": crosstags,
                   "exernalLink": exernallink,
                   "categoryId":categoryId,
                   "addToBag": addToBagVal,
                   "authorName":authorName,
                   "publishDate":publishDate,
                   "expiryDate":expiryDate,
                   "blogLabels":blogLabels,
                   "claps":claps,
                   "description":description,
                   "keywords":keywords,
                   "photoCredits":photoCredits,
                   "state":state,
               }
           	
           	if(saveBlogValidation(blogObj)===true){
           		return false;
           	}     
           	

           	if(id){
           		blogObj.id=id;
           		$.ajax({
           	        url : baseURL + "/blogs",
           	        data : JSON.stringify(blogObj),
           	        	  processData : false,
           	          	  contentType: 'application/json',
           	          	  type : 'PUT',
           	          	  success : function(blogs) {	
           	          		if((blogFileObjs?.files?.length||0) > 0) {
           	            		uploadBlogFiles(blogFileObjs,id);
           	            	}  
           	          	window.location.reload();
           	            	document.getElementById("close_Updateproduct_modal").click(); 
           	              },
           	        	  error : function(err) {
           	        		console.log(err);
           	        	  }
           	          	});
           	}else{
           		$.ajax({
  			      url : baseURL + "/blogs",
  				  data : JSON.stringify(blogObj),
  			      processData : false,
  			      contentType: 'application/json',
  			      type : 'POST',
  			      success : function(blogs) {
  			    	if(blogFileObjs) {
   	            		uploadBlogFiles(blogFileObjs,blogs.id);
   	            	}   
  			    	window.location.reload();
  			      	document.getElementById("close_Updateproduct_modal").click();  				
  			    },
  				error : function(err) {
  					   console.log(err);
  	    		}
            });
           	}	   		
         }
      
	  function uploadBlogFiles(blogFileObjs,id) {
		  var blogFormData = new FormData();
          var blogFiles = blogFileObjs.files;
          if(blogFiles){
        	  for(var i=0;i<blogFiles.length;i++) {
          		blogFormData.append('blogFiles', blogFiles[i]);
         	  }
        	  
        	  blogFormData.append("id",id);
        	  
	          $.ajax({
	       	        url : baseURL + "/uploadFiles",
	       	        data : blogFormData,
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
	  }
      
      function openEditModal(id){
    	  document.getElementById("editId").value="";
    	  document.getElementById("blogform").reset();
    	  $("#contentTable").find("tr:gt(0)").remove();
    	  $("#blogLableTable").find("tr:gt(0)").remove();
    	  $("#keywordTable").find("tr:gt(0)").remove();
    	  $("#photoCreditTable").find("tr:gt(0)").remove();
         $.ajax({
               type: "GET",
               url : baseURL + "/blogs/"+id, 
               contentType: false,
               processData: false,
            contentType: 'application/json',
               data: "",
               success: function (results) {
                  
               var data = results.data;
               
               var contents=data?.contents||[];
               var blogLabels=data?.blogLabels||[];
               var keywords=data?.keywords||[];
               var photoCredits=data?.photoCredits||[];
               contentsData =contents;
               blogLabelsData =blogLabels;
               keywordData =keywords;
               photoCreditData =photoCredits;
               
               $("#contentTable").find("tr:gt(0)").remove(); 
               var contentTable = document.getElementById("contentTable");
               contentsData?.map((item,index) => {
               	if(item){
               	var row = contentTable.insertRow(1);
                   var cell1 = row.insertCell(0);
                   var cell2 = row.insertCell(1);
                   var cell3 = row.insertCell(2);
                   var cell4 = row.insertCell(3);
                   var cell5 = row.insertCell(4);
                   cell1.innerHTML = item?.url;
                   cell2.innerHTML = item?.contentType;
                   cell3.innerHTML = item?.duration;
                   cell4.innerHTML = item?.skuCode;
                   cell4.innerHTML = item?.skuCode;
                   cell5.innerHTML ="<button type='button' class='btn btn-danger btn-sm' onclick='deleteEditContent(this)' id='"+index+"'>Delete</button>"; 
               	}
               });
               
               
               $("#keywordTable").find("tr:gt(0)").remove(); 
               var keywordTable = document.getElementById("keywordTable");
               keywordData?.map((item,index) => {
               	if(item){
               	var row = keywordTable.insertRow(1);
                   var cell1 = row.insertCell(0);
                   var cell2 = row.insertCell(1);
                   var cell3 = row.insertCell(2);
                   cell1.innerHTML = item?.key;
                   cell2.innerHTML = item?.value;
                   cell3.innerHTML ="<button type='button' class='btn btn-danger btn-sm' onclick='deleteEditKeyword(this)' id='"+index+"'>Delete</button>";
               	}
               });
               
               $("#photoCreditTable").find("tr:gt(0)").remove(); 
               var photoCreditTable = document.getElementById("photoCreditTable");
               photoCreditData?.map((item,index) => {
               	if(item){
               	var row = photoCreditTable.insertRow(1);
                   var cell1 = row.insertCell(0);
                   var cell2 = row.insertCell(1);
                   var cell3 = row.insertCell(2);
                   cell1.innerHTML = item?.key;
                   cell2.innerHTML = item?.value;
                   cell2.innerHTML = item.value;
                   cell3.innerHTML ="<button type='button' class='btn btn-danger btn-sm' onclick='deleteEditPhotoCredit(this)' id='"+index+"'>Delete</button>"; 
               	
               	}
               });
               
               $("#blogLableTable").find("tr:gt(0)").remove(); 
               var blogLableTable = document.getElementById("blogLableTable");
               blogLabelsData?.map((item,index) => {
               	if(item){
               	var row = blogLableTable.insertRow(1);
                   var cell1 = row.insertCell(0);
                   var cell2 = row.insertCell(1);
                   var cell3 = row.insertCell(2);
                   var cell4 = row.insertCell(3);
                   cell1.innerHTML = item?.color;
                   cell2.innerHTML = item?.text;
                   cell3.innerHTML = item?.icon;
                   cell4.innerHTML ="<button type='button' class='btn btn-danger btn-sm' onclick='deleteEditBloglable(this)' id='"+index+"'>Delete</button>";               	}
               });
               
               	$('#editId').val(data.id);
               	$('#title').val(data.title);
                   $('#subTitle').val(data.subTitle);
                   $("#"+data.category.id).attr("selected","selected");
                   $('#description').val(data.description);
                   $('#tags').val(data.tags);
                   $('#poweredBy').val(data.poweredBy);
                   $('#selfTags').val(data.selfTags.toString()||"");
                   $('#crosstags').val(data?.crossTags?.toString());
                   $('#exernalLink').val(data?.exernalLink?.toString()||"");
                   if(data.addToBag==true){
                   	$('#addToBagYes').attr('checked','checked');
                   }else{
                   	$('#addToBagNo').attr('checked','checked');
                   }
                   $('#authorName').val(data.authorName);
                   $('#publishDate').val(new Date(data.publishDate).toISOString().split('T')[0]);
                   $('#expiryDate').val(new Date(data.expiryDate).toISOString().split('T')[0]);
                   $("#"+data.state).attr("selected","selected");
               	}
               });
      }
      
      
      
      function deleteBlog(id){
   		 $.ajax({
              type: "DELETE",
              url : baseURL + "/blogs/"+id,
              contentType: false,
              processData: false,
              data: "",
              beforeSend: function () {
                  $("#trLoader").show();
              },
              success: function (results) {
              	 $("#alert-delete").fadeTo(2000, 800).slideUp(800, function(){
 			$("#alert-delete").slideUp(1000);
 		 });  
              	 setTimeout(function () {
                       window.location.reload();
                   }, 700);
              }
      	});
   	}
      
      function openAddModal(){
    	  document.getElementById("editId").value="";
    	  document.getElementById("blogform").reset();
    	  $("#contentTable").find("tr:gt(0)").remove();
    	  $("#blogLableTable").find("tr:gt(0)").remove();
    	  $("#keywordTable").find("tr:gt(0)").remove();
    	  $("#photoCreditTable").find("tr:gt(0)").remove();
      }
      
   </script>
   <script type="text/javascript">
      var emptyRow = "<tr><td colspan='4' class='text-center'> No Records Available</td></tr>";
      var emptyNewRow = "<tr class='trNewRow'>";
      
      
      
      $(document).ready(function () {
    	  $(document).on('hidden.bs.modal','#myModal',function () {
    		  console.log("gello");
    		});
    	  
          
      	var baseURL = '${pageContext.servletContext.contextPath}';
      	var pageNumber = 0;
      	var val = "";
      	loadBlogCategories();
      	
      	
      	

            function loadBlogCategories() {
              	$.ajax({
                   type: "GET",
                   url : baseURL + "/getBlogCategories",
                   contentType: false,
                   processData: false,
                   data: "",
                   success: function (blogCategorylist) {
                   	createCategorySelectBox(blogCategorylist);			
                   }
                   
              	});
              }
              
              function createCategorySelectBox(blogs) {
              	var blogCategorylist = JSON.parse(blogs);
              	if(blogCategorylist && blogCategorylist.length > 0) {
              		for(var i=0;i<blogCategorylist.length;i++) {
              			$('#blogCategorySelect').append('<option value="'+ blogCategorylist[i].id + '">'+ blogCategorylist[i].name +'</option>');
              		}            		
              	}
              }
      	
      	<!----------------------end add blog------------------->

      });
   </script>
</body>