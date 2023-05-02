<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<jsp:include page="../includes/head.jsp" />

<body>
<jsp:include page="../includes/header.jsp" />


    <!-- Breadcrumb Section Start -->
    <section class="breadscrumb-section pt-0">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="breadscrumb-contain">
                        <h2>장바구니</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="${pageContext.request.contextPath}">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">장바구니</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- Cart Section Start -->



	<section class="cart-section section-b-space">
		<div class="container-fluid-lg ">
		<div class="row">
			<div class="row col-12">
				<div class="col-7">
					<c:forEach items="${list}" var="list" varStatus="i">
						<div class="col-12 product-box-contain">
							<div class="card mb-3">
								<div class="row g-0">
									<div class="col-md-4">
										<a
											href="${pageContext.request.contextPath}/product/${list.codeNo}">
											<img
											src="${pageContext.request.contextPath}/product/cart/thumb/image?codeNo=${list.codeNo}"
											class="img-fluid" alt="">
										</a>
									</div>
									<div class="col-md-8">
										<div class="card-body">
										
										<div class="float-start">
											<h5 class="card-title">
												<a href="${pageContext.request.contextPath}/product/${list.codeNo}" class="text-decoration-none fs-4">${list.proName}</a>
											</h5>
											<p class="card-text mb-3 fs-5">
												<strong>상품가격:</strong>
												<c:set var="fmtSalePrice">
													<fmt:formatNumber value="${list.proSalePrice}"
														pattern="#,##0" />
												</c:set>
												<span data-cno="${i.index}"  class="salePrice"> <c:out
														value="${fmtSalePrice}" />
												</span> 원
											</p>
											
											<p class="card-text mb-0 fs-5">
												<strong>가격:</strong>
												<c:set var="fmtPrice">
													<fmt:formatNumber value="${list.salePrice}" pattern="#,##0" />
												</c:set>
												<span data-cno="${i.index}"  class="totalPrice"> <c:out value="${fmtPrice}" />
												</span> 원
											</p>
											</div>
											<div>
												<button class=" float-end mb-5 btn btn-outline-danger remove close_button mt-2" data-cno="${i.index}" data-no="${list.codeNo}"> <i class="fas fa-minus-circle"></i> </button>
											</div>
											<div class="input-group my-3">
												<button type="button"
													class="btn btn-outline-secondary qty-left-minus btnCnt"
													data-type="minus" data-field="" data-no="${list.codeNo}"
													data-cno="${i.index}">
													<i class="fa fa-minus" aria-hidden="true"></i>
												</button>	
												<input class="form-control input-number qty-input fs-6 text-center w-10"
													type="number" min="4" name="cartCnt" value="${list.cartCnt}"
													data-cno="${i.index}" data-no="${list.codeNo}" readonly>
												<button type="button"
													class="btn btn-outline-secondary qty-right-plus btnCnt"
													data-type="plus" data-field="" data-no="${list.codeNo}"
													data-cno="${i.index}">
													<i class="fa fa-plus" aria-hidden="true"></i>
												</button>
												<input type="hidden" value="${list.proCnt}" class="proCnt" data-proCnt="${list.proCnt}" data-cno="${i.index}"> 
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
				
					<div class="col-5">
						<div class="summery-box p-sticky">
							<div class="summery-header">
								<h3>총 합계</h3>
							</div>

							<div class="summery-contain">

								<ul>
									<li class="d-flex justify-content-between align-items-center">
										<h4 class="m-0">상품 총 금액</h4>
										<h4 class="allPrice m-0"></h4> <span> 원</span>
									</li>

									<li class="d-flex justify-content-between align-items-center">
										<h4 class="m-0">할인</h4>
										<h4 class="discount m-0"></h4> <span> 원</span>
									</li>


								</ul>
							</div>

							<ul class="summery-total">
								<li class="list-total border-top-0">
									<h4>총 합계</h4>
									<h4 class="price theme-color disTotal">0</h4>
									<h4>원</h4>
								</li>
							</ul>

							<div class="button-group cart-button">
								<ul>
									<li>
										<button class="btn btn-animation proceed-btn fw-bold payBtn">결제하기</button>
									</li>

									<li>
										<button onclick="location.href = 'newProduct';" class="btn btn-light shopping-button text-dark">
											<i class="fa-solid fa-arrow-left-long"></i>상품 더 보러가기
										</button>
									</li>
								</ul>
							</div>
						</div>
					</div>
			</div>
		</div>
		</div>
	</section>
		<!-- 장바구니 목록 끝 -->
<div class="modal" id="modal"  role="dialog" aria-labelledby="ModalLabel" aria-hidden="true" >
	<div class="modal-dialog" style="width:850px;">
		<div class="modal-content" >
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">배송지</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-4" data-widget-editbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false" data-widget-togglebutton="false">
					<div role="content">
						<div class="widget-body fs-4 text-center">		
							현재 배송지가 없습니다.<Br> 배송지를 추가해주세요
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger btnAddr" id="btn_save">배송지 추가</button>
				<button type="button" class="btn btn-primary btnClose" >닫기</button>
			</div>
		</div>
	</div>
</div>

<div class="modal" id="promodal"  role="dialog" aria-labelledby="ModalLabel" aria-hidden="true" >
	<div class="modal-dialog" style="width:850px;">
		<div class="modal-content" >
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">상품</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-4" data-widget-editbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false" data-widget-togglebutton="false">
					<div role="content">
						<div class="widget-body fs-4 text-center">		
							상품이 없습니다<Br> 상품을 추가해주세요
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger btnPro" id="btn_save">상품추가</button>
				<button type="button" class="btn btn-primary btnClosePro" >닫기</button>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../includes/footer.jsp" />
</body>
<script>
	let procode = $("#codeNo").val();
	let cnt = "${cnt}"
	let obj = {
		codeNo : procode,
		cnt : cnt
	};
	// productController에 별도의 ajax 메서드를 생성해야한다.
	$.ajax({
		url : "cart/thumb/image",
		method : "get",
		data : obj,
		contentType : false
	})
	$(function() {
		let addr = "${addr}";
		let pro = "${list}";
		
		if (addr.length==2) {
			$("#modal").modal("show");
		}
		else if(pro.length==2){
			$("#promodal").modal("show");
		}
		
		var price = document.querySelectorAll(".totalPrice");
		console.log("price"+price);
		var totalPrice = 0;
		for (var i = 0; i < price.length; i++) {
			totalPrice += parseInt(price[i].textContent.replace(/,/g, ''));
			console.log("price1"+totalPrice);
		}

		$('.totalPrice').text().toLocaleString();

		$(".allPrice").text(totalPrice.toLocaleString());
		var dis = $(".discount").text()
		$(".disTotal").text((totalPrice - dis).toLocaleString());


		$(".qty-left-minus").click(
				function() {
					var codeNo = $(this).data("no");
					var i = $(this).data("cno");
					var cnt = $('.input-number[data-cno="' + i + '"]').val();
					var price = $('.salePrice[data-cno="' + i + '"]').text().replace(/,/g, '');
										
					console.log("cnt:::" + cnt)
					console.log("price:::" + price)
					$('.totalPrice[data-cno="' + i + '"]').text(
							(price * cnt).toLocaleString());
				})

		$(".qty-right-plus").click(function() {
					var codeNo = $(this).data("no");
					var i = $(this).data("cno");
					var cnt = parseInt($('.input-number[data-cno="' + i + '"]').val());
					/* var price = $('.salePrice[data-cno="'+ i +'"]').val();  */
					var price = parseInt($('.salePrice[data-cno="' + i + '"]').text()
							.replace(/,/g, ''));
					var proCnt =$('.proCnt[data-cno="'+ i+'"]').val();
					if (cnt> proCnt) {
						$('.input-number[data-cno="' + i + '"]').val(proCnt);
     				}
					
					$('.totalPrice[data-cno="' + i + '"]').text(
							(price * cnt).toLocaleString());
		})
				

		$(".remove").click(function() {
			var i = $(this).data("cno");
			var codeNo = $(this).data("no");
			console.log("i" + i);
			console.log("codeNo" + codeNo);
			$.ajax({
				url : "deleteProduct",
				method : "POST",
				data : {
					codeNo : codeNo
				},
				success : function(result) {
					console.log("delete!!");
					setTimeout(function() {
					var price = document.querySelectorAll(".totalPrice");
					var totalPrice = 0;
					for (var i = 0; i < price.length; i++) {
						totalPrice += parseInt(price[i].textContent.replace(/,/g, ''));
						console.log("price2 :: "+totalPrice);
					}
					$('.totalPrice').text().toLocaleString();
					$(".allPrice").text(totalPrice.toLocaleString());
					var dis = $(".discount").text()
					$(".disTotal").text((totalPrice - dis).toLocaleString());
					},1000);
				}
			})
			
		})
		$(".btnCnt").click(function() {
			var codeNo = $(this).data("no");
			var i = $(this).data("cno");
			var cartCnt = $('.qty-input[data-cno="' + i + '"]').val();
			
			console.log(codeNo);
			console.log(cartCnt);
			$.ajax({
				url : "updateProduct",
				method : "POST",
				data : {
					codeNo : codeNo,
					cartCnt : cartCnt,
				},
				success : function(result) {
					console.log("update!!");
				}
			})
			var totalPrice = 0;
			var price = document.querySelectorAll(".totalPrice");
			console.log(price);
			var totalPrice = 0;
			for (let i = 0; i < price.length; i++) {
				totalPrice += parseInt(price[i].textContent.replace(/,/g, ''));
			}

			console.log(totalPrice);
			$(".allPrice").text(totalPrice.toLocaleString());
			var dis = $(".discount").text()
			$(".disTotal").text((totalPrice - dis).toLocaleString());
		})
		
		$(".addrBtn").click(function() {
			var productList = "${prolist}";
			if (addr.length==2){
				widnow.location.href = "/address/list";
			}else if(productLis.length==2){
				widnow.location.href = "/payMent"
			}
		})
		$(".btnClose").click(function() {
			$("#modal").modal("hide");
		})
		$(".btnClosePro").click(function() {
			$("#promodal").modal("hide");
		})
		$("#btn_save").click(function() {
			$("#modal").modal("hide");
			window.location.replace("${pageContext.request.contextPath}/address/list");
		})
		$(".btnPro").click(function() {
			$("#promodal").modal("hide");
			window.location.replace("${pageContext.request.contextPath}/product/newProduct");
		})
		$(".payBtn").click(function(){
			if (addr.length==2) {
				$("#modal").modal("show");
			}
			else if(pro.length==2){
				$("#promodal").modal("show");
			}else{
				window.location.href="${pageContext.request.contextPath}/product/payMent";
			}
		})
	})
</script>
</html>