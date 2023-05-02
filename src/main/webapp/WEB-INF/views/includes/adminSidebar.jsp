<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="sidebar-wrapper">

	<div id="sidebarEffect"></div>
	<div class="sidebar-ground">
		<div class="logo-wrapper logo-wrapper-center">
			<a href="${pageContext.request.contextPath}"
				class="web-logo nav-logo row"> </a>
			<div class="back-btn">
				<i class="fa fa-angle-left"></i>
			</div>
			<div class="toggle-sidebar">
				<i class="ri-apps-line status_toggle middle sidebar-toggle"></i>
			</div>
		</div>
		<nav class="sidebar-main">
			<div class="left-arrow" id="left-arrow">
				<i data-feather="arrow-left"></i>
			</div>

			<div id="sidebar-menu">
				<ul class="sidebar-links" id="simple-bar">
					<div class="index-logo px-3">
						<a href="dashboard"> <img
							src="${pageContext.request.contextPath}/resources/assets/images/logo/fooddeuk3.png"
							style="width: 100px" class="img-fluid blur-up lazyload" alt="">
						</a> <a href="dashboard"> <img
							src="${pageContext.request.contextPath}/resources/assets/images/logo/fooddeuk2.png"
							style="width: 130px" class="img-fluid blur-up lazyload" alt="">
						</a>

					</div>


					<li class="back-btn"></li>

					<li class="sidebar-list"><a
						class="sidebar-link sidebar-title link-nav" href="dashboard">
							<i class="ri-home-line"></i> <span>대쉬보드</span>
					</a></li>

					<li class="sidebar-list"><a
						class="sidebar-link sidebar-title link-nav" href="role"> <i
							class="ri-user-3-line"></i> <span>회원 관리</span>
					</a></li>


					<li class="sidebar-list"><a
						class="sidebar-link sidebar-title link-nav" href="order"> <i
							class="ri-archive-line"></i> <span>주문 및 배송관리</span>
					</a></li>


					<li class="sidebar-list"><a
						class="linear-icon-link sidebar-link sidebar-title link-nav"
						href="coupon"> <i class="ri-price-tag-3-line"></i> <span>쿠폰</span>
					</a></li>

				</ul>
			</div>

			<div class="right-arrow" id="right-arrow">
				<i data-feather="arrow-right"></i>
			</div>

		</nav>

	</div>
</div>