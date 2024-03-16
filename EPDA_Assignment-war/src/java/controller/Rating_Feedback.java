/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Rating;
import model.RatingFacade;
import model.SalesFacade;
import model.UserAcc;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "Rating_Feedback", urlPatterns = {"/Rating_Feedback"})
public class Rating_Feedback extends HttpServlet {

    @EJB
    private RatingFacade ratingFacade;

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

        String role = request.getParameter("role");
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        String add_action = request.getParameter("add_action") == null ? "" : request.getParameter("add_action");

        try (PrintWriter out = response.getWriter()) {
            Rating r = salesFacade.find(Long.parseLong(id)).getRating();
            request.setAttribute("rating", r);
            request.setAttribute("role", role);
            request.setAttribute("action", action);
            HttpSession s = request.getSession(false);
            UserAcc useracc = (UserAcc) s.getAttribute("login");

            if (add_action.equals("add_feedback")) {
                Integer cus_rate = request.getParameter("cus_rate").equals("") ? null : Integer.parseInt(request.getParameter("cus_rate"));
                String cus_feed = request.getParameter("cus_feed");
                Integer own_rate = request.getParameter("own_rate").equals("") ? null : Integer.parseInt(request.getParameter("own_rate"));
                String own_feed = request.getParameter("own_feed");
                Rating updated = ratingFacade.find(r.getId());
                updated.setCus_comments(cus_feed);
                updated.setCus_rating(cus_rate);
                updated.setOwner_comments(own_feed);
                updated.setOwner_rating(own_rate);
                ratingFacade.edit(updated);
                request.setAttribute("updateMessage", "Add rating and comment successfully!");
                if (r.getSales().getTrans_type().equals("rent")) {
                    int count = role.equals("owner") ? ratingFacade.findPendingByOwnAndRent(useracc.getId()).size()
                            : ratingFacade.findPendingByCusAndRent(useracc.getId()).size();
                    s.setAttribute("pending_rent", count);
                } else {
                    int count = role.equals("owner") ? ratingFacade.findPendingByOwnAndSale(useracc.getId()).size()
                            : ratingFacade.findPendingByCusAndSale(useracc.getId()).size();
                    s.setAttribute("pending_sale", count);
                }
                RequestDispatcher dispatcher = request.getRequestDispatcher("History");
                dispatcher.forward(request, response);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("rating_feedback.jsp");
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
