<%-- 
    Document   : viewcart
    Created on : Mar 11, 2022, 7:49:00 AM
    Author     : HuyRaw
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.shopping.Game"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Cart cart = (Cart) session.getAttribute("CART"); %>
<% int amount = 0;
    if (session.getAttribute("CART") != null) {
        amount = ((Cart) session.getAttribute("CART")).getCartAmountGame();
    }
%>
<% List<ProductDTO> listProduct = (List) session.getAttribute("LIST_PRODUCT"); %>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>

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
    <jsp:include page="header.jsp"></jsp:include>
        <body>


        <% if (cart == null || amount == 0) { %>
        <div class="text-center" style="margin: 250px ;font-size: larger; font-family: cursive;align-items: center">
            <p>
                Your cart is empty now!
            </p>
            <form action ="ShowAllProduct">
                <button class="btn btn-group  btn-group-lg btn-outline-success" type="submit"><i class="material-icons"></i> Go back to Shopping</button>
            </form>
        </div>
        <%} else { %>
        <div class="text-center" style="margin: 20px ;font-size: larger; font-family: cursive;align-items: center">
            <div class=" btn btn-group  btn-group-lg btn-success  btn-group-vertical" style="margin-top: 30px;">
                <form action ="ShowAllProduct">
                    <button class="btn btn-group  btn-group-lg btn-success  btn-group-vertical" type="submit"><i class="material-icons"></i>Continue Shopping</button>
                </form>
            </div>
        </div>

        <div class="container" style="padding: 20px;">
            <div class=" col-12 table-wrapper" style="box-shadow: 0px 4px 38px rgb(0 0 0 / 35%), 4px 4px 11px 0px rgb(0 0 0 / 22%); ">
                <div class="table-title" >
                    <div class="row">
                        <div class="col-sm-6" >
                            <h2>Manage <b>Cart</b></h2>
                        </div>

                    </div>
                </div>
                <div  class="table-primary" >
                    <table class="table table-striped" >
                        <thead>
                            <tr>
                                <th></th>
                                <th style="padding-left: 20px">Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>


                            <% for (Game game : cart.getCart().values()) {%>

                            <% int maxQuantity = 0;
                                for (ProductDTO p : listProduct) {
                                    if (game.getGameID().equals(p.getProductID())) {
                                        maxQuantity = p.getQuantity();
                                        break;
                                    }
                                }%>

                            <tr>
                                <td>
                                    <img src="<%=game.getImage()%>" height="100px" width="100px" style="  box-shadow: 0px 4px 38px rgb(0 0 0 / 30%), 4px 4px 2px 0px rgb(0 0 0 / 22%);">
                                </td>
                        <form action="MainController" style="display: inline-block">
                            <td style="vertical-align: middle; font-size: 15px; padding-left: 20px"><%=game.getGameName()%></td>
                            <td style="vertical-align: middle; font-size: 12px"><%=game.getPrice()%> ₫</td>
                            <td style="vertical-align: middle; font-size: 12px""><input type="number" value="<%=game.getQuantity()%>" min="1" max="<%=maxQuantity%>" style="width: 50px; height: 30px; font-size: 15px; text-align: center" name="quantity"></td>
                            <td style="vertical-align: middle; font-size: 12px"><%= game.getPrice() * game.getQuantity()%> ₫</td>
                            <td style="vertical-align: middle; font-size: 12px">
                                <input type="hidden" value="<%=game.getGameID()%>" name="productID">
                                <button type="submit" name="action" value="UpdateCart" class="btn-group" style="width: 40; height: 30; font-size: initial; text-align: center">Update</button>
                            </td>

                            <td style="vertical-align: middle; font-size: 12px">
                                <a href="MainController?action=DeleteCart&gameID=<%=game.getGameID()%>" class="  btn btn-group btn-danger" data-toggle="modal" >Delete</a>
                            </td>
                        </form>
                        </tr>
                        <% }%>




                        </tbody>
                    </table>
                </div>

                <div style="display: flex; justify-content: flex-end">

                    <h4>Number of products: <%= amount%></h4>
                </div>
                <div style="display: flex; justify-content: flex-end">

                    <h3 style="font-weight: bold">Subtotal: <%= cart.getCartTotalPrice()%> ₫</h3>
                </div>
            </div>
            <div class="col-12 row justify-content-end" style="margin: 20px">
                <form action="checkout.jsp">
                    <button class="checkout" type="submit" style="display: flex; justify-content: center; border: none; margin: auto" >
                        <div style="display: flex; align-items: center" class="btn btn-group-lg btn-success" >
                            CHECK OUT  
                        </div>
                    </button>
                    <form>
                        </div>

                        <% for (Game game : cart.getCart().values()) {%>
                        <!-- Delete Modal HTML -->
                        <div id="deleteProductModal-<%=game.getGameID()%>" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="MainController">
                                        <input type="hidden" name="gameID" value="<%=game.getGameID()%>" />
                                        <div class="modal-header">
                                            <h4 class="modal-title">Confirm Delete</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Are you sure you want to delete these books?</p>
                                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                                        </div>
                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                            <button type="submit" class="btn btn-danger" name="action" value="DeleteCart">Delete</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <%}%>




                        </div>
                        <%}%>
                        <!-- partial -->
                        <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>
                        <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script><script  src="js/admin-book-user.js"></script>
                            <jsp:include page="footer.jsp"></jsp:include>
                        </body>
                        </html>
