<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="page-header">
            <div class="header-wrapper m-0">
	<c:if test="${member.adminGrant == 1 || member.adminGrant == null}">
		<script>
			alert("권한이 없습니다.")
			window.location.href = '${pageContext.request.contextPath}/';
		</script>
	</c:if>
                <div class="nav-right col-6 pull-right right-header p-0">
                
                    <ul class="nav-menus">
                    	<li>
                    		<a class="text-dark" href="${pageContext.request.contextPath}">홈으로</a>
                    	</li>
                        <li>
                            <span class="header-search">
                                <i class="ri-search-line"></i>
                            </span>
                        </li>
                        <li class="profile-nav onhover-dropdown pe-0 me-0">
                            <div class="media profile-media">
                                <img class="user-profile rounded-circle" src="${pageContext.request.contextPath}/resources/assets2/images/users/4.jpg" alt="">
                                <div class="user-name-hide media-body">
                                    <span>${member.name}</span>
                                    <p class="mb-0 font-roboto">Admin<i class="middle ri-arrow-down-s-line"></i></p>
                                </div>
                            </div>
                            <ul class="profile-dropdown onhover-show-div">
                                <li>
                                    <a href="all-users.html">
                                        <i data-feather="users"></i>
                                        <span>Users</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="order-list.html">
                                        <i data-feather="archive"></i>
                                        <span>Orders</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="support-ticket.html">
                                        <i data-feather="phone"></i>
                                        <span>Spports Tickets</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="profile-setting.html">
                                        <i data-feather="settings"></i>
                                        <span>Settings</span>
                                    </a>
                                </li>
                                <li>
                                    <a data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                        href="javascript:void(0)">
                                        <i data-feather="log-out"></i>
                                        <span>Log out</span>
                                    </a>
                                    <a href="${pageContext.request.contextPath}"><i class="fa-solid fa-house"></i></a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>