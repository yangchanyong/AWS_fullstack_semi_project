<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../includes/head.jsp" />
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<body>
	<jsp:include page="../includes/header.jsp" />
	<!-- Breadcrumb Section Start -->
	<section class="breadscrumb-section pt-0">
		<div class="container-fluid-lg">
			<div class="row">
				<div class="col-12">
					<div class="breadscrumb-contain">
						<h2>${member.name}님의결제</h2>
						<nav>
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="index.html"> <i
										class="fa-solid fa-house"></i>
								</a></li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout section Start -->
	<section class="checkout-section-2 section-b-space">
		<div class="container-fluid-lg">
			<div class="row g-sm-4 g-3">
				<div class="col-lg-8">
					<div class="left-sidebar-checkout">
						<div class="checkout-detail-box">
							<ul>
								<li>
									<div class="checkout-icon">
										<lord-icon target=".nav-item"
											src="https://cdn.lordicon.com/ggihhudh.json"
											trigger="loop-on-hover"
											colors="primary:#121331,secondary:#646e78,tertiary:#0baf9a"
											class="lord-icon"> </lord-icon>
									</div>
									<div class="checkout-box">
										<div class="checkout-title">
											<h4>배송지</h4>
										</div>
										<c:forEach items="${addrlist}" var="addrlist" varStatus="i">
											<div class="checkout-detail">
												<div class="row g-4">
													<div class="col-xxl-6 col-lg-12 col-md-6">
														<div class="delivery-address-box">
															<div>
																<div class="form-check">
																	<input class="form-check-input address" type="radio" 
																		name="jack" id="flexRadioDefault${i.index}" data-pno="${i.index}">
																		<input type="hidden" class="addrNo" value="${addrlist.addrNo}" data-pno="${i.index}">
																</div>
																<div class="label">
																	<label class="addrName" >${addrlist.addrName}</label>
																</div>
																<label for="flexRadioDefault${i.index}">
																<ul class="delivery-address-detail">
																	<li>
																		<h4 class="fw-500 addrRecipient" data-pno="${i.index}" >${addrlist.recipient}</h4>
																	</li>

																	<li>
																		<p class="text-content">
																			<span class="text-title">주소 : </span><span class="addr" data-pno="${i.index}">${addrlist.addr}</span></p>
																	</li>

																	<li>
																		<h6 class="text-content">
																			<span class="text-title">상세 주소 :</span><span class="addrDetail" data-pno="${i.index}">${addrlist.addrDetail}</span></h6>
																	</li>

																	<li>
																		<h6 class="text-content mb-0">
																			<span class="text-title">연락처 :</span><span class="addrPhone" data-pno="${i.index}">${member.phone}</span></h6>
																	</li>
																</ul>
																</label>
															</div>
														</div>
													</div>
										</c:forEach>
										<!--   <div class="col-xxl-6 col-lg-12 col-md-6">
                                                    <div class="delivery-address-box">
                                                        <div>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio" name="jack"
                                                                    id="flexRadioDefault2" checked="checked">
                                                            </div>

                                                            <div class="label">
                                                                <label>Office</label>
                                                            </div>

                                                            <ul class="delivery-address-detail">
                                                                <li>
                                                                    <h4 class="fw-500">Jack Jennas</h4>
                                                                </li>

                                                                <li>
                                                                    <p class="text-content"><span
                                                                            class="text-title">Address
                                                                            :</span>Nakhimovskiy R-N / Lastovaya Ul.,
                                                                        bld. 5/A, appt. 12
                                                                    </p>
                                                                </li>

                                                                <li>
                                                                    <h6 class="text-content"><span
                                                                            class="text-title">Pin Code :</span>
                                                                        +380</h6>
                                                                </li>

                                                                <li>
                                                                    <h6 class="text-content mb-0"><span
                                                                            class="text-title">Phone
                                                                            :</span> + 380 (0564) 53 - 29 - 68</h6>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div> -->
									</div>
						</div>
					</div>
					</li>

					<li>
						<div class="checkout-icon">
							<lord-icon target=".nav-item"
								src="https://cdn.lordicon.com/qmcsqnle.json"
								trigger="loop-on-hover"
								colors="primary:#0baf9a,secondary:#0baf9a" class="lord-icon">
							</lord-icon>
						</div>
						<div class="checkout-box">
							<div class="checkout-title">
								<h4>결제 방법</h4>
							</div>

							<div class="checkout-detail">
								<div class="accordion accordion-flush custom-accordion"
									id="accordionFlushExample">
									
									<div class="accordion-item">
										<div class="accordion-header" id="flush-headingOne">
											<div class="accordion-button collapsed"
												data-bs-toggle="collapse"
												data-bs-target="#flush-collapseOne">
												<div class="custom-form-check form-check mb-0">
													<label class="form-check-label" for="credit"><input
														class="form-check-input mt-0 payType" type="radio"
														name="flexRadioDefault" id="credit" data-pt="card" >신용카드 결제</label>
												</div>
											</div>
										</div>
										
									</div>

									
									
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="checkout-icon">
							<lord-icon target=".nav-item"
								src="https://cdn.lordicon.com/qmcsqnle.json"
								trigger="loop-on-hover"
								colors="primary:#0baf9a,secondary:#0baf9a" class="lord-icon">
							</lord-icon>
						</div>
						<div class="checkout-box">
							<div class="checkout-title">
								<h4>할인 쿠폰 </h4>
							</div>
							
							<c:forEach items="${coupon}" var="coupon" varStatus="i" >
							<c:choose >
							<c:when test="${coupon.couCnt ne 0}">
								<div class="checkout-detail">
									<div class="accordion accordion-flush custom-accordion"
										id="accordionFlushExample">
										
										<div class="accordion-item">
											<div class="accordion-header" id="flush-headingOne">
												<div class="accordion-button collapsed"
													data-bs-toggle="collapse"
													data-bs-target="#flush-collapseOne">
													<div class="custom-form-check form-check mb-0">
														<label class="form-check-label" for="coupon" style="width:700px"><input
															class="form-check-input mt-0" type="checkbox" name="coupon"
															id="couponCheck" data-pt="coupon" data-cno="${i.index}">${coupon.couName} 쿠폰
															<span class="ms-5 text-danger">-</span><span class="couponPrice text-danger" data-cno="${i.index }">${coupon.couPrice}</span></label>
														
														<span class="fs-7">남은 쿠폰 갯수 </span>
														<span class="couponCnt"> ${coupon.couCnt}</span>
													</div>
													<div>
															
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
							</c:when>
							
							<c:otherwise>
									<div class="checkout-detail">
										<div class="accordion accordion-flush custom-accordion"
											id="accordionFlushExample">

											<div class="accordion-item">
												<div class="accordion-header" id="flush-headingOne">
													<div class="accordion-button collapsed"
														data-bs-toggle="collapse"
														data-bs-target="#flush-collapseOne">
														<div class="custom-form-check form-check mb-0">
															<label class="form-check-label" for="coupon"><!-- <input
																class="form-check-input mt-0" type="radio" name="coupon"
																id="coupon" data-pt="coupon"> -->사용가능한 쿠폰이 없습니다.</label>
														</div>
													</div>
												</div>
											</div>
										</div>

									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						</div>
					</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="col-lg-4">
			<div class="right-side-summery-box">
				<div class="summery-box-2">
					<div class="summery-header">
						<h3>주문 내역</h3>
					</div>
						<input type="hidden" class="proCount" value="${fn:length(prolist) }">
						<c:forEach items="${prolist}" var="prolist" varStatus="i">
						<input type="hidden" name="codeNo" id="codeNo" value="${prolist.codeNo }" class="proCodeNo">
						<ul class="summery-contain nav">
								<li class="col-1"><img
									src="${pageContext.request.contextPath}/product/payMent/thumb/image?codeNo=${prolist.codeNo}"
									class="img-fluid blur-up lazyloaded checkout-image" alt="">
								</li>
								<li class="col-9">
									<%--  --%>
									<h4 class="proName" data-pno="${i.index}" >${prolist.proName}</h4>
									<span> x </span><span class="proCartCnt" data-pno="${i.index}"> ${prolist.cartCnt} </span>
								</li>
								<c:set var="fmtProductPrice">
									<fmt:formatNumber value="${prolist.salePrice}"
										pattern="#,##0" />
								</c:set>
								<li class="col-2">
									<h4 class="productPrice" data-pno="${i.index}">
										<c:out value="${fmtProductPrice}" />
									</h4>
									<h4>원</h4>
								</li>
						</ul>
						</c:forEach>

					<ul class="summery-total">
						<li>
							<h4 class="col-6">상품 총 금액</h4>
							<h4 class="allPrice col-6 text-end"></h4><h4> 원</h4>
						</li>
						<c:forEach items="${coupon}" var="coupon" varStatus="i">
							<li>
								<h4 class="col-6">할인 쿠폰</h4>
								<input type="hidden" class="coumemberNo" value="${coupon.coumemberNo}" data-cno="${i.index }">
								<h4 class="disPrice col-6 text-end" data-couNo="${coupon.coumemberNo}">0</h4><h4> 원</h4>
							</li>
						</c:forEach>
						<li class="list-total mt-5 mb-0">
							<h4 class="col-6">총 합계</h4>
							<h4 class="totalPrice col-6"></h4><h4> 원</h4>
						</li>
					</ul>
				</div>
				<button	class="btn theme-bg-color text-white btn-md w-100 mt-4 fw-bold payMent" >결제 하기</button>
			</div>
		</div>
	</section>


	<div class="modal" id="addrmodal" role="dialog"
		aria-labelledby="ModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 850px;">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">배송지 선택</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-4"
						data-widget-editbutton="false" data-widget-colorbutton="false"
						data-widget-deletebutton="false" data-widget-togglebutton="false">
						<div role="content">
							<div class="widget-body fs-4 text-center">배송지를 선택해주세요.</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary btnCloseAddr">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
		<div class="modal" id="paymodal" role="dialog"
		aria-labelledby="ModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 850px;">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">결제</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-4"
						data-widget-editbutton="false" data-widget-colorbutton="false"
						data-widget-deletebutton="false" data-widget-togglebutton="false">
						<div role="content">
							<div class="widget-body fs-4 text-center">결제방식을 선택해주세요.</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary btnClosePay">닫기</button>
				</div>
			</div>
		</div>
	</div>


	<form method="post" action="${pageContext.request.contextPath}/product/payList">
	</form>
	<!-- Checkout section End -->
	<jsp:include page="../includes/footer.jsp" />
	<script>
		$(function() {
	
			let procode = $("#codeNo").val();
			let cnt = "${cnt}"
			let obj = {codeNo:procode, cnt:cnt};
			$.ajax({
					url : "payMent/thumb/image",
					method : "get",
					data : obj,
					contentType : false
			})
	
		/* var proCnt = $(this).data("cno");
		var proPrice = $(this).data("cno"); */
		var price = document.querySelectorAll(".productPrice");
		var proCnt = document.querySelectorAll(".proCartCnt");
		
		console.log(price);
		console.log(proCnt);
		var totalPrice =0;
		for (let i = 0; i < price.length; i++) {
			totalPrice += parseInt(price[i].textContent.replace(/,/g, '')) ;
		}
		console.log(totalPrice);
		$(".allPrice").text(totalPrice.toLocaleString());
		$(".totalPrice").text(totalPrice.toLocaleString());//할인 쿠폰에 대한 할인 정보 수정 해야됨
		let payType = null;
		let addrNo = null;
		let coumemberNo = 0;
		$(".address").click(function(){
			var i = $(this).data("pno");
			addrName = $('.addrName[data-pno="' + i + '"]').text();
			addrNo = $('.addrNo[data-pno="' + i + '"]').val();
			addr = $('.addr[data-pno="' + i + '"]').text(); 
			addrRecipient = $('.addrRecipient[data-pno="' + i + '"]').text();
			addrDetail = $('.addrDetail[data-pno="' + i + '"]').text();
			addrPhone = $('.addrPhone[data-pno="' + i + '"]').text();
		})
		
		$(".payMent").click(function(){
			var cartCnt = $(".proCartCnt").text();
			var procode =$(".proCodeNo").val();
			if(addrNo==null){
				$("#addrmodal").modal("show");
				return ;
			}
			var cartBuy = "${prolist[0].cartBuy}";
			if(payType=="card"){
			
			var proCount = $(".proCount").val();
			if(proCount==1){
				var proName = $('.proName[data-pno="' + 0 + '"]').text();
			}else{
				var proName = $('.proName[data-pno="' + 0 + '"]').text() + "외 " + (proCount-1) +"건";
			}
			
			console.log(proName);
			console.log(proCount);
			IMP.init('아임포트 인증키 입력');
			IMP.request_pay({
				//'danal_tpay'
			    pg : 'danal_tpay',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : proName , 
			    amount : 100, 
			    buyer_email : "${member.email}", 
			    buyer_name : "${member.name}", 
			    buyer_tel : "${member.phone}" 
			}, function(rsp) {
				console.log(rsp);
			    if ( rsp.success ) {
			    	
			    	var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        var payCode = rsp.apply_num;
			        $.ajax({
						method: "POST",
						url : "${pageContext.request.contextPath}/product/payMent/paymentSuccess",
						data : { 
							payCode : payCode,
							addrNo : addrNo,
							cartBuy : cartBuy,
							coumemberNo : coumemberNo,
							procode : procode,
							proCnt:cartCnt,
							pay_method : rsp.pay_method,
							card_name : rsp.card_name,
							card_number : rsp.card_number,
							installment : rsp.card_quota
						},
						success : function(result){
							window.location.href="${pageContext.request.contextPath}/product/payMentDetails/"+result; 
						}						
			        })
			    } else {
			    	 var msg = '결제에 실패하였습니다.';
			         msg += '에러내용 : ' + rsp.error_msg;
			    }
			});
			}else if(payType=="bank"){
				var payCode = 4;
				console.log("주소넘버"+addrNo);
				$.ajax({
					method: "POST",
					url : "paymentSuccess",
					data : { 
						
						payCode : payCode,
						addrNo : addrNo
					},
					success : function(result){
						console.log("성공");
						/* window.location.href="${pageContext.request.contextPath}/product/payMentDetails"; */
					}						
		        })
				console.log("가상계좌");
			}else{
				$("#paymodal").modal("show");
			}
			
			
		})
		
		$(".btnCloseAddr").click(function() {
			$("#addrmodal").modal("hide");
		})
		$(".btnClosePay").click(function() {
			$("#paymodal").modal("hide");
		})
		
		 $(".payType").click(function (){
			payType=$(this).data("pt");
		}) 
		
		$("#couponCheck").click(function (){
			var i = $(this).data("cno");
			var price = $('.couponPrice[data-cno="' + i + '"]').text();
			var ch = $('#couponCheck');
			var tp = $(".totalPrice").text();
			if($('#couponCheck').prop('checked')){
				$(".totalPrice").text((totalPrice-price).toLocaleString());
				$(".disPrice").text(parseInt(price).toLocaleString());
				coumemberNo = $(".coumemberNo").val();
				console.log("쿠폰넘버" + coumemberNo);
			}else{
				coumemberNo=0;
				$(".totalPrice").text((totalPrice-0).toLocaleString());
				$(".disPrice").text(0);
			}
		})
})
		
		
	</script>
</body>
</html>