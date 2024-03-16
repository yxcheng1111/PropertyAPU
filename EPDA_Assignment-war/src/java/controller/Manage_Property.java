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
import model.UserAcc;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "Manage_Property", urlPatterns = {"/Manage_Property"})
public class Manage_Property extends HttpServlet {

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
        
        String query = request.getParameter("query");
        String action = request.getParameter("action");
        HttpSession s = request.getSession(false);
        UserAcc useracc = (UserAcc) s.getAttribute("login");
        try (PrintWriter out = response.getWriter()) {

            if (action.equals("rent")) {
                List<Property> properties = propertyFacade.findPropertiesForRentByOwner(useracc.getId());
                request.setAttribute("property_list", properties);
                request.setAttribute("action", "rent");
                
            } else if(action.equals("sale")){
                List<Property> properties = propertyFacade.findPropertiesForSaleByOwner(useracc.getId());
                request.setAttribute("property_list", properties);
                request.setAttribute("action", "sale");
                
            } else if(action.equals("update_table_sale")){
                List<Property> properties = propertyFacade.findPropertiesForSaleByOwnerWithValue(useracc.getId(), query.toLowerCase());
                request.setAttribute("property_list", properties);
                request.setAttribute("action", "sale");
                
            }else if(action.equals("update_table_rent")){
                List<Property> properties = propertyFacade.findPropertiesForRentByOwnerWithValue(useracc.getId(), query.toLowerCase());;
                request.setAttribute("property_list", properties);
                request.setAttribute("action", "rent");
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("manage_property.jsp");
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
