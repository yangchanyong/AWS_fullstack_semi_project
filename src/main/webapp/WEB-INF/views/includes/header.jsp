<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<header class="pb-md-4 pb-0">
        <div class="top-nav top-header sticky-header">
            <div class="container-fluid-lg">
                <div class="row">
                    <div class="col-12">
                        <div class="navbar-top">
                            <button class="navbar-toggler d-xl-none d-inline navbar-menu-button" type="button"
                                data-bs-toggle="offcanvas" data-bs-target="#primaryMenu">
                                <span class="navbar-toggler-icon">
                                    <i class="fa-solid fa-bars"></i>
                                </span>
                            </button>
                            <a href="${pageContext.request.contextPath}/" class="web-logo nav-logo row">
                                <div class="">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/logo/fooddeuk3.png" style="width:100px" class="img-fluid blur-up lazyload" alt="">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/logo/fooddeuk2.png" style="width:130px" class="img-fluid blur-up lazyload" alt="">
                                </div>
                            </a>

							<form action="${pageContext.request.contextPath}/product/list">
                            <div class="middle-box">
                                <div class="search-box">
                                    <div class="input-group">
                                        <input type="text" name="keyword" value="${page.cri.keyword}" class="form-control" placeholder="검색어를 입력하세요"aria-label="Search" aria-describedby="button-addon2">
                                        <button class="btn" type="submmit" id="" style="background-color: #417505; border: #417505;">
                                            <i data-feather="search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            </form>
                            <div class="rightside-box">
                                <div class="search-full">
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i data-feather="search" class="font-light"></i>
                                        </span>
                                        <input type="text" class="form-control search-type" name="keyword" value="${page.cri.keyword}" placeholder="검색어를 입력하세요">
                                        <span class="input-group-text close-search">
                                            <i data-feather="x" class="font-light"></i>
                                        </span>
                                    </div>
                                </div>
                                <ul class="right-side-menu">
                                    <li class="right-side">
                                        <a href="#" class="btn p-0 position-relative header-wishlist">
                                            <i data-feather="heart"></i>
                                        </a>
                                    </li>
<!-- 장바구니 시작-->
                                    <li class="right-side">
                                        <div class="onhover-dropdown header-badge">
                                        <a href="${pageContext.request.contextPath}/product/cart">
                                            <button type="button" class="btn p-0 position-relative header-wishlist">
                                                <i data-feather="shopping-cart"></i>
                                               <!--  장바구니 카운트<span class="position-absolute top-0 start-100 translate-middle badge cartCount">15
                                                    <span class="visually-hidden">unread messages</span>
                                                </span> -->
                                            </button>
										</a><%--
                                            <div class="onhover-div">
                                             
                                                <ul class="cart-list">
                                                    <li class="product-box-contain">
                                                        <div class="drop-cart">
                                                            <a href="#" class="drop-image">
                                                                <img src="${pageContext.request.contextPath}/resources/assets/images/vegetable/product/1.png"
                                                                    class="blur-up lazyload" alt="">
                                                            </a>

                                                            <div class="drop-contain">
                                                                <a href="product-left-thumbnail.html">
                                                                    <h5>Fantasy Crunchy Choco Chip Cookies</h5>
                                                                </a>
                                                                <h6><span>1 x</span> $80.58</h6>
                                                                <button class="close-button close_button">
                                                                    <i class="fa-solid fa-xmark"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </li>

                                                    <li class="product-box-contain">
                                                        <div class="drop-cart">
                                                            <a href="#" class="drop-image">
                                                                <img src="${pageContext.request.contextPath}/resources/assets/images/vegetable/product/2.png"
                                                                    class="blur-up lazyload" alt="">
                                                            </a>

                                                            <div class="drop-contain">
                                                                <a href="#">
                                                                    <h5>Peanut Butter Bite Premium Butter Cookies 600 g
                                                                    </h5>
                                                                </a>
                                                                <h6><span>1 x</span> $25.68</h6>
                                                                <button class="close-button close_button">
                                                                    <i class="fa-solid fa-xmark"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul> 

                                                <div class="price-box">
                                                    <h5>Total :</h5>
                                                    <h4 class="theme-color fw-bold">$106.58</h4>
                                                </div>

                                                <div class="button-group">
                                                    <a href="${pageContext.request.contextPath}/product/cart" class="btn btn-sm cart-button">View Cart</a>
                                                    <a href="${pageContext.request.contextPath}/member/logout" class="btn btn-sm cart-button theme-bg-color
                                                    text-white">Checkout</a>
                                                </div>
                                               
                                            </div> --%>
                                        </div>
                                    </li>
                                    <li class="right-side onhover-dropdown">
                                        <div class="delivery-login-box">
                                            <div class="delivery-icon">
                                                <i data-feather="user"></i>
                                            </div>
                                        </div>
<!-- 장바구니 종료-->
                                        <div class="onhover-div onhover-div-login">
                                            <ul class="user-box-name">
                                               <c:if test="${empty member}">
							                      <li class="product-box-contain">
			                                         <a href="${pageContext.request.contextPath}/member/login">로그인</a>
			                                      </li>
							                      <li class="product-box-contain">
			                                         <a href="${pageContext.request.contextPath}/member/agree">회원가입</a>
			                                      </li>
						                          </c:if >
						                        
						                        <c:if test="${not empty member}">
							                        <c:if test="${member.adminGrant>= 2}">
						                                <li class="product-box-contain">
						                                   <a href="${pageContext.request.contextPath}/admin/dashboard">관리자페이지</a>
						                                </li>
						                            </c:if>
					                                <li class="product-box-contain">
					                                   <a href="${pageContext.request.contextPath}/product/cart">Cart</a>
					                                </li>
						                         	<li class="product-box-contain">
		                                         		<a href="${pageContext.request.contextPath}/coumember/list">쿠폰조회</a>
		                                        	</li>
						                         	<li class="product-box-contain">
		                                         		<a href="${pageContext.request.contextPath}/address/list">배송지 관리</a>
		                                        	</li>
						                         	<li class="product-box-contain">
		                                         		<a href="${pageContext.request.contextPath}/product/orderList">주문내역</a>
		                                        	</li>
						                         	<li class="product-box-contain">
		                                         		<a href="${pageContext.request.contextPath}/member/mypage">회원정보 수정</a>
		                                        	</li>
		                                        	<li class="product-box-contain">
		                                            	<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
		                                        	</li>
						                        </c:if>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>

        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="header-nav">
                        <div class="header-nav-left">
                            <button class="dropdown-category btn btn-primary" style=" color: white;  background: none; background-color: #417505;">
                                <i data-feather="align-left"></i>
                                <span>카테고리</span>
                            </button>

                            <div class="category-dropdown">
                                <div class="category-title">
                                    <h5 style="color: #417505;">Categories</h5>
                                    <button type="button" class="btn p-0 close-button text-content">
                                        <i class="fa-solid fa-xmark"></i>
                                    </button>
                                </div>

                                <ul class="category-list">
                                    <li class="onhover-category-list">
                                         <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=1" class="category-name"> 
                                            <img src="${pageContext.request.contextPath}/resources/assets/svg/1/meats.svg" alt="">
                                            <h6>육가공품, 어묵, 맛살</h6>
                                            <i class="fa-solid fa-angle-right"></i>
                                        </a>

                                        <div class="onhover-category-box w-100">
                                            <div class="list-1">
                                                <div class="category-title-box">
                                                    <h5>육, 어류 가공품</h5>
                                                </div>
                                                <ul style="list-style-type: none;">
                                                    <li style="list-style-type: none;">
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=1&codeMiddleC=1">오리</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=1&codeMiddleC=2">치킨</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=1&codeMiddleC=3">바베큐, 베이컨, 소시지</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=1&codeMiddleC=4">어묵, 맛살</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=1&codeMiddleC=5">기타</a>
                                                    </li>
                                                </ul>
                                            </div>

                                        </div>
                                    </li>

                                    <li class="onhover-category-list">
                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=2" class="category-name">
                                            <img src="${pageContext.request.contextPath}/resources/assets/svg/2/fried.svg" alt="">
                                            <h6>튀김류</h6>
                                            <i class="fa-solid fa-angle-right"></i>
                                        </a>

                                        <div class="onhover-category-box w-100">
                                            <div class="list-1">
                                                <div class="category-title-box">
                                                    <h5>각종튀김</h5>
                                                </div>
                                                <ul>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=2&codeMiddleC=6">감자튀김</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=2&codeMiddleC=7">새우튀김</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=2&codeMiddleC=8">가라아게</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=2&codeMiddleC=9">까스류</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=2&codeMiddleC=10">치즈스틱</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=2&codeMiddleC=11">탕수육</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=2&codeMiddleC=12">기타</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </li>

                                    <li class="onhover-category-list">
                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=3" class="category-name">
                                            <img src="${pageContext.request.contextPath}/resources/assets/svg/2/noodles.svg" alt="">
                                            <h6>즉석간편식</h6>
                                            <i class="fa-solid fa-angle-right"></i>
                                        </a>

                                        <div class="onhover-category-box w-100">
                                            <div class="list-1">
                                                <div class="category-title-box">
                                                    <h5>즉석간편식</h5>
                                                </div>
                                                <ul>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=3&codeMiddleC=13">삼계탕</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=3&codeMiddleC=14">탕류</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=3&codeMiddleC=16">면류</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=3&codeMiddleC=17">기타</a>
                                                    </li>
                                                </ul>
                                            </div>


                                        </div>
                                    </li>
                                    <li class="onhover-category-list">
                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=4" class="category-name">
                                            <img src="${pageContext.request.contextPath}/resources/assets/svg/2/sauce.svg" alt="">
                                            <h6>소스, 양념, 드레싱</h6>
                                            <i class="fa-solid fa-angle-right"></i>
                                        </a>

                                        <div class="onhover-category-box w-100">
                                            <div class="list-1">
                                                <div class="category-title-box">
                                                    <h5>소스, 양념, 드레싱</h5>
                                                </div>
                                                <ul>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=4&codeMiddleC=18">소스, 양념</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=4&codeMiddleC=19">드레싱</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=4&codeMiddleC=20">기타</a>
                                                    </li>
                                                </ul>
                                            </div>


                                        </div>
                                    </li>
                                    <li class="onhover-category-list">
                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=5" class="category-name">
                                            <img src="${pageContext.request.contextPath}/resources/assets/svg/2/cheese.svg" alt="">
                                            <h6>떡, 유가공품</h6>
                                            <i class="fa-solid fa-angle-right"></i>
                                        </a>

                                        <div class="onhover-category-box w-100">
                                            <div class="list-1">
                                                <div class="category-title-box">
                                                    <h5>떡, 유가공품 등</h5>
                                                </div>
                                                <ul>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=5&codeMiddleC=21">떡</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=5&codeMiddleC=22">유가공품</a>
                                                    </li>
                                                </ul>
                                            </div>


                                        </div>
                                    </li>
                                    <li class="onhover-category-list">
                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=6" class="category-name">
                                            <img src="${pageContext.request.contextPath}/resources/assets/svg/1/vegetable.svg" alt="">
                                            <h6>야채, 과일, 건어물</h6>
                                            <i class="fa-solid fa-angle-right"></i>
                                        </a>

                                        <div class="onhover-category-box w-100">
                                            <div class="list-1">
                                                <div class="category-title-box">
                                                    <h5>농수산</h5>
                                                </div>
                                                <ul>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=6&codeMiddleC=23">야채</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=6&codeMiddleC=24">과일</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=6&codeMiddleC=25">수산물, 건어물</a>
                                                    </li>
                                                </ul>
                                            </div>


                                        </div>
                                    </li>
                                    <li class="onhover-category-list">
                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=7" class="category-name">
                                            <img src="${pageContext.request.contextPath}/resources/assets/svg/2/dumpling.svg" alt="">
                                            <h6>만두, 찐빵</h6>
                                            <i class="fa-solid fa-angle-right"></i>
                                        </a>

                                        <div class="onhover-category-box w-100">
                                            <div class="list-1">
                                                <div class="category-title-box">
                                                    <h5>만두, 찐빵, 유부</h5>
                                                </div>
                                                <ul>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=7&codeMiddleC=26">만두</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=7&codeMiddleC=27">찐빵</a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=7&codeMiddleC=29">유부</a>
                                                    </li>
                                                </ul>
                                            </div>


                                        </div>
                                    </li>

                                    <li class="onhover-category-list">
                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=8" class="category-name">
                                            <img src="${pageContext.request.contextPath}/resources/assets/svg/product.svg" alt="">
                                            <h6>기타상품</h6>
                                            <i class="fa-solid fa-angle-right"></i>
                                        </a>

                                        <div class="onhover-category-box w-100">
                                            <div class="list-1">
                                                <div class="category-title-box">
                                                    <h5>기타</h5>
                                                </div>
                                                <ul class="list-unstyled">
                                                    <li class="list-unstyled">
                                                        <a href="${pageContext.request.contextPath}/product/list?pageNum=1&amount=20&codeMainC=8&codeMiddleC=30">기타상품</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="header-nav-middle">
                            <div class="main-nav navbar-expand-xl navbar-light navbar-sticky">
                                <div class="offcanvas offcanvas-collapse order-xl-3" id="primaryMenu">
                                    <div class="offcanvas-header navbar-shadow">
                                        <h5 style="color: #417505;">Menu</h5>
                                        <button class="btn-close lead" type="button" data-bs-dismiss="offcanvas"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="offcanvas-body">
                                        <ul class="navbar-nav">
                                            <li class="nav-item dropdown">
                                                <a class="nav-link fs-5 px-5 justify-content-center" href="${pageContext.request.contextPath}/">홈</a>

                                            </li>

                                            <li class="nav-item dropdown">
                                                <a class="nav-link fs-5 px-5 justify-content-center" href="${pageContext.request.contextPath}/product/newProduct" >신상품</a>
                                            </li>

                                            <li class="nav-item dropdown">
                                                <a class="nav-link fs-5 px-5 justify-content-center" href="${pageContext.request.contextPath}/board/notice?category=1">공지사항</a>
                                            </li>
                                       		   <li class="nav-item dropdown dropdown-mega">
                                       	           <a class="nav-link ps-xl-2 fs-5 px-5 justify-content-center" href="${pageContext.request.contextPath}/board/bulk?category=2">대량문의게시판</a>
                                    	       </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header End -->
   <!-- mobile fix menu start -->
    <div class="mobile-menu d-md-none d-block mobile-cart" style="background: none; background-color: #417505">
        <ul>
            <li class="active">
                <a href="${pageContext.request.contextPath}/">
                    <i class="iconly-Home icli"></i>
                    <span>홈</span>
                </a>
            </li>

            <li class="mobile-category">
                <a href="javascript:void(0)">
                    <i class="iconly-Category icli js-link"></i>
                    <span>카테고리</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/product/cart">
                    <i class="iconly-Bag-2 icli fly-cate"></i>
                    <span>장바구니</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/board/notice?category=1">
                <i class="fas fa-list" style="color: #ffffff; margin: 5px"></i>
                    <span>공지사항</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/member/mypage" class="notifi-wishlist">
                    <i class="iconly-Heart icli"></i>
                    <span>MyPage</span>
            	</a>
            </li>
        </ul>
    </div>
    <!-- mobile fix menu end -->
</html>