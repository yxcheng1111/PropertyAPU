/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Owner;
import model.OwnerFacade;
import model.UserAcc;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "Approval", urlPatterns = {"/Approval"})
public class Approval extends HttpServlet {

    @EJB
    private OwnerFacade ownerFacade;

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
        String username = request.getParameter("username");
        String action = request.getParameter("action");
        try (PrintWriter out = response.getWriter()) {
            if (action.equals("approve_rejected")) {
                Owner owner = ownerFacade.find(username);
                owner.setApproval_status("approved");
                ownerFacade.edit(owner);
                List<Owner> owner_list = ownerFacade.findNotApprove("approved");
                request.setAttribute("owner_list", owner_list);
                request.setAttribute("updateMessage", "Successfully approved!");
            } else {
                HttpSession s = request.getSession(false);
                int count = (Integer) s.getAttribute("pending_count") - 1;
                s.setAttribute("pending_count", count);
                if (action.equals("approve")) {
                    Owner owner = ownerFacade.find(username);
                    owner.setApproval_status("approved");
                    ownerFacade.edit(owner);
                    List<Owner> owner_list = ownerFacade.findNotApprove("approved");
                    request.setAttribute("owner_list", owner_list);
                    request.setAttribute("updateMessage", "Successfully approved!");
                } else {
                    Owner owner = ownerFacade.find(username);
                    owner.setApproval_status("rejected");
                    ownerFacade.edit(owner);
                    List<Owner> owner_list = ownerFacade.findNotApprove("approved");
                    request.setAttribute("owner_list", owner_list);
                    request.setAttribute("updateMessage", "Successfully rejected!");
                }
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("pending_approval.jsp");
            dispatcher.forward(request, response);
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
