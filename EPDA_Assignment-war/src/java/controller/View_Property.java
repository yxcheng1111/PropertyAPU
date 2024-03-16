/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import model.Property;
import model.PropertyFacade;
import model.Sales;
import model.UserAcc;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "View_Property", urlPatterns = {"/View_Property"})
public class View_Property extends HttpServlet {

    @EJB
    private CustomerFacade customerFacade;

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
        String action = request.getParameter("action");
        String add_action = request.getParameter("add_action") == null ? "" : request.getParameter("add_action");
        List<Property> compare_list = (List<Property>) s.getAttribute("compare_list");
        String compare_property = request.getParameter("property");

        String p_type = request.getParameter("p_type") != null ? request.getParameter("p_type") : "";
        String furnishing = request.getParameter("furnishing") != null ? request.getParameter("furnishing") : "";
        int r_no = 0;
        if (request.getParameter("r_no") != null && !request.getParameter("r_no").isEmpty()) {
            try {
                r_no = Integer.parseInt(request.getParameter("r_no"));
            } catch (NumberFormatException e) {

            }
        }
        int t_no = 0;
        if (request.getParameter("t_no") != null && !request.getParameter("t_no").isEmpty()) {
            try {
                t_no = Integer.parseInt(request.getParameter("t_no"));
            } catch (NumberFormatException e) {

            }
        }
        int f_size = 0;
        if (request.getParameter("f_size") != null && !request.getParameter("f_size").isEmpty()) {
            try {
                f_size = Integer.parseInt(request.getParameter("f_size"));
            } catch (NumberFormatException e) {
            }
        }
        String location = request.getParameter("location") != null ? request.getParameter("location") : "";
        int budget = 0;
        if (request.getParameter("budget") != null && !request.getParameter("budget").isEmpty()) {
            try {
                budget = Integer.parseInt(request.getParameter("budget"));
            } catch (NumberFormatException e) {
            }
        }

        request.setAttribute("action", action);

        try (PrintWriter out = response.getWriter()) {

            List<Property> properties = propertyFacade.findProperties(action);
            request.setAttribute("property_list", properties);

            if (add_action.equals("add_compare_list")) {
                Property p = propertyFacade.find(Long.parseLong(compare_property));

                boolean alreadyAdded = false;

                if (compare_list != null) {
                    for (Property item : compare_list) {
                        if (item.equals(p)) {
                            alreadyAdded = true;
                            request.setAttribute("updateMessage", "You cannot compare two same property!");
                            break;
                        }
                    }
                } else {
                    compare_list = new ArrayList<>();
                }

                if (!alreadyAdded) {
                    if (compare_list.size() < 2) { // Check if the list size is less than 2
                        compare_list.add(p);
                        request.setAttribute("updateMessage", "Successfully add the property to the comparison list!");
                        s.setAttribute("compare_list", compare_list);
                    } else {
                        request.setAttribute("updateMessage", "You only can compare two property at a same time!");
                    }
                }
            } else if (add_action.equals("compare_property")) {
                if (compare_list == null || compare_list.isEmpty()) {
                    request.setAttribute("updateMessage", "You don't have property in your list to compare!");
                } else if (compare_list.size() != 2) {
                    request.setAttribute("updateMessage", "You need to add one more property in your list to compare!");
                } else {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("compare_property.jsp");
                    dispatcher.forward(request, response);
                }
            } else if (add_action.equals("clear_compare_list")) {
                s.setAttribute("compare_list", null);
            } else if (add_action.equals("filter_property")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("filter_property.jsp");
                dispatcher.forward(request, response);
            } else if (add_action.equals("filter")) {
                properties = propertyFacade.searchProperties(p_type, location, f_size, r_no, t_no, furnishing, budget, action);
                if (!properties.isEmpty()) {
                    request.setAttribute("property_list", properties);
                } else {
                    request.setAttribute("updateMessage", "Currently do not have a property that match to your filter, please try another filter!");
                }
            } else if (add_action.equals("rent") || add_action.equals("sale")) {
                String confirm_date = request.getParameter("confirm_date");
                Long property_id = Long.parseLong(request.getParameter("property_id"));
                UserAcc useracc = (UserAcc) s.getAttribute("login");
                Customer cus = customerFacade.find(useracc.getId());
                Property property = propertyFacade.find(property_id);
                Owner owner = property.getOwner1();
                property.setSales(new Sales(cus, owner, property, java.time.LocalDate.now() + "", confirm_date, "false", action));
                property.setStatus("on-going");
                propertyFacade.edit(property);
                properties = propertyFacade.findProperties(action);
                request.setAttribute("property_list", properties);
                String message = action.equals("rent") ? action : "buy";
                request.setAttribute("updateMessage", "Successfully " + message + "!");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("view_property.jsp");
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
