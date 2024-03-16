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
@WebServlet(name = "Manage_User", urlPatterns = {"/Manage_User"})
public class Manage_User extends HttpServlet {

    @EJB
    private UserAccFacade userAccFacade;

    @EJB
    private OwnerFacade ownerFacade;

    @EJB
    private CustomerFacade customerFacade;

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
        String role = request.getParameter("role");
        String action = request.getParameter("action");
        String username = request.getParameter("username");
        String search_value = request.getParameter("query");
        HttpSession s = request.getSession(false);
        UserAcc useracc = (UserAcc) s.getAttribute("login");
        try (PrintWriter out = response.getWriter()) {
            if (action.equals("edit_user")) {
                if (role.equals("staff")) {
                    List<Admin> admin = adminFacade.findAll();
                    request.setAttribute("admin_list", admin);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("manage_staff.jsp");
                    dispatcher.forward(request, response);
                } else if (role.equals("owner")) {
                    List<Owner> owner = ownerFacade.findApprove("approved");
                    request.setAttribute("owner_list", owner);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("manage_owner.jsp");
                    dispatcher.forward(request, response);
                } else if (role.equals("owner_pending")) {
                    List<Owner> owner = ownerFacade.findNotApprove("approved");
                    request.setAttribute("owner_list", owner);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("pending_approval.jsp");
                    dispatcher.forward(request, response);
                } else {
                    List<Customer> cus = customerFacade.findAll();
                    request.setAttribute("cus_list", cus);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("manage_customer.jsp");
                    dispatcher.forward(request, response);
                }
            } else if (action.equals("edit_profile")) {
                if (role.equals("staff")) {
                    Admin staff = adminFacade.find(useracc.getId());
                    request.setAttribute("user", staff);
                } else if (role.equals("owner")) {
                    Owner owner = ownerFacade.find(useracc.getId());
                    request.setAttribute("user", owner);
                } else {
                    Customer cus = customerFacade.find(useracc.getId());
                    request.setAttribute("user", cus);
                }
                RequestDispatcher dispatcher = request.getRequestDispatcher("edit_profile.jsp");
                dispatcher.forward(request, response);

            } else if (action.equals("staff_edit")) {
                if (role.equals("staff")) {
                    Admin admin = adminFacade.find(username);
                    request.setAttribute("user", "Staff");
                    request.setAttribute("admin", admin);
                } else if (role.equals("owner")) {
                    Owner owner = ownerFacade.find(username);
                    request.setAttribute("user", "Owner");
                    request.setAttribute("owner", owner);
                } else {
                    Customer cus = customerFacade.find(username);
                    request.setAttribute("user", "Customer");
                    request.setAttribute("cus", cus);
                }
                RequestDispatcher dispatcher = request.getRequestDispatcher("edit_user.jsp");
                dispatcher.forward(request, response);
            } else if (action.equals("cancel")) {
                if (role.equals("staff")) {
                    List<Admin> admin = adminFacade.findAll();
                    request.setAttribute("admin_list", admin);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("manage_staff.jsp");
                    dispatcher.forward(request, response);
                } else if (role.equals("owner")) {
                    List<Owner> owner = ownerFacade.findApprove("approved");
                    request.setAttribute("owner_list", owner);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("manage_owner.jsp");
                    dispatcher.forward(request, response);
                } else {
                    List<Customer> cus = customerFacade.findAll();
                    request.setAttribute("cus_list", cus);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("manage_customer.jsp");
                    dispatcher.forward(request, response);
                }
            } else if (action.equals("update_table")) {
                if (role.equals("staff")) {
                    List<Admin> admin = adminFacade.findByValue(search_value.toLowerCase());
                    request.setAttribute("admin_list", admin);
                    request.setAttribute("input", search_value);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("manage_staff.jsp");
                    dispatcher.forward(request, response);
                } else if (role.equals("owner")) {
                    List<Owner> owner = ownerFacade.findApproveByValue("approved", search_value.toLowerCase());
                    request.setAttribute("owner_list", owner);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("manage_owner.jsp");
                    dispatcher.forward(request, response);
                } else if (role.equals("owner_pending")) {
                    List<Owner> owner = ownerFacade.findNotApproveByValue("approved", search_value.toLowerCase());
                    request.setAttribute("owner_list", owner);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("pending_approval.jsp");
                    dispatcher.forward(request, response);
                } else {
                    List<Customer> cus = customerFacade.findByValue(search_value.toLowerCase());
                    request.setAttribute("cus_list", cus);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("manage_customer.jsp");
                    dispatcher.forward(request, response);
                }
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
