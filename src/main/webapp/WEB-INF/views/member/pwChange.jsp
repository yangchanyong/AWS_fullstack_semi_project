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
                                    <a href="index.html">
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
                            <h2 style="color: #417505">${member.name}님의 비밀번호 변경 <i class="far fa-hand-point-left" style="color: #417505;"></i></h2>
                        </div>
						<br>
                        <div class="input-box justify-content-center">
                            <div class="row g-4 justify-content-center">
	                            <div class="col-10">
	                            <form method="post" id="frm">
	                            	<input type="hidden" id="name" name="id" value="${member.id}">
                                	<div class="float-start m-2">
                                		<h3 style="color: #417505">변경하실 비밀번호</h3>
                                	</div>
    	                          	<div class="float-end col-8 mt-1">
        	                            <input type="password" class="form-control" id="pw" placeholder="변경하실 비밀번호를 입력해주세요" name="pw" >
                                		<output id="outputPw"></output>
            	                    </div>
                	           	</div>
                                <div class="col-10 mb-5">
                                	<div class="float-start m-2">
                                		<h3 style="color: #417505">비밀번호 확인</h3>
                                	</div>
                                   <div class="float-end col-8 mt-1">
                                        <input type="password" class="form-control" id="checkpw" placeholder="비밀번호를 한번 더 입력해주세요"name="checkpw" >
	                               		<output id="outputCheckpw"></output>
                                    </div>
                                </div>
                                <div class="col-3 ">
                                   <a href="${pageContext.request.contextPath}/"><button class="btn w-100 justify-content-center" style="color: white; background: lightgray"><strong>메인화면으로</strong></button></a>
                                </div>
                                <div class="col-3 ">
                                   	<button type="submit" class="btn w-100 justify-content-center info-modify"style="color: white; background: red" id="btnChangePw"><strong>비밀번호 변경</strong></button>
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
			$("#btnChangePw").attr('disabled', true);
			
			let frm = document.getElementById("frm");
		 	$("#pw").blur(function() {
	        	let pw =/^[a-z]+[a-z0-9]{4,20}$/g;
	            if(!pw.test(frm.pw.value)){
	                frm.outputPw.innerHTML = "비밀번호는 영소문자/대문자, 숫자  4글자 이상 20글자 이하로 입력해주세요";
	                frm.outputPw.style.color = 'red'
	           } else {
	            	frm.outputPw.style.color = 'black'
	                frm.outputPw.innerHTML = "사용 가능한 비밀번호 입니다";
	           }
	        })
	        
	        $("#checkpw").blur(function() {
	             if(checkpw.value !== pw.value){
	                frm.outputCheckpw.innerHTML = "비밀번호 확인이 일치하지 않습니다";
	                frm.outputCheckpw.style.color = 'red'
	            } else {
	                frm.outputCheckpw.innerHTML = "";
	                frm.outputPw.style.color = 'black'
		            frm.outputPw.innerHTML = "사용 가능한 비밀번호 입니다";
	                $("#btnChangePw").attr('disabled', false);
	            } 
	        })
			
			$(".info-modify").click(function() {
				alert("회원 정보 수정이 완료되었습니다. 자동 로그아웃됩니다");
			})
		})
	</script>
</body>
</html>