<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../includes/head.jsp" />
<style>
.comment {
  white-space: pre;
}
</style>
<body>
<jsp:include page="../includes/header.jsp" />

    <!-- mobile fix menu start -->
    <div class="mobile-menu d-md-none d-block mobile-cart">
        <ul>
            <li class="active">
                <a href="index.html">
                    <i class="iconly-Home icli"></i>
                    <span>Home</span>
                </a>
            </li>

            <li class="mobile-category">
                <a href="javascript:void(0)">
                    <i class="iconly-Category icli js-link"></i>
                    <span>Category</span>
                </a>
            </li>

            <li>
                <a href="search.html" class="search-box">
                    <i class="iconly-Search icli"></i>
                    <span>Search</span>
                </a>
            </li>

            <li>
                <a href="cart.html">
                    <i class="iconly-Bag-2 icli fly-cate"></i>
                    <span>Cart</span>
                </a>
            </li>
        </ul>
    </div>
    <!-- mobile fix menu end -->

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
                                <li class="breadcrumb-item active">약관동의</li>
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
                    <div class="log-in-box p-3">
                        <div class="log-in-title">
                        </div>
                        <div class="input-box">
                            <form method="get" name="frm" class="row g-4">
                                <div class="col-xxl-12 col-lg-12 ratio_50">
				                    <div class="blog-detail-contain" >
				                        <div class="card" style="height:200px">
				                            <div class="card-body overflow-auto " style="white-space:pre-line"> 
				                            	제 1 조 (목적)
				                                본 약관은 푸드득 대표누리집 (이하 "누리집")이 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 누리집의 권리, 의무, 책임사항과 기타 제반 사항을 규정함을 목적으로 합니다.
				                                
				                                제 2 조 (약관의 명시와 개정)
				                                1. 누리집은 이 약관의 내용과 주소지, 관리자의 성명, 개인정보보호 담당자의 성명, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 누리집의 초기 서비스화면(전면)에 게시합니다.
				                                2. 누리집은 약관의 규제에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
				                                3. 누리집이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 누리집의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일 까지 공지합니다.
				                                4. 이 약관에 동의하는 것은 정기적으로 웹을 방문하여 약관의 변경사항을 확인하는 것에 동의함을 의미합니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 이용자의 피해는 누리집에서 책임지지 않습니다.
				                                5. 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴(해지)를 요청할 수 있으며, 변경된 약관의 효력 발생일로부터 7일 이후에도 거부의사를 표시하지 아니 하고 서비스를 계속 사용할 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.
				                                6. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 기타 관련 법령의 규정에 의합니다.
				                               
				                                제 3 조 (용어의 정의)
				                                1. 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
				                                ① 이용계약 : 서비스 이용과 관련하여 누리집과 이용자 간에 체결하는 계약
				                                ② 가입 : 누리집이 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위
				                                ③ 회원 : 누리집에 회원가입에 필요한 개인 정보를 제공하여 회원 등록을 한 자로서, 누리집의 정보 및 서비스를 이용할 수 있는 자
				                                ④ 이용자번호(ID) : 이용고객의 식별과 이용자가 서비스 이용을 위하여 이용자가 정하고 누리집이 승인하는 문자와 숫자의 조합
				                                ⑤ 비밀번호(PW) : 이용자가 등록회원과 동일인인지 신원을 확인하고 통신상의 자신의 개인정보보호를 위하여 이용자 자신이 정한 문자와 숫자의 조합
				                                ⑥ 게시물 : 회원이 서비스를 이용하면서 게시한 글, 이미지, 동영상 등 각종 파일과 링크 등
				                                ⑦ 탈퇴(해지) : 서비스 또는 회원이 이용계약을 종료하는 행위
				                                ...
				                            </div>
				                         </div>
				                         <div class="form-check my-3">
						                     <label class="form-check-label" for="checkAgree">약관에 동의하시겠습니까?</label>
						                     <input class="form-check-input" type="checkbox" value="" id="checkAgree">
					                     </div>
					                </div>
			                       	<div class="col-12">
	                                    <a href="signup" onClick="chk()" class="btn btn-animation " id="button">다음 페이지</a>
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
			alert("약관에 동의해주세요");
			return;
		}
		$("#button").click(function() {
			event.preventDefault();
			location.href = "/member/signup";
		})
	}
	</script>
</body>
</html>