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
import model.Customer;
import model.CustomerFacade;
import model.Owner;
import model.OwnerFacade;
import model.Sales;
import model.SalesFacade;
import model.UserAcc;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "History", urlPatterns = {"/History"})
public class History extends HttpServlet {

    @EJB
    private OwnerFacade ownerFacade;

    @EJB
    private CustomerFacade customerFacade;

    @EJB
    private SalesFacade salesFacade;

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

        String action = request.getParameter("action");
        HttpSession s = request.getSession(false);
        UserAcc useracc = (UserAcc) s.getAttribute("login");
        String[] actionParts = action.split("_");
        String type = actionParts[1].equals("purchase") ? "sale" : actionParts[1];
        
        request.setAttribute("role",useracc.getRole());

        try (PrintWriter out = response.getWriter()) {
            if (action.equals("cus_rent")) {
                Customer cus = customerFacade.find(useracc.getId());
                List<Sales> sale_list = salesFacade.getSalesListWithPaymentCollectedByCustomer(cus, type);
                request.setAttribute("history", sale_list);
                request.setAttribute("action",action);
                
            } else if (action.equals("cus_purchase")) {
                Customer cus = customerFacade.find(useracc.getId());
                List<Sales> sale_list = salesFacade.getSalesListWithPaymentCollectedByCustomer(cus, type);
                request.setAttribute("history", sale_list);
                request.setAttribute("action", action);
                
            } else if (action.equals("owner_rent")) {
                Owner owner = ownerFacade.find(useracc.getId());
                List<Sales> sale_list = salesFacade.getSalesListWithPaymentCollectedByOwner(owner, type);
                request.setAttribute("history", sale_list);
                request.setAttribute("action", action);
                
            } else if (action.equals("owner_sale")) {
                Owner owner = ownerFacade.find(useracc.getId());
                List<Sales> sale_list = salesFacade.getSalesListWithPaymentCollectedByOwner(owner, type);
                request.setAttribute("history", sale_list);
                request.setAttribute("action", action);
                
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("history.jsp");
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
