<%-- 
    Document   : admin
    Created on : Mar 16, 2022, 1:50:12 PM
    Author     : HuyRaw
--%>




<%@page import="sample.user.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  ArrayList<UserDTO> listUsers = (ArrayList) request.getAttribute("LIST_USER");%>


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
                var userID = document.getElementById('userID').value;
                var name = document.getElementById('name').value;
                var email = document.getElementById('email').value;
                var password = document.getElementById('password').value;
                var address = document.getElementById('address').value;
                var phone = document.getElementById('phone').value;

                if (userID.length > 10) {
                    alert("Username must not exceed 10 characters!");
                    return false;
                }
                if (name.length > 50) {
                    alert("Name must not exceed 50 characters!");
                    return false;
                }
                if (email.length > 50) {
                    alert("Email must not exceed 10 characters!");
                    return false;
                }
                if (password.length > 50) {
                    alert("Password length must not exceed 10 characters!");
                    return false;
                }
                if (address.length > 50) {
                    alert("Address must not exceed 50 characters!");
                    return false;
                }
                if (isNaN(phone)) {
                    alert("Phone number must contains number only!");
                    return false;
                }
                if (phone.length > 15) {
                    alert("Phone number must not exceed 15 characters!");
                    return false;
                }
            }
        </script>
        <title>User Manager</title>
        <link rel="icon" href="img/logo3.png" type="image/x-icon"/>

        <link rel="stylesheet" href="css/admin-book-user.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body>
        <nav class="mynavbar">
            <div class="left">

                <div class="logo" style="display: flex; align-items: center;">

                    <div class="logotext">

                        <span style="font-weight:bold; color: rgb(47, 184, 214);">GAME</span> Store | <span style="font-size: 20px">User Manager</span>

                    </div>

                </div>


            </div>

            <div class="right">
                <form action="MainController">
                    <button class="signin" type="submit" name="action" value="Logout">Logout</button>
                </form>
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

        <!--CÁI BẢNG NÈ-->

        <!-- partial:index.partial.html -->
        <div class="container">
            <div class="table-wrapper" style="box-shadow: 0px 4px 38px rgb(0 0 0 / 30%), 4px 4px 11px 0px rgb(0 0 0 / 22%);"> 
                <div class="table-title">
                    <div class="row">
                        <div class="col-md-6">
                            <h2>Wellcome:  <b>${sessionScope.LOGIN_USER.fullName}</b></h2><br/>
                            <div>
                                <form action="MainController" >
                                    <input type="text" class="text-info" name="search"  placeholder="Search..." value="${param.search}"/>
                                    <input type="submit" name ="action" value="SearchUser" class="btn-success btn-success">
                                </form>  
                            </div>
                        </div>
                        <div class="col-md-6 row">                      
                            <div  class="col-md-12">
                                <a href="MainController?action=SearchProduct&search="  style="width: 155px; height: 35px;" class="btn btn-success" data-toggle="modal"><i class="material-icons"><span class="material-icons">account_circle</span></i><span>Manage Product</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${requestScope.LIST_USER != null}">

                <table class="table table-striped table-hover">

                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>BirthDay</th>
                            <th>Role ID</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.LIST_USER}" var="user">
                            <tr>
                                <td>${user.userID}</td>
                                <td>${user.fullName}</td>
                                <td>${user.email}</td>
                                <td>${user.phone}</td>
                                <td>${user.birthday}</td>
                                <td>${user.roleID}</td>
                                <td>${user.status}</td>

                                <td>
                                    <a href="#editUserModal-${user.userID}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                </td>
                                <td>
                                    <a href="#deleteUserModal-${user.userID}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>

                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>



            </div>

        </c:if>

        <% if (listUsers != null)
                for (UserDTO u : listUsers) {%>      
        <div id="editUserModal-<%=u.getUserID().trim()%>" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="MainController" onclick="return validate()">

                        <input type="hidden" value="<%=u.getUserID().trim()%>" name="userID"/>
                        <input type="hidden" value="<%=u.getEmail().trim()%>" name="oldEmail"/>
                        <input type="hidden" value="<%=u.getRoleID().trim()%>" name="oldRoleID"/>
                        <div class="modal-header">
                            <h4 class="modal-title">Edit User</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" required value="<%=u.getFullName()%>" style="width: 305px" name="fullname" id="name">
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" required value="<%=u.getEmail()%>" style="width: 305px" name="email" id="email"> 
                            </div>

                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" class="form-control" value="<%=(u.getPhone() != null) ? u.getPhone() : ""%>" style="width: 305px" name="phone" id="phone">
                            </div>
                            <div class="form-group">
                                <label>Birthday</label>
                                <input type="date" class="form-control" value="<%=(u.getBirthday()!= null) ? u.getBirthday(): ""%>" style="width: 305px" name="birthday" id="phone">
                            </div>
                            <div class="form-group row">
                                <div class="col-6">
                                    <label>Role</label></br>
                                    <select name="roleID" style="font-size: 16px;color: rgb(85, 85, 85)">
                                        <% if ("AD".equals(u.getRoleID().trim())) {%>
                                        <option value="US">User</option>
                                        <option value="AD" selected="selected">Admin</option>
                                        <%} else if ("US".equals(u.getRoleID().trim())) {%>
                                        <option value="US" selected="selected">User</option>
                                        <option value="AD">Admin</option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="col-6">
                                    <label>Status</label></br>
                                    <select name="status" style="font-size: 16px;color: rgb(85, 85, 85)">
                                        <% if (u.getStatus() == 0) {%>
                                        <option value="1">Active</option>
                                        <option value="0" selected="selected">Inactive</option>
                                        <%} else if (u.getStatus() == 1) {%>
                                        <option value="1" selected="selected">Active</option>
                                        <option value="0">Inactive</option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <button type="submit" class="btn btn-info" name="action" value="UpdateUser">Save</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>
        <% } %>

        <!-- Edit Modal HTML -->
        <div id="addUserModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="MainController" onsubmit="return validate()">
                        <div class="modal-header">
                            <h4 class="modal-title">Add User</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Username</label>
                                <input type="text" class="form-control" required name="userID" id="userID" style="width: 305px">
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" required name="name" id="name" style="width: 305px">
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" required name="email" id="email" style="width: 305px">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" required name="password" id="password" style="width: 305px">
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <textarea class="form-control" required name="address" id="address" style="width: 305px"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" class="form-control" required name="phone" id="phone" style="width: 305px">
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <button type="submit" class="btn btn-success" name="action" value="CreateUser">Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <% if (listUsers != null)
                for (UserDTO u : listUsers) {%>      
        <div id="deleteUserModal-<%=u.getUserID().trim()%>" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="MainController">
                        <input type="hidden" value="<%=u.getUserID().trim()%>" name="userID"/>
                        <input type="hidden" value="<%=u.getRoleID().trim()%>" name="roleID"/>
                        <div class="modal-header">
                            <h4 class="modal-title">Delete User</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to delete this user?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <button type="submit" class="btn btn-danger" name="action" value="DeleteUser">Delete</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <% }%>

        <!-- partial -->
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>
        <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script><script  src="js/admin-book-user.js"></script>
    </body>
</html>