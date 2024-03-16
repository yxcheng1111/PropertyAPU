/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UserAcc;
import model.UserAccFacade;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "Update_Password", urlPatterns = {"/Update_Password"})
public class Update_Password extends HttpServlet {

    @EJB
    private UserAccFacade userAccFacade;

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
        String oldPassword = request.getParameter("old_pass");
        String newPassword = request.getParameter("new_pass");
        String confirmPassword = request.getParameter("con_pass");
        HttpSession s = request.getSession(false);
        UserAcc user = (UserAcc) s.getAttribute("login");

        try (PrintWriter out = response.getWriter()) {

            if (oldPassword.equals(user.getPassword()) && confirmPassword.equals(newPassword) && !confirmPassword.equals(oldPassword)) {
                user.setPassword(newPassword);
                userAccFacade.edit(user);
                s.setAttribute("login", user);
                request.setAttribute("updateMessage", "Update password successfully");
                request.getRequestDispatcher("admin_home.jsp").forward(request, response);
            } else {
                request.setAttribute("updateMessage", "New password and confirm password must be same and cannot same with old password");
                request.getRequestDispatcher("update_password.jsp").forward(request, response);
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
