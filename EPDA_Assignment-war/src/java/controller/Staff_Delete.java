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
import model.Admin;
import model.AdminFacade;
import model.Customer;
import model.CustomerFacade;
import model.Owner;
import model.OwnerFacade;
import model.UserAcc;
import model.UserAccFacade;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "Delete", urlPatterns = {"/Delete"})
public class Staff_Delete extends HttpServlet {

    @EJB
    private CustomerFacade customerFacade;

    @EJB
    private OwnerFacade ownerFacade;

    @EJB
    private UserAccFacade userAccFacade;

    @EJB
    private AdminFacade adminFacade;

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
            if (action.equals("staff")) {
                Admin admin = adminFacade.find(username);
                UserAcc acc = userAccFacade.find(username);
                adminFacade.remove(admin);
                userAccFacade.remove(acc);
                List<Admin> admin_list = adminFacade.findAll();
                request.setAttribute("admin_list", admin_list);
                request.setAttribute("updateMessage", "Delete staff successfully");
                RequestDispatcher dispatcher = request.getRequestDispatcher("manage_staff.jsp");
                dispatcher.forward(request, response);
            } else if (action.equals("owner")) {
                Owner owner = ownerFacade.find(username);
                UserAcc acc = userAccFacade.find(username);
                try {
                    ownerFacade.remove(owner);
                    userAccFacade.remove(acc);
                    request.setAttribute("updateMessage", "Delete owner successfully");
                } catch (Exception e) {
                    request.setAttribute("updateMessage", "Not able to delete the owner");
                }
                List<Owner> owner_list = ownerFacade.findApprove("approved");
                request.setAttribute("owner_list", owner_list);

                RequestDispatcher dispatcher = request.getRequestDispatcher("manage_owner.jsp");
                dispatcher.forward(request, response);
            } else if (action.equals("customer")) {
                Customer cus = customerFacade.find(username);
                UserAcc acc = userAccFacade.find(username);
                try {
                    customerFacade.remove(cus);
                    userAccFacade.remove(acc);
                    request.setAttribute("updateMessage", "Delete customer successfully");
                } catch (Exception e) {
                    request.setAttribute("updateMessage", "Not able to delete the customer");
                }
                List<Customer> cus_list = customerFacade.findAll();
                request.setAttribute("cus_list", cus_list);
                RequestDispatcher dispatcher = request.getRequestDispatcher("manage_customer.jsp");
                dispatcher.forward(request, response);
            } else {
                Owner owner = ownerFacade.find(username);
                UserAcc acc = userAccFacade.find(username);
                ownerFacade.remove(owner);
                userAccFacade.remove(acc);
                List<Owner> owner_list = ownerFacade.findNotApprove("approved");
                request.setAttribute("owner_list", owner_list);
                request.setAttribute("updateMessage", "Delete owner successfully");
                RequestDispatcher dispatcher = request.getRequestDispatcher("pending_approval.jsp");
                dispatcher.forward(request, response);
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
