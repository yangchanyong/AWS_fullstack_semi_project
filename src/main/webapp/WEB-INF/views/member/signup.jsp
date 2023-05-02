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
                        <h2 class="mb-2">회원가입</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="${pageContext.request.contextPath}/">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active">약관동의</li>
                                <li class="breadcrumb-item active">회원가입</li>
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
                    <div class="log-in-box">
                        <div class="log-in-title">
                            <h3>푸드득에 오신 것을 환영합니다</h3>
                        </div>
                        <div class="input-box">
                            <form method="post" id="frm" class="row g-4">
                              <div class="col-12">
                                    <div class="form-floating theme-form-floating log-in-form" style="display:flex">
                                        <input type="text" class="form-control" id="id" placeholder="id" name="id">
                                        <label for="id">아이디를 입력하세요</label>
                                        <c:forEach items="${memberlist}" var="member" varStatus="i">
<%--                                         	<c:if test="${member.id != }"> --%>
                                        	<input type="hidden" class="member" value="${member.id}" data-mno="${i.index}">
                                        </c:forEach>
                                    </div>
                                  	<output id="outputId"></output>
                              </div>
                              <div class="col-12">
                                    <div class="form-floating theme-form-floating log-in-form">
                                        <input type="password" class="form-control" id="pw" placeholder="Password" name="pw">
                                        <label for="pw">비밀번호를 입력하세요</label>
                                        <output id="outputPw"></output>
                                    </div>
                              </div>
                              <div class="col-12">
                                    <div class="form-floating theme-form-floating log-in-form">
                                        <input type="password" class="form-control" id="pwchk" placeholder="pwchk" >
                                        <label for="pwchk">비밀번호를 한번 더 입력하세요</label>
                                        <output id="outputPwchk"></output>
                                    </div>
                              </div>
                              <div class="col-12">
                                    <div class="form-floating theme-form-floating log-in-form">
                                        <input type="text" class="form-control" id="name" placeholder="name" name="name">
                                        <label for="name">이름을 입력하세요</label>
                                    </div>
                              </div>
                              <div class="col-12">
                                    <div class="form-floating theme-form-floating log-in-form">
                                        <input type="text" class="form-control" id="phone" placeholder="phone" name="phone">
                                        <label for="phone">전화번호를 입력해주세요</label>
                                        <output id="outputPhone"></output>
                                    </div>
                              </div>
                              <div class="col-12">
                                    <div class="form-floating theme-form-floating log-in-form">
                                        <input type="text" class="input-email form-control" id="email" placeholder="email" name="email">
                                        <label for="email">이메일을 입력해주세요</label>
                                        <output id="outputEmail"></output>
                                    </div>
                                    <div class="mail_check_button">
				                    	<button type="button" class="btn btn-success" id="mail-Check-Btn">인증번호 전송</button>
			                     	</div>
                              </div>
                              <div class="certification col-12">
                                    <div class="form-floating theme-form-floating log-in-form">
                                        <input type="text" class="form-control mail-check-input" id="certification" placeholder="certification" >
                                        <label for="certification">본인인증</label>
                                    </div>
                                </div>
                                <span id="mail-check-warn"></span>
                              <div class="col-12">
                                    <div class="form-floating theme-form-floating log-in-form">
                                        <input type="hidden" class="form-control " id="grantNo"  name="grantNo" value="1" >
                                    </div>
                              </div>
                              <div class="col-12">
                                    <div class="form-floating theme-form-floating log-in-form">
                                        <input type="hidden" class="form-control" id="gradeNo" name="gradeNo" value="1">
                                    </div>
                              </div>
                              <div class="col-12">
                                    <a href="${pageContext.request.contextPath}/"><button class="btn btn-animation w-100 justify-content-center" type="button" >취소</button></a>
                              </div>
                              <div class="col-12">
                                    <button class="btn btn-animation w-100 justify-content-center signup" type="submit">회원가입</button>
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
    	$(".certification").css('display', 'none');
    	$(".signup").attr('disabled', true);
        let frm = document.getElementById("frm");

        $(function () {
	     	$("#id").blur(function() {
	     		let signupId = $("#id").val();
	     		let ids = document.querySelectorAll(".member");
	         	let id = /^[a-z]+[a-z0-9]{3,11}$/g;
	          	if(!id.test(frm.id.value)){
	             	frm.outputId.innerHTML = "아이디는 영소문자/숫자 조합으로 4글자 이상 12글자 이하로 입력해주세요";
	             	frm.outputId.style.color = 'red'
	             	$("#id").focus();
	          	} 
	          	else {
	          		for(var i = 0; i < ids.length; i++){
	    	 			if(ids[i].value === signupId) {
	    	 				frm.outputId.innerHTML = "이미 존재하는 아이디입니다";
	    	 				frm.outputId.style.color = 'red'
	    	 				$("#id").focus();
	    	 				return;
	    	 			} else {
	    	 				frm.outputId.style.color = 'black'
	    	 				frm.outputId.innerHTML = "사용 가능한 아이디입니다";
	    	 			}
	    	        }
	         	}
	     	})
        
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
        
	        $("#pwchk").blur(function() {
	             if(pwchk.value !== pw.value){
	                frm.outputPwchk.innerHTML = "비밀번호 확인이 일치하지 않습니다";
	                frm.outputPwchk.style.color = 'red'
	            } else {
	                frm.outputPwchk.innerHTML = "";
	                frm.outputPw.style.color = 'black'
		            frm.outputPw.innerHTML = "사용 가능한 비밀번호 입니다";
	                
	            } 
	        })
        
	        $("#phone").blur(function() {
	        	 let phone = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/; 
	            if(!phone.test(frm.phone.value)){
	                frm.outputPhone.innerHTML = "전화번호를 다시 입력해주세요(010-0000-0000)";
	                frm.outputPhone.style.color = 'red'
	            } else {
	                frm.outputPhone.innerHTML = "";
	            }
	        })
	        $("#email").blur(function() {
	        	let email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	            if(!email.test(frm.email.value)){
	                frm.outputEmail.innerHTML = "올바른 이메일 주소를 입력해주세요";
	                frm.outputEmail.style.color = 'red'
	            } else {
	                frm.outputEmail.innerHTML = "";
	            }
	        })		
        
	          $("#mail-Check-Btn").click(function() {
	 			var email = $("#email").val(); //입력한 메일
	 			var checkInput = $(".mail-check-input"); //인증번호 입력하는 곳
		
	 			$.ajax({
	 				type:"POST",
	 				url: "mailCheck?email=" + email,
	 				success : function(data) {
	 					checkInput.attr("disabled", false);
	 					code = data;
	 					alert("인증번호가 전송되었습니다");
	 				}
	 			})
				
	 			$(".certification").css('display', 'block');
		
	         })
	 		$(".mail-check-input").blur(function() {
	 			var inputCode = $(this).val();
	 			var resultMsg = $("#mail-check-warn");
	 			if(inputCode === code) {
	 				resultMsg.html("인증번호가 일치합니다");
	 				resultMsg.css('color', 'black');
	 				$("#mail-Check-Btn").attr('disabled', true);
	 				$(".signup").attr('disabled', false);
	 				return;
	 			} else {
	 				resultMsg.html("인증번호가 일치하지 않습니다. 다시 확인해주세요");
	 				resultMsg.css('color', 'red');
	 				$(".signup").attr('disabled', true);
	 			}
	 		})
	 		
	 		$(".signup").click(function() {
				alert("회원가입이 완료되었습니다")
			})
  		})
		
    </script>

</body>
</html>