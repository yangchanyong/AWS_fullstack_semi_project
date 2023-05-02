<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fm"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
<jsp:include page="../includes/adminHead.jsp"></jsp:include>
</head>

<body>
	<!-- tap on top start-->
	<div class="tap-top">
		<span class="lnr lnr-chevron-up"></span>
	</div>
	<!-- tap on tap end-->

	<!-- page-wrapper Start-->
	<div class="page-wrapper compact-wrapper" id="pageWrapper">
		<!-- Page Header Start-->
		<jsp:include page="../includes/adminHeader.jsp"></jsp:include>
		<!-- Page Header Ends-->

		<!-- Page Body Start-->
		<div class="page-body-wrapper">
			<!-- Page Sidebar Start-->
			<jsp:include page="../includes/adminSidebar.jsp"></jsp:include>
			<!-- Page Sidebar Ends-->

			<!-- Order Tracking Seation starts-->
			<div class="page-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="row">
								<div class="col-sm-12">
									<div class="title-header option-title">
										<h5>주문 및 배송 관리</h5>
									</div>
									<c:forEach items="${list }" var="pay">
									<input type="hidden" name="codeNo" id="codeNo" value="${pay.codeNo}">
									<div class="card">
										<div class="title-header option-title">
												<h5>주문 번호 : ${pay.payNo }</h5>
										</div>
										<div class="order-list card-body float-start">
											<!-- 											주문 하나 == 결제 번호 -->
											<div class="row">
											<div class="col-2">
												<img src="thumb/image?codeNo=${pay.codeNo }" alt="thumbnail">
											</div>
											
											<div class="col-10 overflow-hidden float-start">
<!-- 												<div class="order-left-image"> -->
														<img src="assets/images/profile/1.jpg"
															class="img-fluid w-100 blur-up lazyload" alt="">
													<div class="order-image-contain">
														<h2>${pay.id }</h2>
														<div class="tracker-number py-3">
<!-- 																<p> -->
<%-- 																	주문 번호 : <span>${pay.payNo }</span> --%>
<!-- 																</p> -->
															<p>
																상품명 : 
															<span>${pay.proName} 
																<c:if test="${pay.cartCnt > 1}">
																	외 ${pay.cartCnt - 1} 건
																</c:if>
															</span>
															</p>
															<p>
																가격 : <span>
																<fm:formatNumber value="${pay.totalPrice}"/>원
																</span>
															</p>
														</div>
													</div>
<!-- 												</div> -->
											</div>
											</div>

										</div>
										
										<div class="card-footer text-end border-0 pb-0 float-start">
											<div class="float-start">
												<h2>
												<fm:formatDate value="${pay.regDate}" pattern="yyyy-MM-dd"/>
												</h2>
											</div>
											<div>
												<span><button class="btn btn-primary me-3">상세보기</button></span>
												<span><button class="btn btn-primary me-3">발송</button></span>
											</div>
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Container-fluid Ends-->

				<!-- footer start-->
				<jsp:include page="../includes/adminFooter.jsp"></jsp:include>
				<!-- footer end-->
			</div>
			<!--  Seation End-->
		</div>
		<!-- Page Body End-->
	</div>
	<!-- page-wrapper End-->

	<!-- Modal Start -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
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

	<!-- latest js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/jquery-3.6.0.min.js"></script>

	<!-- Bootstrap js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/bootstrap/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/notify/bootstrap-notify.min.js"></script>

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

	<!-- Sidebar js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/config.js"></script>

	<!-- bootstrap tag-input js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/bootstrap-tagsinput.min.js"></script>

	<!-- customizer js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/customizer.js"></script>

	<!-- customizer js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/sidebar-menu.js"></script>

	<!--Dropzon js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/dropzone/dropzone.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/dropzone/dropzone-script.js"></script>

	<!-- Plugins js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/notify/index.js"></script>

	<!-- sidebar effect -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/sidebareffect.js"></script>

	<!-- Theme js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets2/js/script.js"></script>
	<script>
	let codeNo = "${pay.codeNo }";
	let obj = {codeNo:codeNo};
		$.ajax({
			url : "${pageContext.request.contextPath}/thumb/image",
			method : "get", 
			data : obj,
			contentType : false
		})
	</script>
</body>

</html>