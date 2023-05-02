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
                        <h2 class="mb-2">배송지 목록</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="${pageContext.request.contextPath}/">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active">배송지 목록</li>
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
                            <form method="post" autocomplete="off" class="row g-4 justify-content-center">
				            	<div class="log-in-title">
			                    	<h3 style="color: #417505"><i class="fas fa-motorcycle me-2" style="color: #417505"></i>${member.name}님의 배송지 목록 </h3>
			                    </div>
			                    <c:if test="${empty addresslist}">
			                    	<h6>등록된 배송지가 없습니다. 배송지를 추가해주세요</h6>
			                    </c:if>
			                    <c:if test="${not empty addresslist}">
			                    <c:forEach items="${addresslist}" var="address">
                                	<div class="m-4 pick-address col-xxl-3 col-xl-3 col-md-12 col-sm-12 justify-content-center" style="background-color: white">
	                                	<div class="float-left">
	                                		<div class="address-name"><span>배송지명</span> <span class="p-2 fs-6">${address.addrName}</span>
											</div>
										</div>
										<hr>
						                <input type="hidden" class="form-control mt-3" id="addrNo" placeholder="배송지번호" value="${address.addrNo}" name="addrNo" readonly>
						                <p>주소 ${address.addr} ${address.addrDetail}</p> 
							            <p>수령인 ${address.recipient}</p>
							            <p>메모 ${address.memo}</p>
							            <p>연락처 ${address.phone}</p>
		                                <div class="form-check float-end">
		                                	<div class="btn-group">
												<a href="modify?addrNo=${address.addrNo}" class="btn btn-outline-warning btn-sm border border-warning">수정</a>
												<a href="remove?addrNo=${address.addrNo}" class="btn btn-danger check-input btn-sm border border-danger">삭제</a>
											</div>
										</div>
			                 		</div>
			                    </c:forEach>
			                    </c:if>
			                    <br>
								<div class="col-12 btn-group justify-content-center">
								  <div class="col-10 d-flex justify-content-center">
								 	 <a href="add" type="button" class="fs-7 btn btn-animation p-2 add ${count >= 3 ? 'disabled' : '' } m-2 col-3">배송지 추가</a>
								  	 <a href="${pageContext.request.contextPath}/" type="button" class="btn btn-animation p-2 m-2 col-3">홈으로</a>
								  </div>
								</div>
                            </form>
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
		var result = confirm("정말 삭제하시겠습니까?");
		if(result) {
			 // 클릭한 라디오 버튼의 상위 요소에서 해당 주소 요소들을 선택
		    var addressElements = $(this).closest('div .pick-address').find('input[type="text"]');
		    //주소, 삭제, 수정 버튼 삭제 
		    addressElements.parent().remove();
		} else {
			return false;
		}
		
	})
</script>


</body>
</html>