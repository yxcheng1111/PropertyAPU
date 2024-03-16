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
import model.Property;
import model.PropertyFacade;
import model.Rating;
import model.RatingFacade;
import model.Sales;
import model.SalesFacade;
import model.UserAcc;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "Collect_Payment", urlPatterns = {"/Collect_Payment"})
public class Collect_Payment extends HttpServlet {

    @EJB
    private RatingFacade ratingFacade;

    @EJB
    private SalesFacade salesFacade;

    @EJB
    private PropertyFacade propertyFacade;

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

        try (PrintWriter out = response.getWriter()) {
            if (action.equals("collect_payment")) {
                List<Property> on_going = propertyFacade.findOnGoingByOwner(useracc.getId());
                request.setAttribute("on_going", on_going);

            } else if (action.equals("complete")) {
                Long id = Long.parseLong(request.getParameter("id"));
                Property p = propertyFacade.find(id);
                p.setStatus(p.getSales().getTrans_type());
                Sales sales = salesFacade.find(p.getSales().getId());
                sales.setRating(new Rating(p.getSales(), p.getSales().getOwner(), p.getSales().getCustomer(), null, "", null, ""));
                sales.setPayment_collected("true");
                propertyFacade.edit(p);
                salesFacade.edit(sales);
                if (sales.getTrans_type().equals("rent")) {
                    List<Rating> pending_rent = ratingFacade.findPendingByOwnAndRent(useracc.getId());
                    int count = pending_rent.size();
                    s.setAttribute("pending_rent", count);
                } else {
                    List<Rating> pending_sale = ratingFacade.findPendingByOwnAndSale(useracc.getId());
                    int count = pending_sale.size();
                    s.setAttribute("pending_sale", count);
                }
                int count = (Integer) s.getAttribute("ongoing_count") - 1;
                s.setAttribute("ongoing_count", count);
                List<Property> on_going = propertyFacade.findOnGoingByOwner(useracc.getId());
                request.setAttribute("on_going", on_going);
                request.setAttribute("updateMessage", "Collect payment successfully!");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("collect_payment.jsp");
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
