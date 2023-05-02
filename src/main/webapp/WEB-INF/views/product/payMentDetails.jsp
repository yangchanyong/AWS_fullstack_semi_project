<%@page import="com.chanyongyang.domain.ReviewVO"%>
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
						<h2>[주문번호 ${paylist.payNo} ]가 주문이 완료되었습니다.</h2>
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
									
									<c:forEach items="${orderlist}" var="orderlist" varStatus="i">
										
										<input type="hidden" name="codeNo" id="codeNo" value="${orderlist.codeNo }" data-write="${i.index}">
								<div class="mb-3">
									<div class="row ">
										<div class="col-2">
											<img
												src="${pageContext.request.contextPath}/product/thumb/image?codeNo=${orderlist.codeNo}"
												class="img-fluid blur-up lazyloaded checkout-image" alt="">
										</div>
										<div class="col-6 m-auto fs-6">
											<a href="${pageContext.request.contextPath}/product/${orderlist.codeNo}" class="text-muted">
												<span class="proName " data-pno="${i.index}">${orderlist.proName}</span>
											</a>
											<span class=""> x </span><span class="proCartCnt"
												data-pno="${i.index}"> ${orderlist.cartCnt} </span>
										</div>
										<div class="col-3 my-auto mr-0 text-end pb-4">
											<c:set var="fmtProductPrice">
												<fmt:formatNumber value="${orderlist.totalPrice}"
													pattern="#,##0" />
											</c:set>
											<span class="productPrice fs-5 pe-2 pb-1" data-pno="${i.index}">
												<c:out value="${fmtProductPrice}" />
											</span>
											<span>원</span>
												<div class="mt-2">
												<c:if test="${exist.codeNo eq orderlist.codeNo}">
													<div>리뷰를 작성하였습니다</div>
												</c:if>
												<c:if test="${non.codeNo eq orderlist.codeNo}">
													<span><a href="${pageContext.request.contextPath}/member/review?payNo=${paylist.payNo}&codeNo=${orderlist.codeNo}" class="btn btn-primary review-write  mt-2 float-end" >리뷰 작성</a></span>
												</c:if>
												<c:forEach items="${existReviewList }" var="review">
													<c:if test="${review.codeNo eq orderlist.codeNo}">
														<div>리뷰를 작성하였습니다</div>
													</c:if>
												</c:forEach>
												<c:forEach items="${nonReviewList}" var="review">
													<c:if test="${review.codeNo eq orderlist.codeNo}">
														<span><a href="${pageContext.request.contextPath}/member/review?payNo=${paylist.payNo}&codeNo=${orderlist.codeNo}" class="btn btn-primary review-write  mt-2 float-end" >리뷰 작성</a></span>
													</c:if>
												</c:forEach>
												</div>
										</div>
									</div>
								</div>
						</c:forEach>
									<div class="checkout-box">
										<div class="checkout-title">
											<h4>배송지 정보</h4>
										</div>
											<div class="checkout-detail">
												<div class="row g-4">
													<div class="col-xxl-12 col-lg-12 col-md-6">
														<div class="delivery-address-box">
															<div>
																<div class="label">
																	<label data-pno="" class="addrName">${addr.addrName}</label>
																</div>
																<ul class="delivery-address-detail">
																	<li>
																		<h4 class="fw-500 addrRecipient" data-pno="">수령인 : <span>${addr.recipient}</span> </h4>
																	</li>

																	<li>
																		<p class="text-content">
																			<span class="text-title">주소 : </span><span class="addr" data-pno="">${addr.addr}</span></p>
																	</li>

																	<li>
																		<h6 class="text-content">
																			<span class="text-title">상세 주소 :</span><span class="addrDetail" data-pno="">${addr.addrDetail}</span></h6>
																	</li>

																	<li>
																		<h6 class="text-content mb-0">
																			<span class="text-title">연락처 :</span><span class="addrPhone" data-pno="">${addr.phone}</span></h6>
																	</li>
																	<li>
																		<h6 class="text-content mb-0">
																			<span class="text-title">배송요청사항 :</span><span class="addrPhone" data-pno="">${addr.memo}</span></h6>
																	</li>
																</ul>
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
								<h4>결제 정보</h4>
							</div>
										<div class="checkout-detail">
											<div class="row g-4">
												<div class="col-xxl-12 col-lg-12 col-md-6">
													<div class="delivery-address-box">
														<div>
															<ul class="delivery-address-detail">
																<li>
																	<h4 class="fw-500 addrRecipient" data-pno="">
																		결제수단
																		<span></span>
																	</h4>
																</li>
																<li>
																	<p class="text-content">
																		<span class="addr" data-pno="">${paylist.cardCompany}</span>
																	</p>
																</li>

																<li>
																	<p class="text-content">
																		<span class="addr" data-pno="">${paylist.cardNumber}</span>
																	</p>
																</li>
																<li>
																	<p class="text-content">
																	<c:if test="${paylist.installment eq '0'}">
																		<span class="addr" data-pno="">일시불</span>
																	</c:if>
																	<c:if test="${paylist.installment ne '0'}">
																		<span class="addr" data-pno="">${paylist.installment}</span><span>개월</span>
																	</c:if>
																	</p>
																</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>

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
						<c:forEach items="${orderlist}" var="orderlist" varStatus="i">
						<div class="contain nav mb-3">
									<div class="row ">
										<div class="col-2">
											<img
												src="${pageContext.request.contextPath}/product/thumb/image?codeNo=${orderlist.codeNo}"
												class="img-fluid blur-up lazyloaded checkout-image" alt="">
										</div>
										<div class="col-6 m-auto fs-6">
											<span class="proName " data-pno="${i.index}">${orderlist.proName}</span>
											<span class=""> x </span><span class="proCartCnt"
												data-pno="${i.index}"> ${orderlist.cartCnt} </span>
										</div>
										<div class="col-3 my-auto mr-0 text-end">
											<c:set var="fmtProductPrice">
												<fmt:formatNumber value="${orderlist.proPrice}"
													pattern="#,##0" />
											</c:set>
											<span class="productPrice fs-5" data-pno="${i.index}">
												<c:out value="${fmtProductPrice}" />
											</span>
											<span>원</span>
										</div>
									</div>
								</div>
						</c:forEach>

					<ul class="summery-total">
						<li>
							<h4 class="subPrice col-6">상품 총 금액</h4>
							<c:set var="fmtTotalPrice">
								<fmt:formatNumber value="${orderlist[0].totalPrice}"	pattern="#,##0" />
							</c:set>
							<h4 class="allPrice col-6"><c:out value="${fmtTotalPrice}" /></h4><h4> 원</h4>
						</li>
						<li>
							<h4 class="col-6">할인 쿠폰</h4>
							<span>-</span><h4 class="disPrice col-6">0</h4><h4> 원</h4>
						</li>

						<li class="list-total mt-5 mb-0 fs-6"> 
							<h4 class="col-6">총 합계</h4>
							<h4 class="totalPrice col-6">${fmtTotalPrice}</h4><h4> 원</h4>
						</li>
					</ul>
				</div>
				<a href="${pageContext.request.contextPath}/"><button	class="btn theme-bg-color text-white btn-md w-100 mt-4 fw-bold payMent" >홈으로</button></a>
			</div>
		</div>
	</section>
	<!-- Checkout section End -->
	<jsp:include page="../includes/footer.jsp" />
	<script>
		$(function() {
			let codeNo = $("#codeNo").val();
			
			let obj = {codeNo:codeNo};
			
			$.ajax({
					url : "${pageContext.request.contextPath}/product/description/image",
					method : "get",
					data : obj,
					contentType : false,
			})
			$.ajax({
					url : "${pageContext.request.contextPath}/product/represent/image",
					method : "get",
					data : obj,
					contentType : false,
			})
			$.ajax({
					url : "${pageContext.request.contextPath}/product/payMent/thumb/image",
					method : "get",
					data : obj,
					contentType : false,
			})
			var subPrice = "${orderlist[0].totalPrice}";
			var disPrice = "${coupon}";
			if(disPrice){
				$(".disPrice").text(parseInt(disPrice).toLocaleString());
			}else{
				$(".disPrice").text(0);
			}
			$(".totalPrice").text((parseInt(subPrice-disPrice)).toLocaleString());
			
			
		})
		
	</script>
</body>
</html>