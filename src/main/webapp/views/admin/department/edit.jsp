<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:url var="APIurl" value="/api-admin-department"/>
<c:url var ="NewURL" value="/admin-department-edit"/>
<html>
<head>
    <title>Chỉnh sửa nhân viên</title>
<link rel="stylesheet"
	href="<c:url value='/template/admin/assets/css/bootstrap.min.css' />" />
<link rel="stylesheet"
	href="<c:url value='/template/admin/font-awesome/4.5.0/css/font-awesome.min.css' />" />
<link rel="stylesheet"
	href="<c:url value='/template/admin/assets/css/ace.min.css' />"
	class="ace-main-stylesheet" id="main-ace-style" />
<script
	src="<c:url value='/template/admin/assets/js/ace-extra.min.js' />"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type='text/javascript'
	src='<c:url value="/template/admin/js/jquery-2.2.3.min.js" />'></script>
<script
	src="<c:url value='/template/admin/assets/js/jquery.2.1.1.min.js' />"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="<c:url value='/template/paging/jquery.twbsPagination.js' />"></script>
	<link href="<c:url value='/template/admin/css/style.css' />" rel="stylesheet" type="text/css" media="all"/>	
</head>
<body class="no-skin">
	<!-- header -->
	<%@ include file="/common/admin/header.jsp"%>
	<!-- header -->

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>
		<%@ include file="/common/admin/menu.jsp"%>
		<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">Chỉnh sửa phòng ban/li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                        <c:if test="${not empty messageResponse}">
									<div class="alert alert-${alert}">
  										${messageResponse}
									</div>
						</c:if>
                        <form id="formSubmit">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tên Phòng Ban</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="name" name="name" value="${model.name}"/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Mô tả</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="description" name="description" value="${model.description}"/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Danh sách nhân viên</label>
                                                              
                                    
                                    	<c:if test="${not empty model.employeeList }">
                                    	 <div class="col-sm-8" style="border: solid #d5d5d5 1px; border-radius: 20px; padding: 10px">  
                                    		<div class="row">
                                    			<c:forEach var="item" items="${model.employeeList}"> 
								    				<div class=" col-sm-5" style="border: solid #d5d5d5 1px; border-radius: 20px; padding: 10px ;margin:5px 5px;">
														<img src="${item.image}" alt="Avatar" class="avatar"
														 style="vertical-align: middle;width: 50px;height: 50px;border-radius: 50%; float: left;  margin-right: 10px;">
														<div class="text" style="margin-top:5px">
								    						<div><strong>${item.name }</strong></div>
								    						<div>${item.email }</div>
								    					</div>
													</div>
												</c:forEach>
								   			</div>
								   		 </div>
                                    	</c:if>
                                    	
                                    
                               
                                		<c:if test="${empty model.employeeList }">
                                    		<div class="col-sm-8">
                                    			<input type="text" class="form-control" id="description" name="description" value="Hiện chưa có nhân viên nào" disabled/>
                                			</div>
                                    	</c:if>
                                    	
                                    	<div class="col-sm-1">
                                    	<a flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Chỉnh sửa danh sách nhân viên' href='#' id="openDialog">
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
												
												
												
												</div>
                            </div>
                            <br/>
                            <br/>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <c:if test="${not empty model.id}">
                                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật thông tin" id="btnAddOrUpdate"/>
                                    </c:if>
                                    <c:if test="${empty model.id}">
                                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm phòng ban" id="btnAddOrUpdate"/>
                                    </c:if>
                                </div>
                                
                                
                            </div>
                           <input type="hidden" value="${model.id}" id="id" name="id" />
                           
                           <div id="dialog-modal" title="Danh sách nhân viên" style="display:none">
							  <div class="row">
						<div class="col-xs-12">
							<div class="table-responsive">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th><input type="checkbox" id="checkedAll" name="checkedAll" ></th>
											<th>Tên nhân viên</th>
											<th>Số điện thoại</th>
											<th>Email</th>
											
										</tr>
									</thead>
									<tbody id="content">
										<c:forEach var="item" items="${allEmployee}">
											<tr>
												<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}" class="checkSingle" ${item.check }></td>
												<td>
												<img src="${item.image}" alt="Avatar" class="avatar"
														 style="vertical-align: middle;width: 50px;height: 50px;border-radius: 50%; float: left;  margin-right: 10px;">
												${item.name }
												</td>
												<td>${item.contact }</td>
												<td>${item.email }</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
<!-- 								<button class="btn btn-primary" onclick="loadMore()">Xem thêm</button> -->
								
							</div>
						</div>
					</div>
							  
							</div>

                           
                        </form>
                </div>
                

            </div>
            
            
            
					
					
					
            
            
            
        </div>
    </div>
</div>
		<%@ include file="/common/admin/footer.jsp"%>
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse display"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>



	<script
		src="<c:url value='/template/admin/assets/js/bootstrap.min.js' />"></script>
	<script
		src="<c:url value='/template/admin/assets/js/jquery-ui.custom.min.js' />"></script>
	<script
		src="<c:url value='/template/admin/assets/js/jquery.ui.touch-punch.min.js' />"></script>
	<script
		src="<c:url value='/template/admin/assets/js/jquery.easypiechart.min.js' />"></script>
	<script
		src="<c:url value='/template/admin/assets/js/jquery.sparkline.min.js' />"></script>
	<script
		src="<c:url value='/template/admin/assets/js/jquery.flot.min.js' />"></script>
	<script
		src="<c:url value='/template/admin/assets/js/jquery.flot.pie.min.js' />"></script>
	<script
		src="<c:url value='/template/admin/assets/js/jquery.flot.resize.min.js' />"></script>
	<script
		src="<c:url value='/template/admin/assets/js/ace-elements.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/ace.min.js' />"></script>
	<script
		src="<c:url value='/template/admin/assets/js/bootstrap.min.js'/>"></script>

	<!-- page specific plugin scripts -->
	<script
		src="<c:url value='/template/admin/assets/js/jquery-ui.min.js'/>"></script>
		<script>
$(document).ready(function() {
	  $("#checkedAll").change(function(){
	    if(this.checked){
	      $(".checkSingle").each(function(){
	        this.checked=true;
	      })              
	    }else{
	      $(".checkSingle").each(function(){
	        this.checked=false;
	      })              
	    }
	  });
	
	  $(".checkSingle").click(function () {
	    if ($(this).is(":checked")){
	      var isAllChecked = 0;
	      $(".checkSingle").each(function(){
	        if(!this.checked)
	           isAllChecked = 1;
	      })              
	      if(isAllChecked == 0){ $("#checkedAll").prop("checked", true); }     
	    }else {
	      $("#checkedAll").prop("checked", false);
	    }
	  });
	});
	

	$(function() {
	   $( "#openDialog").on("click", function(){ 
	       $( "#dialog-modal" ).dialog({
	          height: 600,
	          width: 700,
	          modal: true,
	        });
	       $( "#dialog-modal" ).show();
	    });
	 });

	$("#btnAddOrUpdate").click(function(e){
		e.preventDefault(); // tránh submit nhầm url
		var data = {};
		var formData = $('#formSubmit').serializeArray(); // tự động lấy tất cả field có thuộc tính name
		var employee = $('input[type=checkbox]:checked').map(function(_, el) {
		    return $(el).val();
		}).get();
		$.each(formData, function(i, v){
			data[""+v.name+""] = v.value;
		});
		data["employeeIdMapping"] = employee;
		var id = $('#id').val();
		if(id == ""){
			addDepartment(data);
		} else {
			updateDepartment(data);
		}
		
	});
	
	
	function addDepartment(data){
		$.ajax({
			url: '${APIurl}',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(data),
			dataType: 'json',
			success: function(result){
				window.location.href = "${newURL}?id=" + result.id+"&message=insert_success";
			},
			error: function(error){
				window.location.href = "${newURL}?message=error_system";
			}
		});
	}
	
	function updateDepartment(data){
		$.ajax({
			url: '${APIurl}',
			type: 'PUT',
			contentType: 'application/json',
			data: JSON.stringify(data),
			dataType: 'json',
			success: function(result){
				window.location.href = "${newURL}?id=" + result.id+"&message=update_success";
			},
			error: function(error){
				window.location.href = "${newURL}?message=error_system";
			}
		});
	}
</script>
</body>

</html>
