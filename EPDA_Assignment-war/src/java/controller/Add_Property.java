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
import model.Owner;
import model.OwnerFacade;
import model.Property;
import model.PropertyFacade;
import model.UserAcc;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "Add_Property", urlPatterns = {"/Add_Property"})
public class Add_Property extends HttpServlet {

    @EJB
    private OwnerFacade ownerFacade;

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
        HttpSession s = request.getSession(false);
        UserAcc useracc = (UserAcc) s.getAttribute("login");
        Owner owner = ownerFacade.find(useracc.getId());
        String result = request.getParameter("action");
        String p_name = request.getParameter("p_name");
        String p_type = request.getParameter("p_type");
        String furnishing = request.getParameter("furnishing");
        String r_no = request.getParameter("r_no");
        String t_no = request.getParameter("t_no");
        String f_size = request.getParameter("f_size");
        String location = request.getParameter("location");
        String r_price = request.getParameter("r_price");
        r_price = (r_price.length()==0) ? "0" : r_price;
        String s_price = request.getParameter("s_price");
        s_price = (s_price.length()==0) ? "0" : s_price;
        String desc = request.getParameter("desc");

        try (PrintWriter out = response.getWriter()) {
            request.setAttribute("action", result);
            propertyFacade.create(new Property(owner, java.time.LocalDateTime.now() + "", p_name, p_type, desc, furnishing,
                    r_no, t_no, f_size, location, r_price, s_price, "available"));
            RequestDispatcher dispatcher = request.getRequestDispatcher("Manage_Property");
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
