/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HuyRaw
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String CREATE_USER = "CreateUser";
    private static final String CREATE_USER_CONTROLLER = "CreateUserController";
    private static final String CREATE_PRODUCT = "CreateProduct";
    private static final String CREATE_PRODUCT_CONTROLLER = "CreateProductController";
    private static final String SEARCH_PRODUCT = "SearchProduct";
    private static final String SEARCH_PRODUCT_CONTROLLER = "SearchProductController";
    private static final String SEARCH_USER = "SearchUser";
    private static final String SEARCH_USER_CONTROLLER = "SearchUserController";
    private static final String SEARCH_HOME = "SearchHome";
    private static final String SEARCH_HOME_CONTROLLER = "SearchHomeController";
    private static final String DELETE_PRODUCT = "DeleteProduct";
    private static final String DELETE_PRODUCT_CONTROLLER = "DeleteProductController";
    private static final String DELETE_USER = "DeleteUser";
    private static final String DELETE_USER_CONTROLLER = "DeleteUserController";
    private static final String UPDATE_PRODUCT = "UpdateProduct";
    private static final String UPDATE_PRODUCT_CONTROLLER = "UpdateProductController";
    private static final String UPDATE_USER = "UpdateUser";
    private static final String UPDATE_USER_CONTROLLER = "UpdateUserController";
    private static final String DETAIL = "Detail";
    private static final String DETAIL_CONTROLLER = "DetailController";
    private static final String SEARCH_BY_CATE = "SearchByCate";
    private static final String SEARCH_BY_CATE_CONTROLLER = "SearchByCategoryController";
    private static final String ADD_TO_CART = "AddToCart";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private static final String DELETE_CART = "DeleteCart";
    private static final String DELETE_CART_CONTROLLER = "DeleteCartController";
    private static final String UPDATE_CART = "UpdateCart";
    private static final String UPDATE_CART_CONTROLLER = "UpdateCartController";
    private static final String PLACE_ORDER = "PlaceOrder";
    private static final String PLACE_ORDER_CONTROLLER = "OrderController";
    private static final String VIEW_CART = "ViewCart";
    private static final String VIEW_CART_JSP = "viewcart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");

            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (CREATE_USER.equals(action)) {
                url = CREATE_USER_CONTROLLER;
            } else if (CREATE_PRODUCT.equals(action)) {
                url = CREATE_PRODUCT_CONTROLLER;
            } else if (SEARCH_PRODUCT.equals(action)) {
                url = SEARCH_PRODUCT_CONTROLLER;
            } else if (SEARCH_USER.equals(action)) {
                url = SEARCH_USER_CONTROLLER;
            } else if (SEARCH_HOME.equals(action)) {
                url = SEARCH_HOME_CONTROLLER;
            } else if (DELETE_USER.equals(action)) {
                url = DELETE_USER_CONTROLLER;
            } else if (DELETE_PRODUCT.equals(action)) {
                url = DELETE_PRODUCT_CONTROLLER;
            } else if (UPDATE_USER.equals(action)) {
                url = UPDATE_USER_CONTROLLER;
            } else if (UPDATE_PRODUCT.equals(action)) {
                url = UPDATE_PRODUCT_CONTROLLER;
            } else if (DETAIL.equals(action)) {
                url = DETAIL_CONTROLLER;
            }else if (SEARCH_BY_CATE.equals(action)) {
                url = SEARCH_BY_CATE_CONTROLLER;
            } else if (ADD_TO_CART.equals(action)) {
                url = ADD_TO_CART_CONTROLLER;
            } else if (DELETE_CART.equals(action)) {
                url = DELETE_CART_CONTROLLER;
            }else if (UPDATE_CART.equals(action)) {
                url = UPDATE_CART_CONTROLLER;
            } else if (PLACE_ORDER.equals(action)) {
                url = PLACE_ORDER_CONTROLLER;
            }  else if (VIEW_CART.equals(action)) {
                url = VIEW_CART_JSP;
            }else {
                request.setAttribute("ERROR_MESSAGE", "Function is not avaiable");
            }
        } catch (Exception e) {
            log("Error at Maincontroller" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
