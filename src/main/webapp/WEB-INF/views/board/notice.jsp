<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="ko">

<jsp:include page="../includes/head.jsp"></jsp:include>
<body>
	<jsp:include page="../includes/header.jsp"></jsp:include>

	<c:if test="${param.category != 1}">
		<script>
			alert("돌아가십시오")
			window.location.href = '${pageContext.request.contextPath}/board/notice?category=1';
		</script>
	</c:if>

    <div class="container-fluid d-flex justify-content-center row mt-3 mb-5">
        <div class="row justify-content-center m-5">
            <div class="col-sm-8 align-center row">
                <div class="title-header option-title mb-4">
                    <h2 class="float-start" style="color: #417505;">푸드득 공지사항<i class="fas fa-leaf" style="color: #417505;"></i></h2>
                    <c:if test="${member.adminGrant >= 2}">
                    	<form action="${pageContext.request.contextPath}/board/register?category=1">
                    		<button class="float-end btn btn-sm" style="background-color: #417505; color: white;"><strong>글쓰기</strong></button>
                    	</form>
                    </c:if>
                </div>
                <div class="card card-table">
                    <!-- Table Start -->
                    <div class="card-body">
                        <div>
                            <div class="table-responsive">
                                <table class="user-table ticket-table review-table theme-table table"
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
                	                            <td ><a href="get?${page.cri.boardQueryString}&bno=${board.bno}"><c:out value="${board.title}"></c:out></a></td>
            	                                <td>${board.writer}</td>
        	                                    <td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
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
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/board/notice?category=1&${page.cri.fullQueryString}&pageNum=${page.startPage - 1}" tabindex="-1" aria-disabled="true">
                                    <i class="fa-solid fa-angles-left"></i>
                                </a>
                            </li>
                            </c:if>
                        	<c:if test="${page.prev}">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/board/notice?category=1&${page.cri.fullQueryString}&pageNum=${page.cri.pageNum - 1}">
                                    <i class="fa-solid fa-angle-left"></i>
                                </a>
                            </li>
                            </c:if>
                            
 	                        <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
                            <li class="page-item ${page.cri.pageNum == i ? 'active' : ''}">
                                <a class="page-link" href="${pageContext.request.contextPath}/board/notice?category=1&pageNum=${i}&${page.cri.fullQueryString}">${i}</a>
                            </li>
                            </c:forEach>
							
							<c:if test="${page.next}">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/board/notice?category=1&${page.cri.fullQueryString}&pageNum=${page.cri.pageNum + 1}">
                                    <i class="fa-solid fa-angle-right"></i>
                                </a>
                            </li>
                            </c:if>
							<c:if test="${page.doubleNext}">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/board/notice?category=1&${page.cri.fullQueryString}&pageNum=${page.endPage + 1}">
                                    <i class="fa-solid fa-angles-right"></i>
                                </a>
                            </li>
                            </c:if>
                            
                        </ul>
                    </div>
            </div> 
                    <!-- Table End -->
                </div>
            </div>
        </div>
    </div>



	<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>

</html>