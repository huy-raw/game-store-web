/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author HuyRaw
 */
@WebServlet(name = "UpdateUserController", urlPatterns = {"/UpdateUserController"})
public class UpdateUserController extends HttpServlet {

    private static final String ERROR = "SearchUserController";
    private static final String SUCCESS = "SearchUserController";

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
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String _birthday = request.getParameter("birthday");
            Date birthday = Date.valueOf(_birthday);
            String roleID = request.getParameter("roleID");
            int status = Integer.parseInt(request.getParameter("status"));

            UserDTO user = new UserDTO(userID, fullName, "", roleID, birthday, phone, email, status);
            UserDAO dao = new UserDAO();

            if (dao.updateUser(user)) {
                request.setAttribute("UPDATE_SUCCESS", "Update user " + userID + " successfully");
                if (userID.endsWith(loginUser.getUserID())) {
                     session.setAttribute("LOGIN_USER", user);
                }
                url = SUCCESS;
            } else {
                request.setAttribute("UPDATE_ERROR", "Update failed!!");
            }

        } catch (Exception e) {
            log("Error at UpdateUserController" + e.toString());
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
