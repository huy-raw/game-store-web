<%-- 
    Document   : allproduct
    Created on : Mar 20, 2022, 1:06:01 AM
    Author     : HuyRaw
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>


        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <div style="margin-bottom: 100px">
            <jsp:include page="header.jsp"></jsp:include>
            </div>

        <c:if test="${requestScope.ERROR_MESSAGE != null}">
            <div style="display: flex; justify-content: center">
                <div  style="display: block; text-align: center; background-color: #00ffff; color: black; border: 1px solid #f07d7d; border-radius: 5px; width: 700px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                    ${requestScope.ERROR_MESSAGE}
                </div>
            </div>
        </c:if>

        <div class="container">
            <div class="row">
                <jsp:include page="left.jsp"></jsp:include>

                    <div class="col-sm-9" ">
                        <div class="row">
                        <c:forEach items="${sessionScope.LIST_PRODUCT}" var="product">                        
                            <div class="col-md-4" >
                                <div class="card h-100">
                                    <!-- Product image-->
                                    <img class="card-img-top cart-view-area" style="height: 155px; width: 305px" src="${product.image}" alt="..." />
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

            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <div style="margin-top: 50px">
            <jsp:include page="footer.jsp"></jsp:include>
        </div>

    </body>
</html>