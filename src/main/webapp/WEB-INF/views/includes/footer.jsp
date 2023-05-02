<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.chanyongyang.domain.Criteria"%>
<%@page import="com.chanyongyang.service.BoardService"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
  <!-- Footer Section Start -->
    <footer class="section-t-space">
        <div class="container-fluid-lg">

            <div class="main-footer section-b-space section-t-space">
                <div class="row g-md-4 g-3">


                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-4">
                        <div class="footer-title">
                            <div class="">
                                <h4 class="float-start mr-5" ><a style="color: #417505" href="${pageContext.request.contextPath}/board/notice?category=1">공지사항</a></h4>
                                <a href="${pageContext.request.contextPath}/board/notice?category=1" class="float-end"><i class="fas fa-arrow-right fa-2xl" style="color: #417505"></i></a>
                            </div>
                        </div>
                        <br>
                        <hr>
                        <div class="footer-contain">
                        <c:forEach var="boardList" items="${boardIndex}">
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/board/get?${page.cri.boardQueryString}&bno=${boardList.bno}" class="text-content"><c:out value="${boardList.title}"></c:out> </a></li><hr>
                            </ul>
                        </c:forEach>
                        </div>
                    </div>

                    <!-- <div class="col-xl-5 col-lg-4 col-sm-6 d-flex justify-content-center mx-1"> -->
                    <div class="col-xl-4 col-md-4 col-sm-4 d-flex justify-content-center mx-1">
                        <div>
                        <div class="footer-title d-flex justify-content-center">
                            <h4 style="color: #417505">본사 사진</h4>
                        </div>
                        <div class="footer-contact">
                            <img class="img-rounded img-responsive" width="350" src="${pageContext.request.contextPath}/resources/assets/images/main.png">
                        </div>
                    </div>
                    </div>


                    <div class="col-xl-4 col-lg-4 col-sm-4">
                        <div class="footer-title">
                            <h4 style="color: #417505">Contact Us</h4>
                        </div>

                        <div class="footer-contact">
                            <ul>
                                <li>
                                    <div class="footer-number">
                                        <i data-feather="phone"></i>
                                        <div class="contact-number">
                                            <h6 class="text-content">점포 전화번호</h6>
                                            <h5>02-1234-1234</h5>
                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="footer-number">
                                        <i data-feather="mail"></i>
                                        <div class="contact-number">
                                            <h6 class="text-content">Email Address :</h6>
                                            <h5>fooddeuk@fooddeuk.com</h5>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="sub-footer section-small-space">
                <p>
                    <span>주식회사 푸드득유통</span><br/><br/>
                    <span>대표이사 : 이창용 사업장 소재지 : 서울특별시 구로구 디지털로 306 대륭포스트타워 2차 212호</span><br/>
                    <span>사업자등록번호 : 123-45-67890 통신판매업신고번호 : 2023-서울구로-0330  개인정보보호책임자 : 이재원, jaiwon90@gmail.com</span><br/>
                    <span>고객센터 : 02-1234-5678   개인정보 처리방침   이용약관</span>
                </p>
                
                
                
            </div>
            <div class="payment">
                <img src="${pageContext.request.contextPath}/resources/assets/images/payment/1.png" class="blur-up lazyload" alt="">
            </div>
        </div>
    </footer>
    
    <!-- latest jquery-->
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.6.0.min.js"></script>

    <!-- jquery ui-->
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-ui.min.js"></script>

    <!-- Bootstrap js-->
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap/bootstrap-notify.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap/popper.min.js"></script>

    <!-- feather icon js-->
    <script src="${pageContext.request.contextPath}/resources/assets/js/feather/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/feather/feather-icon.js"></script>

    <!-- Lazyload Js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/lazysizes.min.js"></script>

    <!-- Slick js-->
    <script src="${pageContext.request.contextPath}/resources/assets/js/slick/slick.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/slick/slick-animation.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/custom-slick-animated.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/slick/custom_slick.js"></script>

    <!-- Auto Height Js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/auto-height.js"></script>

    <!-- Timer Js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/timer1.js"></script>

    <!-- Fly Cart Js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/fly-cart.js"></script>

    <!-- Quantity js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/quantity-2.js"></script>

    <!-- WOW js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/custom-wow.js"></script>

    <!-- script js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/script.js"></script>
    <!-- Footer Section End -->
    

    
    