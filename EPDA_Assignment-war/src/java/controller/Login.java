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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Owner;
import model.OwnerFacade;
import model.Property;
import model.PropertyFacade;
import model.Rating;
import model.RatingFacade;
import model.UserAcc;
import model.UserAccFacade;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @EJB
    private RatingFacade ratingFacade;

    @EJB
    private PropertyFacade propertyFacade;

    @EJB
    private OwnerFacade ownerFacade;

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
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (PrintWriter out = response.getWriter()) {
            try {
                UserAcc found = userAccFacade.find(username);
                if (found != null && password.equals(found.getPassword() + "")) {
                    found.setLastlogin(java.time.LocalDateTime.now() + "");
                    HttpSession s = request.getSession();
                    s.setAttribute("login", found);

                    if (found.getRole().equals("admin") || found.getRole().equals("staff")) {
                        userAccFacade.edit(found);
                        List<Owner> owner = ownerFacade.findApprove("pending");
                        s.setAttribute("pending_count", owner.size());
                        request.getRequestDispatcher("admin_home.jsp").include(request, response);

                    } else if (found.getRole().equals("customer")) {
                        userAccFacade.edit(found);
                        List<Rating> pending_rent = ratingFacade.findPendingByCusAndRent(username);
                        List<Rating> pending_sale = ratingFacade.findPendingByCusAndSale(username);
                        s.setAttribute("pending_rent", pending_rent.size());
                        s.setAttribute("pending_sale", pending_sale.size());
                        
                        List<Rating> r = ratingFacade.findRatingByRoleAndUsername("customer", username);
                        s.setAttribute("rating", r);

                        request.getRequestDispatcher("customer_home.jsp").include(request, response);

                    } else if (found.getRole().equals("owner")) {
                        Owner owner = ownerFacade.find(username);
                        if ((owner.getApproval_status()).equals("pending")) {
                            request.setAttribute("updateMessage", "Your registration is still in pending");
                            request.getRequestDispatcher("login.jsp").include(request, response);

                        } else if ((owner.getApproval_status()).equals("rejected")) {
                            request.setAttribute("updateMessage", "Your registration has been rejected");
                            request.getRequestDispatcher("login.jsp").include(request, response);

                        } else {
                            userAccFacade.edit(found);
                            List<Property> on_going = propertyFacade.findOnGoingByOwner(username);
                            List<Rating> pending_rent = ratingFacade.findPendingByOwnAndRent(username);
                            List<Rating> pending_sale = ratingFacade.findPendingByOwnAndSale(username);
                            s.setAttribute("pending_rent", pending_rent.size());
                            s.setAttribute("pending_sale", pending_sale.size());

                            List<Rating> r = ratingFacade.findRatingByRoleAndUsername("owner", username);
                            s.setAttribute("rating", r);

                            s.setAttribute("ongoing_count", on_going.size());
                            request.getRequestDispatcher("owner_home.jsp").include(request, response);
                        }
                    }

                } else {
                    throw new Exception();
                }
            } catch (Exception e) {
                request.setAttribute("updateMessage", "Wrong username or password!");
                request.getRequestDispatcher("login.jsp").include(request, response);
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
