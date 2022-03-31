<%-- 
    Document   : admin
    Created on : Mar 15, 2022, 1:50:12 PM
    Author     : HuyRaw
--%>




<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<c:if test="${sessionScope.LOGIN_USER.roleID == 'US'}" >
    <c:redirect url="home.jsp">
    </c:redirect>
</c:if>

<c:if test="${sessionScope.LOGIN_USER.roleID == null}" >
    <c:redirect url="login.jsp">
    </c:redirect>
</c:if>




<!DOCTYPE html>
<html>

    <head>

        <script>
            function validate() {
                var productID = document.getElementById('productID').value;
                var productName = document.getElementById('productName').value;
                var image = document.getElementById('image').value;


                if (productID.length > 10) {
                    alert("Product ID must not exceed 10 characters!");
                    return false;
                }
                if (productName.length > 50) {
                    alert("Name must not exceed 50 characters!");
                    return false;
                }
                if (image.length < 10) {
                    alert("Image URL length must not less than 10 characters!");
                    return false;
                }
            }
        </script>


        <title>Game Store Manager</title>

        <link rel="stylesheet" href="css/admin-book-user.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <style>
        input {
            resize: horizontal;
            width: 130px;
        }


    </style>
    <body>


        <nav class="mynavbar">
            <div class="left">

                <div class="logo" style="display: flex; align-items: center;">
                    <div class="logotext">
                        <span style="font-weight:bold; color: rgb(47, 184, 214);">GAME</span> Store | <span style="font-size: 20px">Product Manager</span> 
                        <br>                   
                    </div>

                </div>



            </div>

            <div class="right">
                <c:url var="logout" value="MainController">
                    <c:param name="action" value="Logout"></c:param>
                </c:url>
                <a  class="btn btn-primary" role="button" href="${logout}">Logout</a>
            </div>
        </nav>

        <c:if test="${requestScope.ADD_ERROR != null}">
            <div style="display: flex; justify-content: center">
                <div  style="display: block; text-align: center; background-color: #eca7a7; color: black; border: 1px solid #f07d7d; border-radius: 5px; width: 700px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                    ${requestScope.ADD_ERROR}
                </div>
            </div>
        </c:if>

        <c:if test="${requestScope.ADD_SUCCESS != null}">
            <div style="display: flex; justify-content: center">
                <div  style="display: block; text-align: center; background-color: #00ffff; color: black; border: 1px solid #f07d7d; border-radius: 5px; width: 700px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                    ${requestScope.ADD_SUCCESS}
                </div>
            </div>
        </c:if>

        <c:if test="${requestScope.UPDATE_SUCCESS != null}">
            <div style="display: flex; justify-content: center">
                <div  style="display: block; text-align: center; background-color: #00ffff; color: black; border: 1px solid #f07d7d; border-radius: 5px; width: 700px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                    ${requestScope.UPDATE_SUCCESS}
                </div>
            </div>
        </c:if>

        <c:if test="${requestScope.UPDATE_ERROR != null}">
            <div style="display: flex; justify-content: center">
                <div  style="display: block; text-align: center; background-color: #eca7a7; color: black; border: 1px solid #f07d7d; border-radius: 5px; width: 700px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                    ${requestScope.UPDATE_ERROR}
                </div>
            </div>
        </c:if>
        <c:if test="${requestScope.DELETE_ERROR != null}">
            <div style="display: flex; justify-content: center">
                <div  style="display: block; text-align: center; background-color: #eca7a7; color: black; border: 1px solid #f07d7d; border-radius: 5px; width: 700px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                    ${requestScope.DELETE_ERROR}
                </div>
            </div>
        </c:if>
        <c:if test="${requestScope.DELETE_SUCCESS != null}">
            <div style="display: flex; justify-content: center">
                <div  style="display: block; text-align: center; background-color: #00ffff; color: black; border: 1px solid #f07d7d; border-radius: 5px; width: 700px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                    ${requestScope.DELETE_SUCCESS}
                </div>
            </div>
        </c:if>

        <!-- Validation update product-->
        <c:if test="${requestScope.ERROR != null}">
            <div class="alert-danger badge-danger" style="display: flex; justify-content: center">
                <p class="alert-danger">${requestScope.ERROR.productIDError} </p>  
                <p class="alert-danger">${requestScope.ERROR.productNameError} </p>  
                <p class="alert-danger">${requestScope.ERROR.importDateError} </p>    
            </div>
        </c:if>    

        <!-- CÁI BẢNG NÈ -->
        <div class="container-fluid" >
            <div class="table-wrapper" style="box-shadow: 0px 4px 38px rgb(0 0 0 / 30%), 4px 4px 11px 0px rgb(0 0 0 / 22%);"> 
                <div class="table-title">
                    <div class="row">
                        <div class="col-md-6">
                            <h2>Wellcome:  <b>${sessionScope.LOGIN_USER.fullName}</b></h2><br/>
                            <div>
                                <form action="MainController" >
                                    <input type="text" style="color: black"  name="SearchProduct"  placeholder="Search..." value="${param.search}"/>
                                    <input type="submit" name ="action" value="Search" class="btn-success btn-outline-info">
                                </form>  
                            </div>
                        </div>
                        <div class="col-md-6 row">
                            <div class="col-md-12" >
                                <a href="#addProductModal" style="width: 155px; height: 35px;" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i><span>Add New Product</span> </a>
                            </div>
                            <div  class="col-md-12">
                                <a href="MainController?action=SearchUser&search="  style="width: 155px; height: 35px;" class="btn btn-success" data-toggle="modal"><i class="material-icons"><span class="material-icons">account_circle</span></i><span>Manage User</span></a>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr >           
                            <th>ProductID</th>
                            <th>ProductName</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>CategoryID</th>
                            <th >ImportDate</th>                          
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${requestScope.LIST_PRODUCT}">
                        <form action="MainController">
                            <tr>
                                <td style="vertical-align: middle; font-size: 12px; padding-left: 10px">${product.productID}</td>
                                <td style="vertical-align: middle; font-size: 12px; padding-left: 10px"><input type="text" value="${product.productName}" name="productName"></td>
                                <td style="vertical-align: middle; font-size: 12px; padding-left: 10px"" ><input type="number" value="${product.price}" name="price"> ₫</td>                              
                                <td style="vertical-align: middle; font-size: 12px; padding-left: 10px"; text-align: center"><input type="number" value="${product.quantity}" name="quantity"></td>
                                <td style="vertical-align: middle; font-size: 12px; padding-right: 50px ;text-align: center">${product.categoryID}</td>
                                <td style="vertical-align: middle; font-size: 12px;"><input type="date" value="${product.importDate}" name="importDate"></td>                               
                                <td style="vertical-align: middle; font-size: 12px">                                  
                                    <input type="submit" name="action" value="UpdateProduct" class="btn-group" />
                                    <input type="hidden" name="productID" value="${product.productID}" />                                     
                                    <input type="hidden" name="categoryID" value="${product.categoryID}" />                                     
                                </td>
                                <td style="vertical-align: middle; font-size: 12px" >
                                    <c:url var="delete" value="MainController"  >
                                        <c:param name="action" value="DeleteProduct"> </c:param>                   
                                        <c:param name="productID" value="${product.productID}"></c:param>
                                        <c:param name="search" value=""></c:param>
                                    </c:url>
                                    <a href="${delete}" class="btn-group"><i class="material-icons" data-toggle="tooltip" title="Delete" onclick="return confirm('Are you sure you want to continue?')"  >&#xE872;</i></a>

                                </td>
                            </tr>
                        </form>       
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- Adding Modal HTML -->        
            <div id="addProductModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="MainController" onsubmit="return validate()">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>ProductID</label>
                                    <input id="productID" name="productID" type="text" class="form-control" maxlength="20" required>
                                </div>
                                <div class="form-group">
                                    <label>ProductName</label>
                                    <input name="productName" id="productName" type="text" class="form-control" maxlength="50" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input id="image" name="image" type="text" class="form-control" minlength="30" maxlength="250" required>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input id="price" name="price" type="number" min="1" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input id="quantity" name="quantity" type="number" min="1" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>ImportDate</label>
                                    <input id="importName" name="importDate" type="date" class=" form-control" required ></input>
                                </div>      

                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="category" class="form-select" aria-label="Default select example">                                            
                                        <option value="A01">Action</option>                                                                          
                                        <option value="A02">Aventure</option>                                                                          
                                        <option value="C01">Casual</option>                                                                          
                                        <option value="R01">Role playing</option>                                                                          
                                        <option value="R02">Racing</option>                                                                          
                                        <option value="S01">Stimulation</option>                                                                          
                                        <option value="S02">Statery</option>                                                                          
                                        <option value="S03">Sport</option>                                                                          

                                    </select>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" name="action" value="CreateProduct">
                            </div>
                        </form>
                    </div>
                </div>
            </div>              



            <script src="js/manager.js" type="text/javascript"></script>
            <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>
            <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script><script  src="js/admin-book-user.js"></script>
    </body>
</html>

