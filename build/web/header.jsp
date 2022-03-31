<%-- 
    Document   : header
    Created on : Mar 15, 2022, 3:19:42 PM
    Author     : HuyRaw
--%>


<%@page import="sample.shopping.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<% int amount = 0;
    if (session.getAttribute("CART") != null) {
        amount = ((Cart) session.getAttribute("CART")).getCartAmountGame();
    }
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">

    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#!">Game Hub</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="HomeController" >Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="ShowAllProduct">All Products</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                        <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                    </ul>
                </li>

            </ul>

            <ul class="navbar-nav">
                <c:if test="${sessionScope.LOGIN_USER != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Welcome : ${sessionScope.LOGIN_USER.fullName}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutController">Logout</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.LOGIN_USER == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                </c:if> 
                <li class="nav-item navbar-collapse" style="margin: 0 10px">
                    <div >
                        <form action="MainController">
                            <input type="text" style="text-align: left; width: 150px" name="search"  placeholder="Search..." value="${param.search}" class="input input-group-text" />
                            <input  hidden=" "type="submit" name ="action" value="SearchHome">
                        </form>
                    </div>

                </li>
            </ul>

            <form class="d-flex" action="MainController">
                <button class="btn btn-outline-dark" type="submit" name="action" value="ViewCart">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill"> <span class="cartCount" ><%=amount%></span></span>
                </button>
            </form>
        </div>
    </div>
</nav>
