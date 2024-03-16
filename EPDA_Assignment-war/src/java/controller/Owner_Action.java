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
@WebServlet(name = "Owner_Action", urlPatterns = {"/Owner_Action"})
public class Owner_Action extends HttpServlet {

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

        String action = request.getParameter("action");
        Long id = Long.parseLong(request.getParameter("id"));
        String table = request.getParameter("table");
        HttpSession s = request.getSession(false);
        UserAcc useracc = (UserAcc) s.getAttribute("login");

        try (PrintWriter out = response.getWriter()) {
            if (action.equals("delete_property")) {
                if (table.equals("sale")) {
                    Property property = propertyFacade.find(id);
                    propertyFacade.remove(property);
                    request.setAttribute("action", table);
                } else {
                    Property property = propertyFacade.find(id);
                    propertyFacade.remove(property);
                    request.setAttribute("action", table);
                }
                request.setAttribute("updateMessage", "Delete property successfully!");
            } else if (action.equals("edit_property")) {
                Property property = propertyFacade.find(id);
                request.setAttribute("property_d", property);
                request.setAttribute("action", table);
                RequestDispatcher dispatcher = request.getRequestDispatcher("edit_property.jsp");
                dispatcher.forward(request, response);
            } else if (action.equals("edit")) {
                String p_name = request.getParameter("p_name");
                String p_type = request.getParameter("p_type");
                String furnishing = request.getParameter("furnishing");
                String r_no = request.getParameter("r_no");
                String t_no = request.getParameter("t_no");
                String f_size = request.getParameter("f_size");
                String location = request.getParameter("location");
                String r_price = request.getParameter("r_price");
                r_price = (r_price.length() == 0) ? "0" : r_price;
                String s_price = request.getParameter("s_price");
                s_price = (s_price.length() == 0) ? "0" : s_price;
                String desc = request.getParameter("desc");

                Property property = propertyFacade.find(id);
                property.setProperty_name(p_name);
                property.setProperty_type(p_type);
                property.setFurnishing(furnishing);
                property.setRoom_no(r_no);
                property.setToilet_no(t_no);
                property.setFloor_size(f_size);
                property.setLocation(location);
                property.setRent_price(r_price);
                property.setSale_price(s_price);
                property.setDescription(desc);

                propertyFacade.edit(property);
                request.setAttribute("updateMessage", "Update property details successfully!");
            }
            if (table.equals("rent")) {
                List<Property> properties = propertyFacade.findPropertiesForRentByOwner(useracc.getId());
                request.setAttribute("property_list", properties);
                request.setAttribute("action", "rent");

            } else if (table.equals("sale")) {
                List<Property> properties = propertyFacade.findPropertiesForSaleByOwner(useracc.getId());
                request.setAttribute("property_list", properties);
                request.setAttribute("action", "sale");
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
