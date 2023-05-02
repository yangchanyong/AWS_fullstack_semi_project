<%@page import="com.chanyongyang.domain.OrderVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="ko">

<jsp:include page="../includes/head.jsp"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor5/37.0.1/ckeditor.min.js" integrity="sha512-u1sLXXwUefvooLCurgZpkZnSlf4Q3DJ4hIzrpB4mXFdbKsGbcekHI1x2G+ZDSVPj1r2wGnW+takK8AcAVDlqfQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor5/37.0.1/translations/ko.min.js" integrity="sha512-8ehZsiu6bs7v3zC9sqMUdj5E5zeyqDhWfI/vz+WePbKQ8gwBZe7bwBTJSwh61THz8it6ByZRLcDiSjHcOOvw7A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
/* The Modal (background) */
#myModal {
	display: none; /* Hidden by default */
	position: absolute; /* Stay in place */
	z-index: 10; /* Sit on top */
	padding-top: 200px; /* Location of the box */
	left: -30px;
	top: 160px;
	width: 50%; /* Full width */3
	height: 50%; /* Full height */
	text-align: center;
	overflow: inherit; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	/*   border: 1px solid #888; */
	border: 1px solid blue;
	width: 80%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	font-size: 18px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.triangle {
	width: 0px;
	height: 0px;
	margin-left: 100px;
	border: 1px solid;
	border-width: 0 25px 25px 1px;
	border-color: transparent transparent blue transparent;
	transform: rotate(0deg);
}

.ck-editor__editable[role="textbox"] {
	min-height: 400px;
}
</style>
<body>
	

	<jsp:include page="../includes/header.jsp"></jsp:include>

	<!-- mobile fix menu start -->
	<div class="mobile-menu d-md-none d-block mobile-cart">
		<ul>
			<li class="active"><a href="index.html"> <i
					class="iconly-Home icli"></i> <span>Home</span>
			</a></li>

			<li class="mobile-category"><a href=""> <i
					class="iconly-Category icli js-link"></i> <span>Category</span>
			</a></li>

			<li><a href="search.html" class="search-box"> <i
					class="iconly-Search icli"></i> <span>Search</span>
			</a></li>

			<li><a href="wishlist.html" class="notifi-wishlist"> <i
					class="iconly-Heart icli"></i> <span>My Wish</span>
			</a></li>

			<li><a href="cart.html"> <i
					class="iconly-Bag-2 icli fly-cate"></i> <span>Cart</span>
			</a></li>
		</ul>
	</div>
	<!-- mobile fix menu end -->

	<!-- Breadcrumb Section Start -->
	<section class="breadscrumb-section pt-0">
		<div class="container-fluid-lg">
			<div class="row">
				<div class="col-12">
					<div class="breadscrumb-contain">
						<h2>${product.proName }</h2>
						<nav>
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="index.html"> <i
										class="fa-solid fa-house"></i>
								</a></li>

								<li class="breadcrumb-item active">${product.proName }</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Left Sidebar Start -->
	<section class="product-section">
		<div class="container-fluid-lg">
			<div class="row">
				<div class="col-xxl-9 col-xl-8 col-lg-7  mx-auto wow fadeInUp">
					<div class="row g-4">
						<div class="col-xl-6 wow fadeInUp float-left">
							<div class="product-box">
								<div class="row g-2 ">
									<div class="col-xxl-10 col-lg-12 col-md-10">
										<div class="product-main-2 no-arrow">
											<div>
												<div class="slider-image">
													<img src="represent/image?codeNo=${product.codeNo}"
														id="img-1"
														data-zoom-image="represent/image?codeNo=${product.codeNo}"
														class="img-fluid image_zoom_cls-0 blur-up lazyload" alt="">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xxl-2 col-lg-12 col-md-2 float-start">
									<div class="row d-inline-flex">
										<div>
											<div class="sidebar-image">
												<img src="thumb/image?codeNo=${product.codeNo}"
													class="img-fluid blur-up lazyload" alt="">

											</div>
										</div>

									</div>
								</div>
							</div>
						</div>

						<div class="col-xl-6 wow fadeInUp" data-wow-delay="0.1s">
							<div class="right-box-contain">
								<div>
									<span>
										<h2 class="name pt-2">${product.proName }</h2>
									</span> <a href="#" class="px-2"> <span class="review">[리뷰
											고객수] ${reviewCnt} 개의 리뷰</span></a>
									</span>
								</div>
								<div class="price-rating float-start">
									<span class="mx-1"><h3 class="theme-color price"></h3></span><span
										class="text-content">남은 재고 수[${product.proCnt }]</span>
								</div>

								<div class="pickup-box">


									<div class="product-info">
										<ul
											class="product-info-list product-info-list-2 list-unstyled">
											<li>원산지 : ${product.proCountry }</li>
											<li>제조사 : ${product.proManf }</li>
											<li>유통기한 : ${product.proExp }</li>
										</ul>
									</div>
								</div>
								<div class="col-sm-7 col-xl-7 clearfix">
									<div class="note-box px-2">
										<h3>수량</h3>
										<div class="cart_qty qty-box product-qty ms-2">
											<div class="input-group px=3">
<input type="hidden" value="${product.proCnt}" class="proCnt">
												<button type="button" class="qty-left-minus q-btn"
													data-type="minus" data-field="">
													<i class="fa fa-minus" aria-hidden="true"></i>
												</button>
												<input class="form-control input-number qty-input"
													type="text" name="cartCnt" value="1" id="cartCnt" readonly>
												<button type="button" class="qty-right-plus q-btn"
													data-type="plus" data-field="" >
													<i class="fa fa-plus" aria-hidden="true" ></i>
												</button>
											</div>
										</div>
									</div>
								</div>

								<div class="product-submit m-4">
									<!-- Modal content End-->
									<!-- action="${pageContext.request.contextPath}/product/cart -->
									<input type="hidden" value="${product.codeNo}" name="codeNo">

									<button
										class="btn btn-md bg-dark cart-button text-white d-inline-block cart"
										id="myBtn1">장바구니</button>
									<button
										class="btn btn-md bg-dark cart-button text-white d-inline-block mx-5" id="buyBtn">구매하기</button>
								</div>
								<!-- </form> -->
								<!-- The Modal -->

								<div id="myModal" class="modal">

									<!-- Modal content -->
									<div class="triangle"></div>
									<div class="modal-content">
										<div class="close-btn">
											<div class="close float-end">&times;</div>
										</div>
										<p>장바구니에 담겼습니다.</p>
										<span class=""><button
												class="btn btn-sm bg-dark cart-button text-white mx-4 h-25"
												id="myBtn2"
												onclick="location.href = '${pageContext.request.contextPath}/product/cart';">장바구니로
												이동</button></span>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="col-12">
						<div class="product-section-box">
							<ul class="nav nav-tabs py-2" id="myTab" role="tablist">
								<li class="nav-item" role="presentation">
									<button class="nav-link active" id="description-tab"
										data-bs-toggle="tab" data-bs-target="#description"
										type="button" role="tab" aria-controls="description"
										aria-selected="true">상품 상세</button>
								</li>

								<li class="nav-item" role="presentation">
									<button class="nav-link" id="info-tab" data-bs-toggle="tab"
										data-bs-target="#info" type="button" role="tab"
										aria-controls="info" aria-selected="false">상품 구매 안내</button>
								</li>

								<li class="nav-item" role="presentation">
									<button class="nav-link" id="review-tab" data-bs-toggle="tab"
										data-bs-target="#review" type="button" role="tab"
										aria-controls="review" aria-selected="false">상품 리뷰</button>
								</li>

								<li class="nav-item" role="presentation">
									<button class="nav-link" id="care-tab" data-bs-toggle="tab"
										data-bs-target="#care" type="button" role="tab"
										aria-controls="care" aria-selected="false">관련 상품</button>
								</li>
							</ul>

							<div class="tab-content custom-tab" id="myTabContent">
								<div class="description-panel" id="description">
									<div class="product-description">

										<div class="banner-contain nav-desh">

											<div
												class="banner-details p-center banner-b-space w-100 text-center">
												<img src="description/image?codeNo=${product.codeNo }">
											</div>
										</div>

										<div class="nav-desh">
											<div class="desh-title border-top p-3">
												<h5>원산지</h5>
												<p>${product.proCountry }</p>
											</div>
											<div class="desh-title border-top p-3">
												<h5>제조사</h5>
												<p>${product.proManf}</p>
											</div>
											<div class="desh-title border-top p-3">
												<h5>제조일자</h5>
												<p>${product.proRegdate }</p>
											</div>
											<div class="desh-title border-bottom border-top p-3">
												<h5>유통기한</h5>
												<p>${product.proExp }</p>
											</div>

										</div>
									</div>
								</div>
								<hr>
								<h3>상품 구매 안내</h3>

								<div class="" id="info" role="tabpanel"
									aria-labelledby="info-tab">
									<div class="information-box">
										<ul>
											<li>상품마다 구매 안내 정보가 상이할 수 있습니다.</li>
										</ul>
									</div>
								</div>

								<div class="" id="review" role="tabpanel"
									aria-labelledby="review-tab">
									<div class="review-box">
										<div class="row g-4">

											<div class="col-12">
												<div class="review-title py-3">
													<h3 class="fw-500">상품 리뷰</h3>
												</div>
											
												<div class="review-people">
													<ul class="review-list">
														<c:if test="${member ne null && review eq null}">
														<li class="people-box">
															<div class="people-box float-start">
																<div class="people-image">
																	<img src="thumb/image?codeNo=${product.codeNo}"
																		class="img-thumbnail blur-up lazyload" alt="">
																</div>

																<div class="people-comment float-start">
																	<a class="name" href="">${product.proName }</a>
																</div>
																
																	<button type="button" class="btn btn-primary btn-sm active" id="reviewWrite">리뷰쓰기</button>
																
															</div>
														</li>
														</c:if>
														<!-- 리뷰가 있을시에 -->
														<c:forEach items="${reviewList }" var="list" varStatus="i">
															<li class="list-group-item">
																<div class="people-profile">
																	<span><i class="fa-solid fa-circle-user fa-3x"></i></span>
																	<span class="px-2"><h3>${list.id }</h3>
																		<p>${list.writer }
<%-- 																		<c:forEach items="${memberList }" var="targetMember"> --%>
<%-- 																			<c:if test="${targetMember.id eq list.id}"> --%>
<%-- 																				${targetMember.gradeName} --%>
<%-- 																			</c:if> --%>
<%-- 																		</c:forEach> --%>
																		</p></span> <span
																		class="upload-time float-end"> 
																		<div class="upload-date form-group">
																		      <label for="replydate">등록 날짜</label>
																		      <fmt:formatDate var="uploadDate" value="${list.regdate }" pattern="yyyy-MM-dd" />
																		      <input type="text" class="form-control" value="${uploadDate }" readonly>
																		      <input type="hidden" class="form-control" id="uploadDate" value="${uploadDate }" data-index="${i.index}">
																	    </div>
																	    </span>
																	<c:if test="${member != null && list != null && member.id eq list.id}">																		
																	<span>
																		<button
																			class="btn btn-link delete-btn"
																			data-rno="${list.rno }" formaction="remove">
																			<i class="fa-solid fa-xmark" style="color: #ff0000;"></i>
																		</button>
																	</span>
																	</c:if>
																</div>
																<div class="product-name mt-2">
																	<p>${product.proName }</p>
																</div>
																<div class="people-image">
																	<ul class="nav thumbs">
																		<c:forEach items="${list.attachs }" var="attach">
																			<c:if test="${attach.image }">
																				<li class="nav-item m-2" data-uuid="${attach.uuid }"><a
																					class="img-thumb" href=""> <img
																						class="img-thumbnail"
																						src="${pageContext.request.contextPath }/display${attach.url }&thumb=on"
																						data-src="${attach.url }&thumb=off">
																				</a></li>
																			</c:if>
																		</c:forEach>
																	</ul>
																</div>
																<div class="people-comment">
																	<div class="reply">
																		<p>${list.content }</p>
																	</div>
																	<input class="review-rno" type="hidden" name="rno"
																		value="${list.rno }" data-rno="${list.rno }">
																</div>
															</li>
														</c:forEach>

													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<section class="product-list-section section-b-space">
			<div class="col-lg-9 mx-auto" id="care">
				<div class="title">
					<h3>연관 상품</h3>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="slider-5_1">
							<c:forEach items="${careProduct}" var="care">
								<div>
									<div class="product-box-3 wow fadeInUp">
										<div class="product-header">
											<div class="card-header product-image">
												<a href="${care.codeNo }"> <img
													src="thumb/image?codeNo=${care.codeNo}"
													" 
												class="d-block w-20" alt="First slide">
												</a>
											</div>
										</div>

										<div class="product-footer">
											<div class="product-detail pt-2">
												<a href="${care.codeNo }">
													<h6 class="name">${care.proName }</h6>
												</a>

												<h5 class="sold text-content">
													<span class="theme-color price">${care.proSalePrice}원</span>
												</h5>
												<h5>리뷰 갯수</h5>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</section>
		</div>
	</section>
	<!-- Product Left Sidebar End -->



	<!-- Breadcrumb Section End -->
	<div class="modal page-body" id="myModal3">
		<div class="modal-dialog modal-lg">
			<div class="row modal-content">
				<div class="col-12">
					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-body">
									<div class="title-header option-title">
										<h5>리뷰 작성</h5>
									</div>
									<div class="tab-content" id="pills-tabContent">
										<form method="post"
											class="upload-form theme-form theme-form-2 mega-form">

											<div class="row">
												<div class="mb-3 row">
													<label for="product"
														class="form-label-product col-sm-2 mb-0">상품명</label>
													<div class="col-sm-10">
														<input class="form-control" type="text" id="product"
															name="product" value="${product.proName }" readonly>

													</div>
												</div>
												<div class="mb-3 row">
													<label for="content"
														class="form-label-product col-sm-2 mb-0">내용</label>
													<div class="col-sm-10">
														<textarea id="editor" placeholder="내용을 입력해주세요"></textarea>
														<!-- 														<div id="editor" name="editor"></div> -->
														<input type="hidden" name="content" id="content">
														<input type="hidden" name="upload">
													</div>
												</div>
												<div class="mb-3 row align-items-center">
													<label for="writer"
														class="form-label-title col-lg-2 col-md-3 mb-0">[닉네임]</label>
													<div class="col-md-9 col-lg-10">
														<input class="form-control" type="text" id="writer"
															name="writer" value="${member.name}" readonly>
													</div>
												</div>


												<div class="mb-3 row align-items-center">
													<label for="file"
														class="col-sm-2 col-form-label form-label-title">파일
														첨부</label>
													<div class="col-sm-10">
														<input type="file" name="file" id="file" multiple>
													</div>
												</div>
												<div class="uploadResult my-3">
													<ul class="list-group filenames my-3"></ul>
													<ul class="nav thumbs"></ul>
												</div>
												<div class="submit-form d-flex justify-content-center">
													<span>
														<button
															class="btn theme-bg-color btn-md fw-bold mt-4 me-3 text-white"
															id="cancel">취소</button>
													</span> <span>
														<button
															class="btn theme-bg-color btn-md fw-bold mt-4 text-white"
															id="decide">리뷰작성</button>
													</span>
												</div>

												<input class="form-control" type="hidden" id="id" name="id"
													value="${member.id}"> <input class="form-control"
													type="hidden" id="codeNo" name="codeNo"
													value="${product.codeNo}">

											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer Section Start -->
	<jsp:include page="../includes/footer.jsp"></jsp:include>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js" integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script>
		$(function(){
			
			let editor;
			
			
			
			
			ClassicEditor
		    .create(document.querySelector('#editor'),{
		    	ckfinder : {
		    		uploadUrl : '${pageContext.request.contextPath}/ckImage.json'
		    	}
				
		    }).then( newEditor => {
		        editor = newEditor;
		    } )
		    .catch( error => {
		      console.error( error );
		    } );
			
			// 리뷰 쓰기
			$("#reviewWrite").click(function() {
				var $editor = editor;
 				$editor.setData("");
				$("#myModal3").modal("show").find(":text").focus();
				$("#title").val("");
			})
			
			// 취소 버튼
			$("#cancel").click(function() {
				event.preventDefault();
				$("#myModal3").modal("hide");
			})
			
			$(".ck-widget img").click(function(){
				console.log($(this));
			})
			// 리뷰 결정
			$("#decide").click(function(){
				event.preventDefault();
				let contents = editor.getData();
				if(contents == ''){
					alert("내용을 입력하세요.");
					return false;
				}
				
// 				let subStr = contents.replace(/[<][^>]*[>]/gi, "");
				let val = $("#content").attr("value",contents);
				var str="";
				
				$(".filenames li").each(function(i, obj){
					console.log(i, obj, this);
					var uuid= $(this).data('uuid');
					str += `
			        <input type="hidden" name="attachs[\${i}].uuid" value="\${uuid}">
			        <input type="hidden" name="attachs[\${i}].origin" value="\${$(this).data('origin')}">
			        <input type="hidden" name="attachs[\${i}].path" value="\${$(this).data('path')}">
			        <input type="hidden" name="attachs[\${i}].image" value="\${$(this).data('image')}">
			        `;
				});
				console.log(str);
				$(".upload-form").append(str).submit();
			})
			
			
			// 파일 확장자 검사 
			function checkExtension(files){
				const MAX_SIZE = 5 * 1024 * 1024; // 최대 크기
				const EXCLUDE_EXT = new RegExp("(.*?)\.(js|jsp|asp|php)");	// 제외할 대상 파일 확장자 
				
				for(let i in files){
					
					// 만일 최대 크기를 넘거나 제거해야할 확장자가 포함되어 있다면 실행을 멈춤
					if(files[i].size >= MAX_SIZE || EXCLUDE_EXT.test(files[i].name)){
						return false;
					}
				}
				return true;
			}
			function showUploadedFile(uploadResultArr){
				var str = "";
				var imgStr = "";
				for(var i in uploadResultArr){
					let obj = uploadResultArr[i];
					str += `<li class="list-group-item" data-uuid="\${obj.uuid}" data-origin="\${obj.origin}"  data-path="\${obj.path}" data-image="\${obj.image}">
					<a href="${pageContext.request.contextPath}/download\${obj.url}"><i class="far fa-file"></i>`; 
					str += obj.origin + `</a> <i class="far fa-times-circle btn-remove float-right" data-file="\${obj.url}"></i> </li>`;
					if(obj.image){
						imgStr += `<li class="nav-item m-2" data-uuid="\${obj.uuid}"><a class="img-thumb" href="">
						<img class="img-thumbnail" src="${pageContext.request.contextPath}/display\${obj.url}&thumb=on" data-src="\${obj.url}"></a></li>`;	
						console.log(imgStr);
					}
				}
				console.log(str);
				// 내부적으로 스트림 사용(최종)
				$(".uploadResult .filenames").append(str);
				$(".uploadResult .thumbs").append(imgStr);
			}
			
			$("#file").change(function(){
				event.preventDefault();
				let files = $(this).get(0).files;
				console.log(files);
				
				if(!checkExtension(files)){
					alert("조건 불일치!");
					return false;
				}
				
				let formData = new FormData();
				
				for(let i in files){
					formData.append("files", files[i]);
				}
				console.log(formData);
				
				
				
				
				
				
				$.ajax({
					url : "${pageContext.request.contextPath}/uploadImgAjax",
					processData : false,
					contentType : false,
					data : formData,
					method : "post",
					success : function(data){
						console.log(data);
						showUploadedFile(data);
						
					}
				})
			})
				
			
			// 리뷰 삭제
			$(".delete-btn").click(function(){
				if(!confirm("정말로 리뷰를 삭제하시겠습니까?")){
					return false;
				}
				let $this = $(this);
				let rno = $this.data("rno");
				let obj = {rno:rno};
				
				let origin = "${pageContext.request.contextPath}/product/${codeNo}";
				$.ajax({
					url: origin + "/" + rno,
					method: "post",
					processData: false,
					contentType: false,
					data: obj,
					success: function(result){
						alert("성공적으로 삭제되었습니다.");
						$this.parents("li").remove();
					}
				})
			})
			
			
			
		$(".uploadResult ul").on("click",".btn-remove", function(){
			var file = $(this).data("file");
			$.ajax({
				url : "${pageContext.request.contextPath}/deleteFile" + file,
				success : function(data){
					$('[data-uuid="' + data + '"]').remove();
				}
			})
		});
			
			// 물품 수량 및 합계 제어
			$(".qty-left-minus").prop("disabled", true);
			let str = "";
			let salePrice = "${product.proSalePrice}";
			str = (salePrice * 1).toLocaleString('ko-KR');
			$(".price-rating h3").html(str + "원");
			
			$('.qty-right-plus').click(function() {
				let salePrice = "${product.proSalePrice}";
				let cnt =  parseInt($(".qty-input").val());
				$(".qty-left-minus").prop("disabled", false);
				str = salePrice * cnt;
				str = str.toLocaleString('ko-KR');
				console.log(str);
				var proCnt =  parseInt($('.proCnt').val());
				if (cnt> proCnt) {
					$(".qty-input").val(proCnt);
 				}
				$(".price-rating h3").html(str + "원");
			})
			$('.qty-left-minus').click(function() {
				let salePrice = "${product.proSalePrice}";
				let cnt = $(".qty-input").val();
				if(cnt == 1){
					$(".qty-left-minus").prop("disabled", true);
				}
				str = salePrice * cnt;
				str = str.toLocaleString('ko-KR');
				$(".price-rating h3").html(str + "원");
			});
			
			
// 			const specExp = /[!?@#$%^&*():;+-=~{}<>\_\[\]\|\\\"\'\,\.\/\`\₩]/g;
			const korExp = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g; 
			const engExp = /[a-zA-Z]/g; // 영어
			let str2 = "";
			$(".qty-input").keyup(function(){
				let cnt = $(this).val();
				str2 = cnt;
				console.log(str2);
				if(str2 == "" || str2 == "0"){
					$(this).val(1);
					return false;
				}else{
					$(this).val(cnt);
				}
				
				if(str2 == korExp || str2 == engExp){
					alert("오류!");
					return false;
				}
				
			})
			
			$(".qty-input").keydown(function(){	
				keytime = setTimeout(function(){
					$(this).keydown.call;
					if(str2 > 100){
						$(this).val(100);
					}
				})
				
			})

			
			 $("#buyBtn").click(function(){
				var codeNo = "${codeNo}";
				var cartCnt = $(".qty-input").val();
				var salePrice = "${product.proSalePrice}";
				var proName = "${product.proName}";
				window.location.href="payMent/"+codeNo+"/"+cartCnt+"/"+salePrice;
			 })
			
			 document.getElementById("myModal");
			 document.getElementById("myBtn1");
			 document.getElementsByClassName("close");
			// 장바구니 클릭시 띄울 모달창
			
			var modal = $("#myModal");
			var btn = $("#myBtn1");
			var span = $(".close");
			
			var codeNo = "${codeNo}";
			var cartCnt = $(".qty-input").val();
			//q-btn(수량 업버튼 다운버튼 클릭시 cartCnt의 값이 변하고  장바구니 버튼을 클릭하면 비동기로 insert가 된다)
			 $(".q-btn").on("click", function() {
				    cartCnt = $(".qty-input").val();
			});
			/*  btn.onclick = function() {
		        	
		        	
		        	$("#myBtn2").click(function(){
		        		
					})
		    	} */
// 		    	.style.display = "block";
		    	
			 $(".cart").click(function(){
				 $(modal).css("display", "block");
		        	setTimeout(function(){
		        		$(modal).css("display","none");
		        		clearTimeout(setTimeout);
					}, 5000);
				 $.ajax({
			  			url : "insertProduct",
						method : "POST", 
						data : {
							codeNo : codeNo,
							cartCnt :cartCnt
						},
						success: function(result) {
							/* if(result==="success"){
								modal.style.display = "none";
								 clearTimeout(setTimeout);						
							} */
					    }
			  			
			  		})
				})
// 				style.display = "none";
// 		    	modal.style.display = 'none';
			$(span).click(function(){
				$(modal).css("display", "none");  
			})
			
			$(span).click(function(){
			  clearTimeout(setTimeout);
			  $(modal).css("display", "none"); 
			})
// 			 window.onclick = function(event) {
// 			  if (event.target == modal) {
// 			    $(modal).modal("none"); .style.display = "none";
// 			  }
// 			}

		})
		
		// 탭 클릭시 해당 영역으로 이동
		$("#description-tab").click(function(){
			var tag = $("#description").offset();
			$('html, body').animate({scrollTop : tag.top}, 300);
		});
		$("#info-tab").click(function(){
			var tag = $("#info").offset();
			$('html, body' ).animate({scrollTop : tag.top}, 300);
		});
		$("#review-tab").click(function(){
			var tag = $("#review").offset();
			$('html, body' ).animate({scrollTop : tag.top}, 300);
		})
		$("#care-tab").click(function(){
			var tag = $("#care").offset();
			$('html, body' ).animate({scrollTop : tag.top}, 300);
		})

		
		// 등록일자 설정 => 댓글 처리할 때 쓰는 용도로 지울 예정
// 		moment.locale('ko');
// 		let date = "${product.proRegdate}";
// 		let regDate = $(".product-info li:last").html("등록일자 : " + date.day moment(date).format());
// 		$(".product-info li:last").html("등록일자 : " + regDate);

		let procode = "${product.codeNo}";
		let obj = {codeNo:procode};

		$.ajax({
			url : "description/image",
			method : "get", 
			data : obj,
			contentType : false
		})
		
		$.ajax({
			url : "represent/image",
			method : "get", 
			data : obj,
			contentType : false
		})
		
		$.ajax({
			url : "thumb/image",
			method : "get", 
			data : obj,
			contentType : false
		})
		
	</script>

</body>

</html>