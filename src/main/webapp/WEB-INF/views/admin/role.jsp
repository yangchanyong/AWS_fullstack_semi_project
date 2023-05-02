<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
<jsp:include page="../includes/adminHead.jsp"></jsp:include>


</head>

<body>
<!-- 	<!-- tap on top start --> -->
	<div class="tap-top">
		<span class="lnr lnr-chevron-up"></span>
	</div>
<!-- 	<!-- tap on tap end --> -->

	<!-- page-wrapper Start -->
	<div class="page-wrapper compact-wrapper" id="pageWrapper">
		<!-- Page Header Start -->
		<jsp:include page="../includes/adminHeader.jsp"></jsp:include>
		<!-- Page Header End -->

		<!-- Page Body Start -->
		<div class="page-body-wrapper">
			<!-- Page Sidebar Start-->
			<jsp:include page="../includes/adminSidebar.jsp"></jsp:include>
			<!-- Page Sidebar Ends-->

			<!-- Container-fluid starts-->
			<div class="page-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-12">
							<div class="card card-table">
								<!-- Table Start -->
								<div class="card-body">
									<div class="title-header option-title">
										<h5>Role List</h5>
										<form class="d-inline-flex">
											<a href="create-role.html"
												class="align-items-center btn btn-theme d-flex"> <i
												data-feather="plus"></i>Add Role
											</a>
										</form>
									</div>
									<div>
<!-- 										<form method="post"> -->
											<div class="table-responsive">
												<table id="table_id"
													class="col-sm-8 table role-table all-package theme-table">
													<colgroup>
														<col width=10%>
														<col width=20%>
														<col width=30%>
														<col width=15%>
														<col width=15%>
													</colgroup>
													<thead>
														<tr>
															<th>아이디</th>
															<th>이메일</th>
															<th>등록일자</th>
															<th>회원등급</th>
															<th>권한</th>
															<th>결정</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${members}" var="member" varStatus="i" > 

<%-- 															<input type="hidden" name="id" value="${member.id}"> --%>
<!-- 															<input type="hidden" name="grantNo" -->
<%-- 																value="${member.grantNo}"> --%>
<!-- 															<input type="hidden" name="gradeNo" -->
<%-- 																value="${member.gradeNo}"> --%>

															<tr>
																<td name="id" id="id" data-id="${member.id }">${member.id }</td>
																<td id="email" data-email="${member.email }">${member.email }</td>
																<td>${member.regDate }</td>
																<td id="grade"><select name="gradeNo">
																		<option value="1"
																			${member.gradeNo == 1 ? 'selected' : ''}
																			data-gradeNo="${member.gradeNo }">브론즈</option>
																		<option value="2"
																			${member.gradeNo == 2 ? 'selected' : ''}
																			data-gradeNo="${member.gradeNo }">실버</option>
																		<option value="3"
																			${member.gradeNo == 3 ? 'selected' : ''}
																			data-gradeNo="${member.gradeNo }">골드</option>
																</select></td>
																<td id="grant" data-grantNo="${member.grantNo }"><select
																	name="grantNo">
																		<option value="1"
																			${member.grantNo == 1 ? 'selected' : ''}
																			data-grantNo="${member.grantNo }">일반회원</option>
																		<option value="2"
																			${member.grantNo == 2 ? 'selected' : ''}
																			data-grantNo="${member.grantNo }">매니저</option>
																		<option value="3"
																			${member.grantNo == 3 ? 'selected' : ''}
																			data-grantNo="${member.grantNo }">관리자</option>
																</select></td>
																<td><button class="load btn btn-primary justify-content-center"  data-idx=${i.index }>수정</button></td>
															</tr>
												
														</c:forEach>
													</tbody>
												</table>
											</div>
<!-- 										</form> -->
									</div>
								</div>
								<!-- Table End -->
							</div>
						</div>
					</div>
				</div>
				<!-- Container-fluid Ends-->

				<jsp:include page="../includes/adminFooter.jsp"></jsp:include>
			</div>
		</div>
		<!-- Page Body End -->

		<!-- Modal Start -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1">
			<div class="modal-dialog  modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body">
						<h5 class="modal-title" id="staticBackdropLabel">Logging Out</h5>
						<p>Are you sure you want to log out?</p>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
						<div class="button-box">
							<button type="button" class="btn btn--no" data-bs-dismiss="modal">No</button>
							<button type="button" class="btn  btn--yes btn-primary">Yes</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal End -->
	</div>
	<!-- page-wrapper End-->

	<!-- Delete Modal Box Start -->
	<div class="modal fade theme-modal remove-coupon"
		id="exampleModalToggle" aria-hidden="true" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header d-block text-center">
					<h5 class="modal-title w-100" id="exampleModalLabel22">Are You
						Sure ?</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close">
						<i class="fas fa-times"></i>
					</button>
				</div>
				<div class="modal-body">
					<div class="remove-box">
						<p>The permission for the use/group, preview is inherited from
							the object, object will create a new permission for this object</p>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-animation btn-md fw-bold"
						data-bs-dismiss="modal">No</button>
					<button type="button" class="btn btn-animation btn-md fw-bold"
						data-bs-target="#exampleModalToggle2" data-bs-toggle="modal"
						data-bs-dismiss="modal">Yes</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 회원 관리 (수정) -->
	<div class="modal fade" id="replyModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Reply Modal</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="reply">Reply</label> <input type="text"
							class="form-control" id="reply" placeholder="Enter reply">
					</div>
					<div class="form-group">
						<label for="replyer">Replyer</label> <input type="text"
							class="form-control" id="replyer" placeholder="Enter replyer">
					</div>
					<div class="form-group">
						<label for="replydate">Reply Date</label> <input type="text"
							class="form-control" id="replydate">
					</div>
				</div>
				<div class="modal-footer" id="modalFooter">
					<button class="btn btn-warning" type="button" data-dismiss="modal">Modify</button>
					<button class="btn btn-danger" type="button" data-dismiss="modal">Remove</button>
					<button class="btn btn-primary" type="button" data-dismiss="modal">Register</button>
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>





	<div class="modal fade theme-modal remove-coupon"
		id="exampleModalToggle2" aria-hidden="true" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-center" id="exampleModalLabel12">Done!</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close">
						<i class="fas fa-times"></i>
					</button>
				</div>
				<div class="modal-body">
					<div class="remove-box text-center">
						<div class="wrapper">
							<svg class="checkmark" xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 52 52">
                                    <circle class="checkmark__circle"
									cx="26" cy="26" r="25" fill="none" />
                                    <path class="checkmark__check"
									fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                                </svg>
						</div>
						<h4 class="text-content">It's Removed.</h4>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" data-bs-toggle="modal"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Delete Modal Box End -->

	<!-- latest js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/jquery-3.6.0.min.js"></script>

	<!-- Bootstrap js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/bootstrap/bootstrap.bundle.min.js"></script>

	<!-- feather icon js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/icons/feather-icon/feather.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/icons/feather-icon/feather-icon.js"></script>

	<!-- scrollbar simplebar js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/scrollbar/simplebar.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/scrollbar/custom.js"></script>

	<!-- customizer js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/customizer.js"></script>

	<!-- Sidebar js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/config.js"></script>



	<!-- Data table js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/jquery.dataTables.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/custom-data-table.js"></script>

	<!-- all checkbox select js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/checkbox-all-check.js"></script>

	<!-- sidebar effect -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/sidebareffect.js"></script>

	<!-- Theme js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/script.js"></script>


	<script>
		$(function() {
			
			
			$(".load").on("click", function() {
				var btn = $(this);
				var tr = btn.parent().parent();
				var td = tr.children();
				
				// 해당 행의 모든 데이터 (아이디, 등급, 권한) 
				let id = td.eq(0).text();
				let gradeNo = td.eq(3).find("select").val();
				let grantNo = td.eq(4).find("select").val();
				console.log(id);
				
				
				let obj = {
					grantNo : grantNo,
					gradeNo : gradeNo,
					id : id
				};
				console.log(obj);
				
				$.ajax({
					url : "role",
					method : "post",
					data : obj,
					success : function(data) {
						location.reload();
					}
				})
			})
		});
	</script>
</body>

</html>