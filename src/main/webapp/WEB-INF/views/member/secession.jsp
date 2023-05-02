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
                        <h2 class="mb-2">약관동의</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="${pageContext.request.contextPath}/">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active">본인확인</li>
                                <li class="breadcrumb-item active">마이페이지</li>
                                <li class="breadcrumb-item active">탈퇴</li>
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
                <div class="col-xxl-4 col-xl-5 col-lg-6 col-sm-8 mx-auto">
                    <div class="log-in-box p-4">
                        <div class="log-in-title">
                        </div>
                        <div class="input-box">
                            <form method="get" name="frm" class="row g-4">
                                <div class="col-xxl-9 col-xl-8 col-lg-7 ratio_50">
				                    <div class="blog-detail-contain" >
			                            <h2 class="pb-4">그동안 푸드득을 이용해주셔서 감사합니다.</h2>
				                        <div style="width: 500px; height: 300px;">
				                            	<p>
												회원탈퇴를 하시면 푸드득의 회원약관 및 개인정보제공·활용에 관한 동의가 모두 철회되며, 
												모든 회원 서비스 및 웹사이트로부터 탈퇴하게 됩니다.
												회원 탈퇴를 진행하기 전, 하단의 안내사항을 반드시 확인해주십시오.
												<br><br>
												회원 탈퇴 시 유의사항
												<br><br>
												회원탈퇴를 하시면 가입 시 입력한 회원님의 개인정보는 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
												<br><br>
												회원 탈퇴 후 보존항목 안내
												<br><br>
												푸드득 내 회원님이 작성한 게시글, 후기 등과
												결제 이력은 자동으로 삭제되지 않고 유지됩니다.
												삭제를 원하는 항목이 있는 경우, 탈퇴하기 전 반드시 삭제해 주십시오.
												탈퇴가 완료된 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 없어,
												게시글을 임의로 삭제해 드릴 수 없으니 이 점을 반드시 유의하시길 바랍니다.
												</p>
				                        </div>
				                        <div class="form-check">
						                    <label class="form-check-label" for="checkAgree">안내사항을 모두 확인하였으며, 이에 동의합니다.</label>
						                    <input class="form-check-input" type="checkbox" value="" id="checkAgree">
					                    </div>
					                </div>
			                       	<div class="col-12 btn-group pt-3">
	                                    <a href="signup" onClick="chk()" id="button" class="btn btn-animation w-100">탈퇴하기</a>
	                                    <a href="${pageContext.request.contextPath}/" class="btn btn-animation w-100">다음에 하기</a>
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
	function chk() {
		var frm = document.frm;
	 	if(!frm.checkAgree.checked){
	 		event.preventDefault();
			alert("안내사항을 확인한 후 동의해 주세요");
			return;
		}
		$("#button").click(function() {
			event.preventDefault();
			location.href = "/";
		})
	}
	</script>
</body>
</html>