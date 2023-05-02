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
                        <h2 class="mb-2">회원정보 수정</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="${pageContext.request.contextPath}/">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active">본인확인</li>
                                <li class="breadcrumb-item active">마이페이지</li>
                                <li class="breadcrumb-item active">정보수정</li>
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

                <div class="col-xxl-7 col-xl-5 col-lg-6 col-sm-8 mx-auto">
                    <div class="log-in-box">
                        <div class="log-in-title">
                            <h2 style="color: #417505">${member.name}님의 회원정보 수정 <i class="fab fa-pagelines" style="color: #417505;"></i></h2>
                        </div>
						<br>
                        <div class="input-box justify-content-center">
                            <div class="row g-4 justify-content-center">
	                            <form method="post">
	                            	<div class="col-10">
		                            	<input type="hidden" id="name" name="id" value="${member.id}">
	                                	<div class="float-start m-2">
	                                		<h3 style="color: #417505">이름</h3>
	                                	</div>
	    	                          	<div class="float-end col-10 mt-1">
	        	                            <input type="text" class="form-control" id="name" placeholder="변경하실 이름을 입력해주세요" value="" name="name" >
	            	                    </div>
                	           		</div>
                	                
	                                <div class="col-10">
	                                	<div class="float-start m-2">
	                                		<h3 style="color: #417505">연락처</h3>
	                                	</div>
	                                   <div class="float-end col-10 mt-1">
	                                        <input type="text" class="form-control" id="phone" placeholder="변경하실 전화번호를 입력해주세요" value="" name="phone" >
	                                    </div>
	                                </div>
	                                <div class="col-10  mb-5">
	                                	<div class="float-start m-2">
	                                		<h3 style="color: #417505">e-mail</h3>
	                                	</div>
	                                    <div class="float-end col-10">
	                                        <input type="text" class="form-control" id="email" placeholder="변경하실 이메일을 입력해주세요" value="" name="email" >
	                                    </div>
	                                </div>
	                                <div class="col-3 ">
	                                   <a href="${pageContext.request.contextPath}/member/mypage"><button class="btn w-100 justify-content-center" style="color: white; background: lightgray"><strong>이전화면으로</strong></button></a>
	                                </div>
	                                <div class="col-3 ">
	                                   <button type="submit" class="btn w-100 justify-content-center info-modify"style="color: white; background: #417505"><strong>수정하기</strong></button>
	                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- log in section end -->
    <jsp:include page="../includes/footer.jsp" />
    
    <script>
    </script>
    
    
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
		$(function() {
			$(".info-modify").click(function() {
				alert("회원 정보 수정이 완료되었습니다. 자동 로그아웃 됩니다");
			})
		})
	</script>
</body>
</html>