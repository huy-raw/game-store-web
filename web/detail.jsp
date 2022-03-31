<%-- 
    Document   : admin
    Created on : Mar 15, 2022, 1:38:21 PM
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
        <title>Shop Item - Start Bootstrap Template</title>
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
        <% if (request.getAttribute("SOLDOUT_MESSAGE") != null) {%>
        <div style="display: flex; justify-content: center">
            <div class="testthoi" style="display: block; text-align: center; background-color: #eca7a7; border: 1px solid #f07d7d;; border-radius: 5px; width: 1230px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                <%= request.getAttribute("SOLDOUT_MESSAGE")%>
            </div>   
        </div> 
        <%}%>   
        <% if (request.getAttribute("SHOPPING_MESSAGE") != null) {%>
        <div style="display: flex; justify-content: center">
            <div class="testthoi" style="display: block; text-align: center; background-color: #bfe9c7; border: 1px solid #57df70; border-radius: 5px; width: 1230px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                <%= request.getAttribute("SHOPPING_MESSAGE")%>
            </div>   
        </div> 
        <%}%>     

        <!-- Product section-->
        <c:set value="${requestScope.PRODUCT}" var="product"></c:set>
            <section class="py-5">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="row gx-4 gx-lg-5 align-items-center">
                        <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${product.image}" alt="..." /></div>

                    <div class="col-md-6">
                        <div class="small mb-1" >${product.productID}</div>
                        <h1 class="display-5 fw-bolder">${product.productName}</h1>
                        <div class="fs-5 mb-5">

                            <span>${product.price}₫</span>
                        </div>
                        <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?</p>

                        <form action="MainController">
                            <div class="d-flex">
                                <input type="hidden" name="productID" value="${product.productID}">
                                <input type="hidden" name="productName" value="${product.productName}">         
                                <input type="hidden" name="price" value="${product.price}">
                                <input type="hidden" name="image" value="${product.image}">
                                <input class="form-control text-center me-3" id="inputQuantity" type="num" name ="quantity" value="1" style="max-width: 3rem" />
                                <button class="btn btn-outline-dark flex-shrink-0" type="submit" name="action" value="AddToCart">
                                    <i class="bi-cart-fill me-1"></i>
                                    Add To Cart
                                </button>
                            </div>
                        </form>

                    </div>


                </div>
            </div>
        </section>



        <!--select top 4 product -->
        <!-- Related items section-->

        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Related products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                    <c:forEach var="product" items="${requestScope.LIST_4_PRODUCT}">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image-->
                                <img class="card-img-top" src="${product.image}" alt="..." style="width: 268px; height: 170px"/>
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
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>




                </div>
            </div>
            <!-- Bootstrap core JS-->

        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
