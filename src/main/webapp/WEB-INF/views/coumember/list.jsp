<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../includes/head.jsp" />
<body>
<jsp:include page="../includes/header.jsp" />


	<section class="breadscrumb-section pt-0">
	    <div class="container-fluid-lg">
	        <div class="row">
	            <div class="col-12">
	                <div class="breadscrumb-contain">
	                    <h2 class="mb-2">${member.name}님의 쿠폰</h2>
	                    <nav>
	                        <ol class="breadcrumb mb-0">
	                            <li class="breadcrumb-item">
	                                <a href="${pageContext.request.contextPath}/">
	                                    <i class="fa-solid fa-house"></i>
	                                </a>
	                            </li>
	                            <li class="breadcrumb-item active">쿠폰</li>
	                        </ol>
	                    </nav>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
     <!-- Blog Section Start -->
         <section class="blog-section section-b-space">
        <div class="container-fluid-lg">
            <div class="row g-4">
                <div class="col-xxl-9 col-xl-8 col-lg-7 order-lg-2">
                    <div class="row g-4">
                        <div class="col-12">
                        	<c:forEach items="${coumembers}" var="coumember">
	                            <div class="blog-box blog-list wow fadeInUp w-60">
	                                <div class="text-center m-4">
	                                    <h3>FREE DELIVERY</h3>
	                                    <h1>${coumember.couName}</h1>
	                                </div>
	                                <div class="blog-contain blog-contain-2 w-20">
	                                    <div class="blog-label">
	                                        <span class="cnt"><span>보유쿠폰 개수</span></span>
	                                    </div>
	                                    <button class="blog-button">${coumember.couCnt}장</button>
	                                </div>
	                            </div>
                            </c:forEach>
                        </div>
                   	</div>
               	</div>  
            </div>
        </div>
    </section>
    <!-- Blog Section End -->
    
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
</body>
</html>