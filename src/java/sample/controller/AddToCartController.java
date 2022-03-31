/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.shopping.Cart;
import sample.shopping.Game;
import sample.user.UserDTO;

/**
 *
 * @author HuyRaw
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

    private static final String ERROR = "allproduct.jsp";
    private static final String SUCCESS = "allproduct.jsp";
    private static final String LOGIN = "login.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            ProductDAO dao = new ProductDAO();
            
            try {
                List<ProductDTO> listProduct = dao.getListProductByName("");
                if (user == null) {
                    url = LOGIN;
                } else {
                    String productID = request.getParameter("productID");
                    String productName = request.getParameter("productName");
                    int price = Integer.parseInt(request.getParameter("price"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    String image = request.getParameter("image");

                    Game game = new Game(productID, productName, price, quantity, image);

                    Cart cart = (Cart) session.getAttribute("CART");
                    if (cart == null) {
                        cart = new Cart();
                    }
                    if (dao.getProductQuantity(productID) == 0) {
                        request.setAttribute("SOLDOUT_MESSAGE", "Sản phẩm đã hết hàng");
                        return;
                    }
                    cart.add(game);
                    session.setAttribute("CART", cart);
                    String message = "Adding " + quantity + " " + productName + " successfully!";
                    request.setAttribute("SHOPPING_MESSAGE", message);
                    session.setAttribute("LIST_PRODUCT", listProduct);
                    url = SUCCESS;
                }
            } catch (Exception e) {
                log("Error at AddToCartController" + e.toString());
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
            }
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
