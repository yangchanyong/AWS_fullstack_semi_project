<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="ko">

<jsp:include page="../includes/head.jsp"></jsp:include>
<body>

	<jsp:include page="../includes/header.jsp"></jsp:include>



	<div
		class="container-fluid d-flex justify-content-center row mt-3 mb-5">
		<div class="row justify-content-center m-5">
			<div class="col-sm-8 align-center row">
				<c:if test="${member.adminGrant >= 2}">
					<div class="title-header option-title mb-4">
						<h2 class="float-start" style="color: #417505;">
							푸드득 대량문의 게시판<i class="fas fa-leaf" style="color: #417505;"></i>
						</h2>
					</div>
					<div class="card card-table">
						<!-- Table Start -->
						<div class="card-body">
							<div>
								<div class="table-responsive">
									<table
										class="user-table ticket-table review-table theme-table table"
										id="table_id">
										<thead class="text-center">
											<tr style="color: #417505;">
												<th>No.</th>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일</th>
											</tr>
										</thead>
										<tbody class="text-center">
											<c:forEach items="${list}" var="board">
												<tr>
													<td>${board.bno}</td>
													<td><a
														href="bulkGet?${page.cri.boardQueryString}&bno=${board.bno}"><c:out
																value="${board.title}"></c:out></a></td>
													<td>${board.writer}</td>
													<td><fmt:formatDate value="${board.regdate}"
															pattern="yyyy-MM-dd HH:mm" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="custome-pagination position-relative m-2">
							<ul class="pagination justify-content-center">

								<c:if test="${page.doublePrev}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/board/bulk?category=2&${page.cri.fullQueryString}&pageNum=${page.startPage - 1}"
										tabindex="-1" aria-disabled="true"> <i
											class="fa-solid fa-angles-left"></i>
									</a></li>
								</c:if>
								<c:if test="${page.prev}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/board/bulk?category=2&${page.cri.fullQueryString}&pageNum=${page.cri.pageNum - 1}">
											<i class="fa-solid fa-angle-left"></i>
									</a></li>
								</c:if>

								<c:forEach begin="${page.startPage}" end="${page.endPage}"
									var="i">
									<li class="page-item ${page.cri.pageNum == i ? 'active' : ''}">
										<a class="page-link"
										href="${pageContext.request.contextPath}/board/bulk?category=2&pageNum=${i}&${page.cri.fullQueryString}">${i}</a>
									</li>
								</c:forEach>

								<c:if test="${page.next}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/board/bulk?category=2&${page.cri.fullQueryString}&pageNum=${page.cri.pageNum + 1}">
											<i class="fa-solid fa-angle-right"></i>
									</a></li>
								</c:if>
								<c:if test="${page.doubleNext}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/board/bulk?category=2&${page.cri.fullQueryString}&pageNum=${page.endPage + 1}">
											<i class="fa-solid fa-angles-right"></i>
									</a></li>
								</c:if>

							</ul>
						</div>
					</div>
				</c:if>
				<c:if test="${member.adminGrant == 1 || member.adminGrant == null}">
					<div
						class="container-fluid d-flex justify-content-center row mt-3 mb-5">
						<div
							class="title-header option-title mb-4 d-flex justify-content-center">
							<h2 class="float-start" style="color: #417505;">
								푸드득 대량문의 게시판<i class="fas fa-leaf" style="color: #417505;"></i>
							</h2>
						</div>
						<div
							class="col-sm-12 align-center row card card-table b-3 justify-content-center">
							<h3 class="m-3">대량문의 게시판은</h3>
							<h3 class="m-3">저희 쇼핑몰에 등록된 상품을 대량으로 문의 주시거나</h3>
							<h3 class="m-3">쇼핑몰에 등록되지 않은 삼품을 문의주시는 공간입니다.</h3>
							<h3 class="m-3">게시글을 등록하시면 담당 영업사원이 연락드립니다</h3>
							<h3 class="m-3">감사합니다.</h3>
							<form
								action="${pageContext.request.contextPath}/board/bulkRegister"
								class="position-relative">
								<button class=" btn justify-content-center m-2"
									style="background-color: #417505; color: white;">
									<strong>글쓰기</strong>
								</button>
							</form>
						</div>
					</div>


					<div class="title-header option-title mb-4">
						<h2 class="float-start" style="color: #417505;">
							내가 쓴 게시글 보기<i class="fas fa-leaf" style="color: #417505;"></i>
						</h2>
					</div>
					<div class="card card-table">
						<!-- Table Start -->
						<div class="card-body">
							<div>
								<div class="table-responsive">
									<table
										class="user-table ticket-table review-table theme-table table"
										id="table_id">
										<thead class="text-center">
											<tr style="color: #417505;">
												<th>No.</th>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일</th>
											</tr>
										</thead>
										<tbody class="text-center">
											<c:forEach items="${listId}" var="board">
												<c:if test="${board.id eq member.id}">
													<tr>
														<td>${board.bno}</td>
														<td><a
															href="bulkGet?${page.cri.boardQueryString}&bno=${board.bno}"><c:out
																	value="${board.title}"></c:out></a></td>
														<td>${board.writer}</td>
														<td><fmt:formatDate value="${board.regdate}"
																pattern="yyyy-MM-dd HH:mm" /></td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</c:if>

				<!-- Table End -->
			</div>
		</div>
	</div>



	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>