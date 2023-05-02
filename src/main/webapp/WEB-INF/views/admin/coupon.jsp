<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
	<jsp:include page="../includes/adminHead.jsp"></jsp:include>
</head>

<body>
    <!-- tap on top start -->
    <div class="tap-top">
        <span class="lnr lnr-chevron-up"></span>
    </div>
    <!-- tap on tap end -->

    <!-- page-wrapper Start -->
    <div class="page-wrapper compact-wrapper" id="pageWrapper">
        <!-- Page Header Start-->
        <jsp:include page="../includes/adminHeader.jsp"></jsp:include>
        <!-- Page Header Ends-->

        <!-- Page Body Start-->
        <div class="page-body-wrapper">
            <!-- Page Sidebar Start-->
           		<jsp:include page="../includes/adminSidebar.jsp"></jsp:include>
            <!-- Page Sidebar Ends-->

            <!-- Coupon list table starts-->
            <div class="page-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body">
                                
                                    <div class="title-header option-title">
                                        <h5>Coupon List</h5>
                                        <div class="right-options">
                                            <ul>
                                                <li>
                                                    <div class="btn btn-solid add-coupon" href="add-new-product.html">Add Coupon</div>
                                                </li>
                                            </ul>
                                        </div>
                                        
                                    </div>
                                    <div>
                                        <div class="table-responsive">
                                            <table class="table all-package coupon-list-table table-hover theme-table">
                                                <thead>
                                                    <tr>
                                                        <th>번호(내림차순)</th>
														<th>쿠폰명</th>
														<th>쿠폰가격</th>
														<th>회원등급</th>
														<th>등록일자</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                	<c:forEach items="${list }" var="coupon">
                                                    <tr>
                                                        <td>${coupon.couNo }</td>
                                                        <td>${coupon.couName }</td>
                                                        <td>${coupon.couPrice }</td>
                                                        <td>${coupon.couPrice }</td>
                                                        <td>${coupon.regDate }</td>
                                                    </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				<jsp:include page="../includes/footer.jsp"></jsp:include>
            </div>
            <!-- footer end-->
        </div>

        <!-- Create Coupon Table start -->
       
        <div class="modal create-coupon">
        	<div class="modal-dialog">
                <div class="modal-content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-sm-12">
                                     <form method="post" class="theme-form theme-form-2 mega-form">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="title-header option-title">
                                                    <h5>쿠폰 등록</h5>
                                                </div>
                                                <div class="tab-content" id="pills-tabContent">
                                                    <div class="tab-pane fade show active" id="pills-home"
                                                        role="tabpanel">
                                                            <div class="card-header-1">
                                                                <h5>General</h5>
                                                            </div>

                                                            <div class="row">
                                                                <div class="mb-4 row align-items-center">
                                                                    <label
                                                                      for="name"  class="col-lg-2 col-md-3 col-form-label form-label-title">쿠폰명</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" name="couName" id="couName" type="text">
                                                                    </div>
                                                                </div>
 																<div class="mb-4 row align-items-center">
                                                                    <label
                                                                     for="price"   class="col-lg-2 col-md-3 col-form-label form-label-title">쿠폰 가격</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" name="couPrice" id="couPrice" type="number">
                                                                    </div>
                                                                </div>
                                                                <div class="float-start ps-5 ms-5">
                                                                <div class="btn btn-primary add-coupon btn-lg cancel-button mx-3 float-start ">
																	취소
                                                               </div>
																<div class="add-button m-0">
																	<button  class="btn btn-primary add-coupon btn-lg" formaction="${pageContext.request.contextPath }/admin/couponRegister">추가</button>
                                                               </div>
                                                               </div>
                                                            </div>
                                                       
                                                    </div>
                                                    </div>
                                                </div>
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
        
    
	

    <!-- latest js -->
    <script src="${pageContext.request.contextPath}/resources/assets2/js/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath}/resources/assets2/js/bootstrap/bootstrap.bundle.min.js"></script>

    <!-- feather icon js -->
    <script src="${pageContext.request.contextPath}/resources/assets2/js/icons/feather-icon/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets2/js/icons/feather-icon/feather-icon.js"></script>

    <!-- scrollbar simplebar js -->
    <script src="${pageContext.request.contextPath}/resources/assets2/js/scrollbar/simplebar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets2/js/scrollbar/custom.js"></script>

    <!-- customizer js -->
    <script src="${pageContext.request.contextPath}/resources/assets2/js/customizer.js"></script>

    <!-- Sidebar js -->
    <script src="${pageContext.request.contextPath}/resources/assets2/js/config.js"></script>

    <!-- Data table js -->
    <script src="${pageContext.request.contextPath}/resources/assets2/js/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets2/js/custom-data-table.js"></script>

    <!-- all checkbox select js -->
    <script src="${pageContext.request.contextPath}/resources/assets2/js/checkbox-all-check.js"></script>

    <!-- sidebar effect -->
    <script src="${pageContext.request.contextPath}/resources/assets2/js/sidebareffect.js"></script>

    <!-- Theme js -->
    <script src="${pageContext.request.contextPath}/resources/assets2/js/script.js"></script>
    <script>
    $(function(){
    	$(".add-coupon").click(function(){
    		$(".create-coupon").modal("show");
    		$(".create-coupon").find(":text").focus();
    	})
    	
    	$(".cancel-button").click(function(event){
    		$(".create-coupon").find(":text").text("");
    		$(".create-coupon").modal("hide");
    	});
    	
    	$()
    })
    
    </script>
</body>

</html>