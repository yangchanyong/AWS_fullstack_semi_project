<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../includes/head.jsp" />
<body>
<jsp:include page="../includes/header.jsp" />


    <!-- Breadcrumb Section Start -->
    <section class="breadscrumb-section pt-0">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="breadscrumb-contain">
                        <h2 class="mb-2">결제내역</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="${pageContext.request.contextPath}/">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active">결제내역</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

	<!-- log in section start -->
	<section class="log-in-section background-image-2 section-b-space">
		<div class="container-fluid-lg w-100">
			<div class="row">
				<div class="col-xxl-12 col-xl-12 col-lg-12 col-sm-12 mx-auto">
					<div class="log-in-box">
						<div class="input-box">
							<div class="row justify-content-center">
								<div class="log-in-title">
									<h3 style="color: #417505">
										<i class="far fa-smile-wink" style="color: #417505;"></i>장동건님의 결제내역
									</h3>
								</div>
								<!-- 시작 -->
								<div class="m-4 pick-address col-xxl-10 col-xl-10 col-md-10 col-sm-10 justify-content-center b-3" style="background-color: white">
									<div class="container">
										<div class="row mt-5 mb-5">
											<div class="address-name col-10 float-start">
												<span class="fs-5"><strong>2023. 04. 20 주문</strong></span>
											</div>
										</div>
									</div>
									<div class="container border border-3 boder-success  rounded-3">
										<br>
										<div class="row">
											<div class="col-3">
												<p>상품사진</p>
												<p>상품사진</p>
												<p>상품사진</p>
												<p>상품사진</p>
											</div>
											<div class="col-6">
												<p>해리티지 3단 대형 자동우산, 블랙 외 2상품</p>
												<p>47,000원</p>
											</div>
											<div class="col-3">
												<a href="#" class="btn btn-danger check-input btn-sm border border-danger ">내역삭제</a>
												<a href="#" class="btn btn-outline-warning btn-sm border border-warning mt-1">주문상세</a>
												<a href="#" class="btn btn-success check-input btn-sm border border-success mt-1">리뷰작성</a>
												<br>
											</div>
										</div>
									</div>
								</div>
								<!-- 끝 -->
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- log in section end -->
    <jsp:include page="../includes/footer.jsp" />
    
    <!-- Tap to top start -->
    <div class="theme-option">
        <div class="back-to-top">
            <a id="back-to-top" href="#">
                <i class="fas fa-chevron-up"></i>
            </a>
        </div>
    </div>
    <!-- Tap to top end -->

    <!-- Bg overlay Start -->
    <div class="bg-overlay"></div>
    <!-- Bg overlay End -->
    
    <!-- latest jquery-->
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap js-->
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap/popper.min.js"></script>

    <!-- feather icon js-->
    <script src="${pageContext.request.contextPath}/resources/assets/js/feather/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/feather/feather-icon.js"></script>

    <!-- Slick js-->
    <script src="${pageContext.request.contextPath}/resources/assets/js/slick/slick.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/slick/slick-animation.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/slick/custom_slick.js"></script>

    <!-- Lazyload Js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/lazysizes.min.js"></script>

    <!-- script js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/script.js"></script>

<script>
	$(".check-input").click(function() {
		if(confirm("정말 삭제하시겠습니까?")) {
			 // 클릭한 라디오 버튼의 상위 요소에서 해당 주소 요소들을 선택
		    var addressElements = $(this).closest('div .pick-address').find('input[type="text"]');
		    //주소, 삭제, 수정 버튼 삭제 
		    addressElements.parent().remove();
		}
	})
</script>


</body>
</html>