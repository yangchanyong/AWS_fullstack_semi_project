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
                        <h2 class="mb-2">배송지 수정</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="${pageContext.request.contextPath}/">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active">배송지 목록</li>
                                <li class="breadcrumb-item active">배송지 수정</li>
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
                        <div class="input-box">
                            <form method="post" autocomplete="off" class="row g-4">
                                <div class="mb-3">
				                    <div class="input-group">
				                    	<input type="text" class="form-control" id="addr" placeholder="주소를 입력하세요" value="${address.addr}" name="addr">
				                    	<button class="btn btn-animation" type="button" id="btnAddr">주소 검색</button>
				                    </div>
				                    <input type="text" class="form-control mt-3" id="addrDetail" placeholder="상세주소를 입력하세요" value="${address.addrDetail}" name="addrDetail">
				                    <input type="text" class="form-control mt-3" id="addrName" placeholder="배송지명을 입력하세요" value="${address.addrName}" name="addrName">
				                    <input type="text" class="form-control mt-3" id="recipient" placeholder="수령인을 입력하세요" value="${address.recipient}" name="recipient">
				                    <input type="text" class="form-control mt-3" id="memo" placeholder="메모를 입력하세요" value="${address.memo}" name="memo">
				                    <input type="text" class="form-control mt-3" id="phone" placeholder="전화번호" value="${address.phone}" name="phone" >
			                    </div>
                                <div class="col-12">
                                    <button class="btn btn-animation regist-addr w-100 justify-content-center" type="submit">배송지 수정</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
	<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">주소 검색</h4>
	        <br>
	        <form id="jusoSearchFrm">
	      		<input type="hidden" name="currentPage" value="1"/> 
				<input type="hidden" name="countPerPage" value="10"/>
				<input type="hidden" name="resultType" value="json"/>
				<input type="hidden" name="confmKey" value="devU01TX0FVVEgyMDIzMDQxMDE4MTY0MTExMzY3MzY="/>
				<div class="input-group">
					<input type="text" name="keyword" onclick="checked" value="setDefault" class="form-control w-50"/>
					<button class="btn btn-animation" >검색</button>
				</div>
      		</form>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<div class="result-search card bg">
	      	</div>
	      </div>
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button class="btn btn-animation" type="button" data-bs-dismiss="modal">창닫기</button>
	      </div>
	
	    </div>
	  </div>
	</div>
    
    
    
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
$(function() {
	$("#btnAddr").click(function() {
		$("#myModal").modal("show").find(":text").focus();
		$("#addr").val("");
		$("#addrDetail").prop("readonly", true).val("");
	})
	
	$(".result-search").on("click", "a", function() {
		event.preventDefault();
		let str = $(this).text();
		$("#myModal").modal("hide");
		$("#addr").val(str);
		$("#addrDetail").prop("readonly", false).val("");
		$("#addrName").prop("readonly", false).val("");
		$("#recipient").prop("readonly", false).val("");
		$("#memo").prop("readonly", false).val("");
	})

	$("#jusoSearchFrm").submit(function() {
		let data = $(this).serialize();
		$.post({
			url : "https://business.juso.go.kr/addrlink/addrLinkApiJsonp.do",
			data : data,
			dataType : "jsonp",
			crossDomain : true,
			success : function(data) {
				if(! (data.results.common.totalCount/1)){
					$(".result-search").html("검색 결과가 없습니다");
					return;
				}
				let result = "";
				let arr = data.results.juso
				for(var i in arr){
					result += `
					<div class="card-body border p-3 \${i%2 ? 'bg-light' : ''} ">
						<p class="card-text text-truncate">
							<span class="badge bg-primary d-inline-block me-2" style="width:45px">지번</span> 
							<a href="" class="text-secondary">\${arr[i].jibunAddr}</a>
						</p>
						<p class="card-text text-truncate">
							<span class="badge bg-primary me-2">도로명</span>
							<a href="" class="text-secondary">\${arr[i].roadAddr} </a>
						</p>
	  				</div>
					`;
				}
				$(".result-search").html(result);
			}
		})
		return false;
	})
	
	$(".regist-addr").click(function() {
		alert("수정이 완료되었습니다");
	})
	
})

function ischeck() {
	var setDefault = $('[name="checkbox"]').is(':checked');
	console.log(setDefault);
}

</script>


</body>
</html>