<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="ko">

<jsp:include page="../includes/head.jsp"></jsp:include>
<body>

	<jsp:include page="../includes/header.jsp"></jsp:include>



    <!-- Breadcrumb Section Start -->
    <section class="breadscrumb-section pt-0">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="breadscrumb-contain">
                        <h2>상품 리스트</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="${pageContext.request.contextPath}/">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Shop List</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shop Section Start -->
    <section class="section-b-space shop-section">
        <div class="container-fluid-lg">
            <div class="row justify-content-center proList">

                <div class="col-custome-9">

					<div
						class="row g-sm-4 g-3 row-cols-xxl-4 row-cols-xl-3 row-cols-lg-2 row-cols-md-3 row-cols-2 list-style">
						<c:forEach items="${list}" var="product"> 
						
						<input class="product-code" type="hidden" value="${product.codeNo}">
                        <div class="productList">
                            <div class="product-box-3 h-100 wow fadeInUp" data-wow-delay="0.05s">
                                <div class="product-header">
                                    <div class="product-image">
                                        <a href="${product.codeNo}">
                                            <img src="represent/image?codeNo=${product.codeNo}"
                                                class="img-fluid blur-up lazyload" alt="">
                                        </a>
                                    </div>
                                </div>

                                <div class="product-footer">
                                    <div class="product-detail">
                                        <span class="span-name"><c:out value="${product.proManf}"></c:out> </span>
                                        <a href="${product.codeNo}">
                                            <h5 class="name"><c:out value="${product.proName}"></c:out>  </h5>
                                        </a>
                                        <h6 class="unit"><c:out value="남은수량 ${product.proCnt}개"></c:out> </h6>
                                        <h5 class="price"><span class="theme-color"><fmt:formatNumber value="${product.proSalePrice}" pattern="#,###" />원</span>
                                        </h5>
                                    </div>
                                </div>
                            </div>
                        </div>

				</c:forEach>

                </div>
                    <div class="custome-pagination position-relative">
                        <ul class="pagination justify-content-center">
                        
                        	<c:if test="${page.doublePrev}">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/product/list?${page.cri.fullQueryString}&pageNum=${page.startPage - 1}" tabindex="-1" aria-disabled="true">
                                    <i class="fa-solid fa-angles-left"></i>
                                </a>
                            </li>
                            </c:if>
                        	<c:if test="${page.prev}">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/product/list?${page.cri.fullQueryString}&pageNum=${page.cri.pageNum - 1}">
                                    <i class="fa-solid fa-angle-left"></i>
                                </a>
                            </li>
                            </c:if>
                            
 	                        <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
                            <li class="page-item ${page.cri.pageNum == i ? 'active' : ''}">
                                <a class="page-link" href="${pageContext.request.contextPath}/product/list?&pageNum=${i}&${page.cri.fullQueryString}">${i}</a>
                            </li>
                            </c:forEach>
							
							<c:if test="${page.next}">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/product/list?${page.cri.fullQueryString}&pageNum=${page.cri.pageNum + 1}">
                                    <i class="fa-solid fa-angle-right"></i>
                                </a>
                            </li>
                            </c:if>
							<c:if test="${page.doubleNext}">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/product/list?${page.cri.fullQueryString}&pageNum=${page.endPage + 1}">
                                    <i class="fa-solid fa-angles-right"></i>
                                </a>
                            </li>
                            </c:if>
                            
                        </ul>
                    </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->
<jsp:include page="../includes/footer.jsp"></jsp:include>

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


	<!--  -->
	<script>
	
	let procode = $(".product-code").val();
	let obj = {codeNo:procode};
	
		$.ajax({
			url : "represent/image",
			method : "get",
			data: obj,
			contentType : false
		})
		
		let str = `<img alt="상품 준비중 입니다" src="${pageContext.request.contextPath}/resources/assets/images/product.jpg" class="rounded mx-auto d-block" style="width:40%" >`
		if(document.getElementsByClassName("productList").length == 0) {
			$(".proList").append(str);
		}
	</script>
</body>

</html>