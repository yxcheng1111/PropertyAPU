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
@WebServlet(name = "Edit_Profile", urlPatterns = {"/Edit_Profile"})
public class Profile_Update extends HttpServlet {

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
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String p_validator = "", e_validator = "";

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
                String phonePattern = "^(01\\d{1}-\\d{7}|01\\d{1}-\\d{8}|01\\d{8}|01\\d{9})$";
                if (!email.matches(emailRegex)) {
                    e_validator = "email address";
                }

                if (!phone.matches(phonePattern)) {
                    if (e_validator.length() == 0) {
                        p_validator = "phone number";
                    } else {
                        p_validator = " and phone number";
                    }
                }

                if (e_validator.length() != 0 || p_validator.length() != 0) {
                    request.setAttribute("updateMessage", "The " + e_validator + p_validator + " is invalid, please try again!!");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("Manage_User?role=" + role + "&action=edit_profile");
                    dispatcher.forward(request, response);
                } else {

                    if (!phone.contains("-")) {
                        phone = phone.substring(0, 3) + "-" + phone.substring(3, phone.length());
                    }
                    UserAcc acc = userAccFacade.find(username);
                    if (role.equals("staff")) {
                        Admin admin = adminFacade.find(username);
                        admin.setDob(dob);
                        admin.setName(name);
                        admin.setGender(gender);
                        admin.setEmail(email);
                        admin.setPhone(phone);
                        adminFacade.edit(admin);
                        acc.setPassword(password);
                        userAccFacade.edit(acc);
                    } else if (role.equals("owner")) {
                        Owner owner = ownerFacade.find(username);
                        owner.setDob(dob);
                        owner.setName(name);
                        owner.setGender(gender);
                        owner.setEmail(email);
                        owner.setPhone(phone);
                        ownerFacade.edit(owner);
                        acc.setPassword(password);
                        userAccFacade.edit(acc);
                    } else {
                        Customer cus = customerFacade.find(username);
                        cus.setDob(dob);
                        cus.setName(name);
                        cus.setGender(gender);
                        cus.setEmail(email);
                        cus.setPhone(phone);
                        customerFacade.edit(cus);
                        acc.setPassword(password);
                        userAccFacade.edit(acc);

                    }
                    HttpSession s = request.getSession(false);
                    s.setAttribute("login", acc);
                    request.setAttribute("updateMessage", "Update profile successfully!");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("Manage_User?role=" + role + "&action=edit_profile");
                    dispatcher.forward(request, response);

                }
            } catch (Exception e) {
                request.setAttribute("updateMessage", "Update profile not successfully, please try again!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("Manage_User?role=" + role + "&action=edit_profile");
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
