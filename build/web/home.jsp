<%-- 
    Document   : home
    Created on : Mar 15, 2022, 1:21:21 PM
    Author     : HuyRaw
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>

        <!-- Navigation-->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Header-->
            <header class="bg-dark py-5">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="text-center text-white">
                        <h1 class="display-4 fw-bolder">Enjoy a great time with us</h1>
                        <p class="lead fw-normal text-white-50 mb-0">Service is our motto. Come and experience the service. You will not be dissapointed.</p>
                    </div>
                </div>
            </header>

            <!-- Section-->
        <c:if test="${requestScope.ERROR_MESSAGE != null}" >
            <div class="login-alert" style="background-image: linear-gradient(to right, rgb(220, 58, 58) , rgb(225, 44, 44)); border-radius: 20px; color: white; padding: 1.4px 6px; display: flex;align-items: center;">
                <i class="fa fa-exclamation-circle " aria-hidden="true" style="color: white; margin-right: 4px;"></i>
                ${requestScope.ERROR_MESSAGE}
            </div>
        </c:if>
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <!--CART -->
                    <c:forEach items="${requestScope.LIST_PRODUCT}" var="product">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image-->
                                <img class="card-img-top cart-view-area" src="${product.image}" alt="..." style="height: 170px; width: 268px" />
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder">${product.productName}</h5>
                                        <!-- Product price-->
                                        ${product.price}₫
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="MainController?action=Detail&productID=${product.productID}">View Detail</a></div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>                                             
                </div>
            </div>
        </section>
        <!-- Footer-->
        <div style="margin-top: 50px">
            <jsp:include page="footer.jsp"></jsp:include>
        </div>


        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
