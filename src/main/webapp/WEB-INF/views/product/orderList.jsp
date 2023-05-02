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
                        <h2 class="mb-2">주문내역</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="${pageContext.request.contextPath}/">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active">주문내역</li>
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
										<i class="far fa-smile-wink" style="color: #417505;"></i>${member.name}님의 주문내역
									</h3>
								</div>
								<!-- 시작 -->
								
								<c:forEach items="#{orderList}" var="order" varStatus="i">
									<div class="m-4 orderListDiv col-xxl-10 col-xl-10 col-md-10 col-sm-10 justify-content-center mb-4" style="background-color: white">
										<div class="container">
											<div class="row mt-5 mb-5">
												<div class="address-name col-10 float-start">
													
													<span class="fs-5"><strong><fmt:formatDate value="${order.regDate}" pattern="yyyy'년'MM'월'dd'일' HH'시'mm'분'" />의 주문내역</strong></span>
												</div>
											</div>
										</div>
										<div class="container border border-3 boder-success  rounded-3">
											<br>
											<div class="row">
												<div class="col-3">
													<img src="${pageContext.request.contextPath}/product/thumb/image?codeNo=${order.codeNo}" class="img-fluid blur-up lazyloaded checkout-image mb-3" alt="">
												</div>
												<div class="col-6 my-auto">
													<p class="fs-6">주문 번호 : ${order.payNo}</p> 
													<c:set var="fmtProPrice">
														<fmt:formatNumber value="${order.totalPrice}"
															pattern="#,##0" />
													</c:set>
 													<p class="fs-6">주문 금액 : <span class="text-danger">${fmtProPrice}</span> 원</p> 
 													<c:if test="${order.orderNoCnt ne 1}">
 														<p class="fs-6">상품 외 :<span class="text-danger">${order.orderNoCnt-1}</span> 건</p> 
 													</c:if>
 													<%-- <p>${order[i].proPrice}원</p> --%>
												</div>
												<div class="col-3">
													<%-- <a class="btn-danger btn-sm border border-danger btn remove btnDelete" data-pno="${order.payNo}">내역삭제1</a> --%>
													<a class="btn-danger btn-sm border border-danger btn remove" id="btnDelete" data-pno="${order.payNo}" data-bs-target="#deleteModal" data-bs-toggle="modal">내역삭제</a> 
													<a href="payMentDetails/${order.payNo}" class="btn btn-outline-warning btn-sm border border-warning mt-1">주문상세</a>
													<!-- <a href="#" class="btn btn-success check-input btn-sm border border-success mt-1">리뷰작성</a> -->
													<br>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								<!-- 끝 -->
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
 

  <div class="modal" id="deleteModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">주문내역 삭제</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        주문 내역을 삭제 하시겠습니까?
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" id="btnRemove" data-bs-dismiss="modal">삭제</button>
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">내역으로 돌아가기</button>
      </div>
    </div>
  </div>
</div>

	<!-- log in section end -->
    <jsp:include page="../includes/footer.jsp" />
 
<script>

 	$("#btnDelete").click(function(){
 		alert("버튼");
 		var payNo = $(this).data("pno");
 		var $this= $(this);
 		$('#btnRemove').click(function() {
 			alert("삭제");
 			$.ajax({
 				url : "deleteOrder",
 				method : "POST", 
 				data : {payNo:payNo},
 				success: function(result) {
 					 $this.closest(".orderListDiv").fadeOut("slow", function () {
 					        $this.closest(".orderListDiv").remove();
 					    });
 					console.log("delete!!");

 				}
 			}) 	
 		})
 	})
</script>


</body>
</html>