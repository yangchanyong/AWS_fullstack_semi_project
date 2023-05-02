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
                        <h2 class="mb-2">마이페이지</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="${pageContext.request.contextPath}/">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active">본인확인</li>
                                <li class="breadcrumb-item active">마이페이지</li>
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
                            <h2 style="color: #417505">${member.name}님 <i class="fab fa-pagelines" style="color: #417505;"></i></h2>
                        </div>
						<br>
                        <div class="input-box justify-content-center">
                            <div class="row g-4 justify-content-center">
                                <div class="col-xxl-10 col-lg-10 col-sm-10">
                                	<div class="float-start m-2">
                                		<h3 style="color: #417505">ID</h3>
                                	</div>
                                    <div class="float-end col-10 mt-1">
                                        <input type="text" class="form-control" id="id" placeholder="아이디" value="${member.id}" name="id" readonly>
                                    </div>
                                </div>
	                            <div class="col-10">
                                	<div class="float-start m-2">
                                		<h3 style="color: #417505">이름</h3>
                                	</div>
    	                          	<div class="float-end col-10 mt-1">
        	                            <input type="text" class="form-control" id="name" placeholder="이름" value="${member.name}" name="name" readonly>
            	                    </div>
                	           	</div>
                	                
                                <div class="col-10">
                                	<div class="float-start m-2">
                                		<h3 style="color: #417505">연락처</h3>
                                	</div>
                                   <div class="float-end col-10 mt-1">
                                        <input type="text" class="form-control" id="phone" placeholder="전화번호" value="${member.phone}" name="phone" readonly>
                                    </div>
                                </div>
                                <div class="col-10">
                                	<div class="float-start m-2">
                                		<h3 style="color: #417505">e-mail</h3>
                                	</div>
                                    <div class="float-end col-10 mt-1">
                                        <input type="text" class="form-control" id="email" placeholder="이메일" value="${member.email}" name="email" readonly>
                                    </div>
                                </div>
                                <div class="col-10 mb-5">
                                	<div class="float-start m-2">
                                		<h3 style="color: #417505">회원등급</h3>
                                	</div>
                                    <div class="float-end col-10 mt-1"">
                                        <input type="text" class="form-control" id="gradeName" placeholder="등급" value="${member.gradeName}" name="gradeName" readonly>
                                    </div>
                                </div>
                                <div class="col-3 ">
                                   <a href="${pageContext.request.contextPath}/"><button class="btn w-100 justify-content-center" style="color: white; background: lightgray"><strong>메인화면으로</strong></button></a>
                                </div>
                                <div class="col-3 ">
                                   <a href="${pageContext.request.contextPath}/member/modify"><button class="btn w-100 justify-content-center"style="color: white; background: #417505"><strong>회원정보 수정</strong></button></a>
                                </div>
                                <div class="col-3 ">
                                   <a href="${pageContext.request.contextPath}/member/checkuser"><button class="btn w-100 justify-content-center"style="color: white; background:red "><strong>비밀번호 수정하기</strong></button></a>
                                </div>
                                <div class="col-1 ">
                                   <a href="${pageContext.request.contextPath}/member/deleteId"><button class="btn w-100 justify-content-center rs-3 btn-danger border border-danger deleteId"><strong>탈퇴</strong></button></a>
                                </div>
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

	<script>
		$(".deleteId").click(function() {
			var result = confirm("정말 탈퇴하시겠습니까?");
			if(result) {
				document.getElementsByClassName(".deleteId").submit()
			}
			else{
				return false;
			}
		})
	</script>

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
</body>
</html>