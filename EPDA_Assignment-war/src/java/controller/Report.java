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
import model.Customer;
import model.CustomerFacade;
import model.Owner;
import model.OwnerFacade;
import model.PropertyFacade;
import model.Sales;
import model.SalesFacade;
import model.UserAcc;
import model.UserAccFacade;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "Report", urlPatterns = {"/Report"})
public class Report extends HttpServlet {

    @EJB
    private SalesFacade salesFacade;

    @EJB
    private UserAccFacade userAccFacade;

    @EJB
    private PropertyFacade propertyFacade;

    @EJB
    private OwnerFacade ownerFacade;

    @EJB
    private CustomerFacade customerFacade;
    
    

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
        try (PrintWriter out = response.getWriter()) {
            if (action.equals("gender")) {
                List<Owner> male_owner = ownerFacade.findOwnerByGender("male");
                List<Owner> female_owner = ownerFacade.findOwnerByGender("female");
                List<Customer> male_cus = customerFacade.findCustomerByGender("male");
                List<Customer> female_cus = customerFacade.findCustomerByGender("female");
                request.setAttribute("male_owner", male_owner);
                request.setAttribute("female_owner", female_owner);
                request.setAttribute("male_cus", male_cus);
                request.setAttribute("female_cus", female_cus);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("gender_report.jsp");
                dispatcher.forward(request, response);
            } else if (action.equals("age")) {
                List<Integer> owner_age = ownerFacade.getOwnerAges();
                List<Integer> cus_age = customerFacade.getCustomerAges();
                List<Integer> combined_age = new ArrayList<>(owner_age);
                combined_age.addAll(cus_age);

                request.setAttribute("owner_age", owner_age);
                request.setAttribute("cus_age", cus_age);
                request.setAttribute("combined_age", combined_age);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("age_report.jsp");
                dispatcher.forward(request, response);
            }
            else if (action.equals("location")) {
                List<String> location = propertyFacade.getAllPropertyLocation();
                request.setAttribute("location", location);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("location_report.jsp");
                dispatcher.forward(request, response);
            }else if (action.equals("login")) {
                List<UserAcc> cus_login = userAccFacade.getUsersLoggedInWithin24Hours("customer");
                List<UserAcc> own_login = userAccFacade.getUsersLoggedInWithin24Hours("owner");
                request.setAttribute("cus_login", cus_login);
                request.setAttribute("own_login", own_login);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("login_report.jsp");
                dispatcher.forward(request, response);
            }else if (action.equals("sale")) {
                List<Sales> sale = salesFacade.findAll();
                request.setAttribute("sale", sale);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("sale_report.jsp");
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
