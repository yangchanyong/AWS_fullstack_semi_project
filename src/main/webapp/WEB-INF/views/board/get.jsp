<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">

<jsp:include page="../includes/head.jsp"></jsp:include>
<style>
.ck-editor__editable {
	min-height: 400px;
}
</style>
<body>

	<jsp:include page="../includes/header.jsp"></jsp:include>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor5/37.0.1/ckeditor.min.js" integrity="sha512-u1sLXXwUefvooLCurgZpkZnSlf4Q3DJ4hIzrpB4mXFdbKsGbcekHI1x2G+ZDSVPj1r2wGnW+takK8AcAVDlqfQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor5/37.0.1/translations/ko.min.js" integrity="sha512-8ehZsiu6bs7v3zC9sqMUdj5E5zeyqDhWfI/vz+WePbKQ8gwBZe7bwBTJSwh61THz8it6ByZRLcDiSjHcOOvw7A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	

    <!-- log in section start -->
    <section class="log-in-section background-image-2 section-b-space">
        <div class="container-fluid-lg w-100">
            <div class="row">

                <div class="col-xxl-8 col-xl-5 col-lg-6 col-sm-8 mx-auto">
                    <div class="log-in-box">
                        <div class="log-in-title">
                            <h2 style="color:#417505"><strong><i class="fab fa-envira" style="color: #417505;"></i>공지사항</strong></h2>
                        </div>

                        <div class="input-box">

							<form method="post" id="frm">
								<div class="col-12">
									<div class="form-floating theme-form-floating form-group">
										<input type="text" class="form-control" id="title"
											name="title" readonly value="${board.title}"
											style="background-color: white">
									</div>
								</div>
								<br>
								<div class="col-12 row-20">
									<div class="form-floating theme-form-floating">
										<textarea class="form-control " id="comment" name="content"
											style="height: 500px; resize: none; background-color: white"
											readonly>${board.content}</textarea>
									</div>
								</div>
								<div class="justify-content-center position-relative d-flex">
									<div class="col-3 m-3">
										<a href="${pageContext.request.contextPath}/board/notice?category=1"><button
												class="btn w-100 justify-content-center"
												style="background-color: lightgray" type="button">목록으로</button></a>
									</div>
									<c:if test="${member.adminGrant >= 2}">
										<div class="col-3 m-3">
											<a
												href="${pageContext.request.contextPath}/board/modify?${cri.fullQueryString}&bno=${board.bno}"><button
													class="btn w-100 justify-content-center"
													style="background-color: #417505; color: white"
													type="button">수정하기</button></a>
										</div>
										<div class="col-3 m-3">
											<input type="hidden" id="bno" name="bno" value="${board.bno}">
											<button class="btn w-100 justify-content-center" style="background-color: red; color: white" type="submit" formaction="remove">삭제하기</button>
										</div>
									</c:if>
								</div>
							</form>
						</div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- log in section end -->
		




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
    <!-- Bg overlay E-->


	<!--  -->
	<script>
 	$(function() {
 		ClassicEditor.create($('#comment').get(0), {
 			toolbar : []
 		}).then(function(editor) {
 			editor.enableReadOnlyMode('lock');
 		})
 	})
	</script>
</body>

</html>