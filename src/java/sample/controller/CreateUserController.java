/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author HuyRaw
 */
@WebServlet(name = "CreateUserController", urlPatterns = {"/CreateUserController"})
public class CreateUserController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "login.jsp";

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
        UserDAO dao = new UserDAO();
        try {
            String userID = request.getParameter("userID").trim();
            if (dao.checkDuplicateUserID(userID)) {
                request.setAttribute("ERROR_SIGNUP", "This username has been used!");
                return;
            }
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email").trim();
            if (dao.checkDuplicateEmail(email)) {
                request.setAttribute("ERROR_SIGNUP", "This email has been used!");
                return;
            }
            String phone = request.getParameter("phone").trim();
            String password = request.getParameter("password").trim();
            String birthday = request.getParameter("birthday");
            Date birthDay = Date.valueOf(birthday);
            UserDTO user = new UserDTO(userID, fullName, password, "US", birthDay, phone, email, 1);
            if (dao.createUser(user)) {
                request.setAttribute("SUCCESS_SIGNUP", "Successfully created your account!");
                url = SUCCESS;
            } 
        } catch (Exception e) {
            log("Error at CreateUserController" + e.toString());
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
