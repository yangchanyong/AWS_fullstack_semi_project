<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

        <!-- page-wrapper Start-->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Header Start-->
            <jsp:include page="../includes/adminHeader.jsp"></jsp:include>
            <!-- Page Header Ends-->

            <!-- Page Body Start-->
            <div class="page-body-wrapper">
                <!-- Page Sidebar Start-->
                <jsp:include page="../includes/adminSidebar.jsp"></jsp:include>
                <!-- Page Sidebar Ends-->

                <!-- index body start -->
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="row">
                            <!-- chart caard section start -->
                            <div class="col-sm-6 col-xxl-3 col-lg-6">
                                <div class="main-tiles border-5 border-0  card-hover card o-hidden">
                                    <div class="custome-1-bg b-r-4 card-body">
                                        <div class="media align-items-center static-top-widget">
                                            <div class="media-body p-0">
                                                <span class="m-0">Total Revenue</span>
                                                <h4 class="mb-0 counter">$6659
                                                    <span class="badge badge-light-primary grow">
                                                        <i data-feather="trending-up"></i>8.5%</span>
                                                </h4>
                                            </div>
                                            <div class="align-self-center text-center">
                                                <i class="ri-database-2-line"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6 col-xxl-3 col-lg-6">
                                <div class="main-tiles border-5 card-hover border-0 card o-hidden">
                                    <div class="custome-2-bg b-r-4 card-body">
                                        <div class="media static-top-widget">
                                            <div class="media-body p-0">
                                                <span class="m-0">Total Orders</span>
                                                <h4 class="mb-0 counter">9856
                                                    <span class="badge badge-light-danger grow">
                                                        <i data-feather="trending-down"></i>8.5%</span>
                                                </h4>
                                            </div>
                                            <div class="align-self-center text-center">
                                                <i class="ri-shopping-bag-3-line"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6 col-xxl-3 col-lg-6">
                                <div class="main-tiles border-5 card-hover border-0  card o-hidden">
                                    <div class="custome-3-bg b-r-4 card-body">
                                        <div class="media static-top-widget">
                                            <div class="media-body p-0">
                                                <span class="m-0">Total Products</span>
                                                <h4 class="mb-0 counter">893
                                                    <a href="add-new-product.html"
                                                        class="badge badge-light-secondary grow">
                                                        ADD NEW</a>
                                                </h4>
                                            </div>

                                            <div class="align-self-center text-center">
                                                <i class="ri-chat-3-line"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6 col-xxl-3 col-lg-6">
                                <div class="main-tiles border-5 card-hover border-0 card o-hidden">
                                    <div class="custome-4-bg b-r-4 card-body">
                                        <div class="media static-top-widget">
                                            <div class="media-body p-0">
                                                <span class="m-0">Total Customers</span>
                                                <h4 class="mb-0 counter">4.6k
                                                    <span class="badge badge-light-success grow">
                                                        <i data-feather="trending-down"></i>8.5%</span>
                                                </h4>
                                            </div>

                                            <div class="align-self-center text-center">
                                                <i class="ri-user-add-line"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Earning chart star-->
                            <div class="col-xl-6">
                                <div class="card o-hidden card-hover">
                                    <div class="card-header border-0 mb-0">
                                        <div class="card-header-title">
                                            <h4>Earning</h4>
                                        </div>
                                    </div>
                                    <div class="card-body p-0">
                                        <div id="bar-chart-earning"></div>
                                    </div>
                                </div>

                            </div>
                            <!-- Earning chart end-->
                        <!-- Expenses star-->
                          <div class="col-xl-6">
                                <div class="card o-hidden card-hover">
                                    <div class="card-header border-0 mb-0">
                                        <div class="card-header-title">
                                            <h4>Earning</h4>
                                        </div>
                                    </div>
                                    <div class="card-body p-0">
                                        <div id="bar-chart-earning2"></div>
                                    </div>
                                </div>

                            </div>
                        <!-- Expenses end-->

                        </div>
                    </div>
                    <!-- Container-fluid Ends-->

                    <!-- footer start-->
                    <div class="container-fluid">
                        <jsp:include page="../includes/footer.jsp"></jsp:include>
                    </div>
                    <!-- footer End-->
                </div>
                <!-- index body end -->

            </div>
            <!-- Page Body End -->
        </div>
        <!-- page-wrapper End-->

        <!-- Modal Start -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog  modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <h5 class="modal-title" id="staticBackdropLabel">Logging Out</h5>
                        <p>Are you sure you want to log out?</p>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        <div class="button-box">
                            <button type="button" class="btn btn--no" data-bs-dismiss="modal">No</button>
                            <button type="button" class="btn  btn--yes btn-primary">Yes</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal End -->

        <!-- latest js -->
        <script src="${pageContext.request.contextPath}/resources/assets2/js/jquery-3.6.0.min.js"></script>

        <!-- Bootstrap js -->
        <script
            src="${pageContext.request.contextPath}/resources/assets2/js/bootstrap/bootstrap.bundle.min.js"></script>

        <!-- feather icon js -->
        <script
            src="${pageContext.request.contextPath}/resources/assets2/js/icons/feather-icon/feather.min.js"></script>
        <script
            src="${pageContext.request.contextPath}/resources/assets2/js/icons/feather-icon/feather-icon.js"></script>

        <!-- scrollbar simplebar js -->
        <script src="${pageContext.request.contextPath}/resources/assets2/js/scrollbar/simplebar.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets2/js/scrollbar/custom.js"></script>

        <!-- Sidebar jquery -->
        <script src="${pageContext.request.contextPath}/resources/assets2/js/config.js"></script>

        <!-- tooltip init js -->
        <script src="${pageContext.request.contextPath}/resources/assets2/js/tooltip-init.js"></script>

        <!-- Apexchar js -->
        <script src="${pageContext.request.contextPath}/resources/assets2/js/chart/apex-chart/apex-chart1.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets2/js/chart/apex-chart/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets2/js/chart/apex-chart/apex-chart.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets2/js/chart/apex-chart/stock-prices.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets2/js/chart/apex-chart/chart-custom.js"></script>
        <script
            src="${pageContext.request.contextPath}/resources/assets2/js/chart/apex-chart/chart-custom1.js"></script>

        <!-- slick slider js -->
        <script src="${pageContext.request.contextPath}/resources/assets2/js/slick.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets2/js/custom-slick.js"></script>

        <!-- customizer js -->
        <script src="${pageContext.request.contextPath}/resources/assets2/js/customizer.js"></script>

        <!-- ratio js -->
        <script src="${pageContext.request.contextPath}/resources/assets2/js/ratio.js"></script>

        <!-- sidebar effect -->
        <script src="${pageContext.request.contextPath}/resources/assets2/js/sidebareffect.js"></script>

        <!-- Theme js -->
        <script src="${pageContext.request.contextPath}/resources/assets2/js/script.js"></script>
	

    </body>
    </html>