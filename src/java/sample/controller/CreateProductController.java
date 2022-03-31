/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.product.ProductErrorDTO;

/**
 *
 * @author HuyRaw
 */
@WebServlet(name = "CreateProductController", urlPatterns = {"/CreateProductController"})
public class CreateProductController extends HttpServlet {

    public static final String ERROR = "admin-product.jsp";
    public static final String SUCCESS = "admin-product.jsp";

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
        ProductDAO dao = new ProductDAO();

        ProductErrorDTO productError = new ProductErrorDTO();

        try {
            List<ProductDTO> list = (List<ProductDTO>) dao.getListProductByName("");
            boolean checkValidation = true;
            String productID = request.getParameter("productID");
            if (dao.checkDulicateProductID(productID)) {
                checkValidation = false;
                productError.setProductIDError("Duplicate ID !!!!");
            }
            String productName = request.getParameter("productName");
            String image = request.getParameter("image");
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String _importDate = request.getParameter("importDate");
            Date importDate = Date.valueOf(_importDate);
            LocalDate _now = LocalDate.now();
            Date now = Date.valueOf(_now);
            if (importDate.compareTo(now) < 0) {
                checkValidation = false;
                productError.setImportDateError("ImportDate must be greater than current date!!");
            }
            String categoryID = request.getParameter("category");
            if (checkValidation) {
                ProductDTO product = new ProductDTO(productID, productName, image, price, quantity, categoryID, importDate);
                boolean check = dao.addNewProduct(product);

                if (check) {
                    list = (List<ProductDTO>) dao.getListProductByName("");
                    request.setAttribute("LIST_PRODUCT", list);
                    request.setAttribute("ADD_SUCCESS", "Creat product successfully!!!");
                }
            } else {
                request.setAttribute("LIST_PRODUCT", list);
                request.setAttribute("ERROR", productError);
                request.setAttribute("ADD_ERROR", "Create error!");
            }

        } catch (Exception e) {
            log("Error at CreateProductController" + e.toString());
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
