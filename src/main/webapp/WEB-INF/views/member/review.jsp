<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../includes/head.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor5/37.0.1/ckeditor.min.js" integrity="sha512-u1sLXXwUefvooLCurgZpkZnSlf4Q3DJ4hIzrpB4mXFdbKsGbcekHI1x2G+ZDSVPj1r2wGnW+takK8AcAVDlqfQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor5/37.0.1/translations/ko.min.js" integrity="sha512-8ehZsiu6bs7v3zC9sqMUdj5E5zeyqDhWfI/vz+WePbKQ8gwBZe7bwBTJSwh61THz8it6ByZRLcDiSjHcOOvw7A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
.ck.ck-editor {
	max-width: 100%;
}

.ck-editor__editable {
	min-height: 400px;
}
</style>
<body>
	<jsp:include page="../includes/header.jsp" />

		
	<!-- Breadcrumb Section End -->
	 <section class="breadscrumb-section pt-0">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="breadscrumb-contain">
                        <h2 class="mb-2">리뷰작성</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="${pageContext.request.contextPath}/">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active">리뷰작성</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<div class="col-12" id="myModal">
	
		<div class="modal-dialog modal-lg">
		
			<div class="row modal-content">
				<div class="col-12">
					<div class="row">
						<div class="col-sm-12">
							<div class="write-form">
								<div class="card-body">
									<div class="tab-content" id="pills-tabContent">
										<form method="post" class="upload-form theme-form theme-form-2 mega-form">
											<div class="row">
												<div class="mb-3 row clearfix">
													<div class="float-start">
<!-- 														<div class="card-body product-image m-0 float-start"> -->
														<a href="#" tabindex="-1"> <img src="thumb/image?codeNo=${product.codeNo}" class="product-image" width="20%" alt="First slide">
														</a>
														<div class="col-9 mt-5 pt-4 float-end">
														<label for="product" class="form-label-product col-sm-2 mb-0">상품명</label>
															<input class="form-control" type="text" id="product"
																name="product" value="${product.proName}" readonly>
														</div>
														</div>
												</div>
												<div class="mb-3 row">
													<label for="content"
														class="form-label-product col-sm-2 mb-0">내용</label>
													<div class="col-sm-10">
													<textarea id="editor"></textarea>
<!-- 														<div id="editor" name="editor"></div> -->
													<input type="hidden" name="content" id="content">
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
														<a href="${pageContext.request.contextPath}/product/payMentDetails/${payNo}"
															class="btn theme-bg-color btn-md fw-bold mt-4 me-3 text-white"
															id="cancel">취소</a>
													</span> <span>
														<button
															class="btn theme-bg-color btn-md fw-bold mt-4 text-white"
															id="decide" >리뷰작성</button>
													</span>
												</div>
												<input class="form-control" type="hidden" id="id" name="id"
													value="${member.id}"> <input class="form-control"
													type="hidden" id="codeNo" name="codeNo" value="35">
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




	<div class="modal page-body" id="myModal2">
		<div class="modal-dialog modal-lg">
			<div class="row modal-content">
				<div class="col-12">
					<div class="row">
						<div class="col-sm-12">
							<ul class="card detail-list">
								<c:forEach items="${review }" var="review">
									<li class="card-body">
										<div class="people-box d-flex">
											<div class="col-2 people-image px-2">
												<img
													src="${pageContext.request.contextPath }/resources/assets/images/review/2.jpg"
													class="img-fluid blur-up lazyload float-end" alt="">
											</div>
											<div class="col-9 people-comment">
												<a class="name" href="javascript:void(0)">[구매날짜]
													${review.content }</a>
												<div class="reply">
													<p>[가격] ${review.writer }</p>
												</div>
											</div>

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

	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="tzrue">×</span>
					</button>
				</div>
				<div class="modal-body">처리가 완료되었습니다.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>

	<!-- log in section end -->
	<jsp:include page="../includes/footer.jsp" />

	<!-- Tap to top start -->
	<div class="theme-option">
		<div class="back-to-top">
			<a id="back-to-top" href="#"> <i class="fas fa-chevron-up"></i>
			</a>
		</div>
	</div>
	<!-- Tap to top end -->

	<!-- latest js -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/jquery-3.6.0.min.js"></script>

	<!-- Bootstrap js -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/bootstrap/bootstrap.bundle.min.js"></script>

	<!-- feather icon js -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/icons/feather-icon/feather.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/icons/feather-icon/feather-icon.js"></script>

	<!-- scrollbar simplebar js -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/scrollbar/simplebar.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/scrollbar/custom.js"></script>

	<!-- customizer js -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/customizer.js"></script>

	<!-- Sidebar js -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/config.js"></script>

	<!-- Plugins JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/sidebar-menu.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/notify/bootstrap-notify.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/notify/index.js"></script>

	<!-- 	ck editor js -->
<!-- 	<script -->
<%-- 		src="${pageContext.request.contextPath }/resources/assets/js/ckeditor.js"></script> --%>
<!-- 	<script -->
<%-- 		src="${pageContext.request.contextPath }/resources/assets/js/ckeditor-custom.js"></script> --%>
	<!-- select 2 js -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/select2.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/select2-custom.js"></script>

	<!--Dropzon js -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/dropzone/dropzone.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/dropzone/dropzone-script.js"></script>

	<!-- sidebar effect -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/sidebareffect.js"></script>

	<!-- Theme js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/script.js"></script>

	<script>
		$(function() {
			// moment.js 무조건 써야함
			let editor;
			ClassicEditor.create(document.querySelector('#editor'),{
		    	ckfinder : {
		    		uploadUrl : '${pageContext.request.contextPath}/ckImage.json'
		    	}
		    }).then( newEditor => {
		        editor = newEditor;
		    }).catch( error => {
		      console.error( error );
		    });
			
			
			
		
			// 리뷰 조회 
			
			
			$("#writeReview").click(function() {
				var $editor = editor;
 				$editor.setData("");
				$("#myModal").modal("show").find(":text").focus();
				$("#title").val("");
			})

			$("#viewDetail").click(function() {
				$("#myModal2").modal("show").find(":text").focus();
			})

// 			$("#cancel").click(function() {
// 				event.preventDefault();
// 				$("#myModal").modal("hide");
// 			})
		
			// 리뷰 결정
			$("#decide").click(function(){
				let contents = editor.getData();
				if(contents == ''){
					alert("내용을 입력하세요.");
					return false;
				}
				let subStr = contents.replace(/[<][^>]*[>]/gi, "");
				$("#content").attr("value",subStr);
				
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
				})
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
			
			
			
		$(".uploadResult ul").on("click",".btn-remove", function(){
			var file = $(this).data("file");
// 			console.log(file);
			$.ajax({
				url : "${pageContext.request.contextPath}/deleteFile" + file,
				success : function(data){
					$('[data-uuid=' + data + ']').remove();
				}
			})
		});
			
		let codeNo="${product.codeNo}"
			let obj={codeNo:codeNo};
			$.ajax({
				url : "${pageContext.request.contextPath}/product/thumb/image",
				method : "get", 
				data : obj,
				contentType : false
			})
		})
	</script>
</body>
</html>