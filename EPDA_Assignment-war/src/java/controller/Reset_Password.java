/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
@WebServlet(name = "Forgot_Password", urlPatterns = {"/Forgot_Password"})
public class Reset_Password extends HttpServlet {

    @EJB
    private AdminFacade adminFacade;

    @EJB
    private CustomerFacade customerFacade;

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
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        String p_validator = "", e_validator = "";

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {

                UserAcc found = userAccFacade.find(username);
                if (found == null) {
                    throw new Exception();
                }
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
                    request.getRequestDispatcher("forgot_password.jsp").include(request, response);
                } else {
                    if (!phone.contains("-")) {
                        phone = phone.substring(0, 3) + "-" + phone.substring(3, phone.length());
                    }
                    if (found.getRole().equals("owner")) {
                        Owner owner = ownerFacade.find(username);
                        if ((owner.getEmail().equals(email)) && (owner.getPhone().equals(phone))) {
                            found.setPassword("12345");
                            userAccFacade.edit(found);
                            request.setAttribute("updateMessage", "Your password have been reset to 12345!");
                            request.getRequestDispatcher("login.jsp").include(request, response);
                        } else {
                            request.setAttribute("updateMessage", "Incorrect email or phone number!");
                            request.getRequestDispatcher("forgot_password.jsp").include(request, response);
                        }

                    } else if (found.getRole().equals("customer")) {
                        Customer customer = customerFacade.find(username);
                        if ((customer.getEmail().equals(email)) && (customer.getPhone().equals(phone))) {
                            found.setPassword("12345");
                            userAccFacade.edit(found);
                            request.setAttribute("updateMessage", "Your password have been reset to 12345!");
                            request.getRequestDispatcher("login.jsp").include(request, response);
                        } else {
                            request.setAttribute("updateMessage", "Incorrect email or phone number!");
                            request.getRequestDispatcher("forgot_password.jsp").include(request, response);
                        }
                    } else if (found.getRole().equals("staff")) {
                        Admin admin = adminFacade.find(username);
                        if ((admin.getEmail().equals(email)) && (admin.getPhone().equals(phone))) {
                            found.setPassword("12345");
                            userAccFacade.edit(found);
                            request.setAttribute("updateMessage", "Your password have been reset to 12345!");
                            request.getRequestDispatcher("login.jsp").include(request, response);
                        } else {
                            request.setAttribute("updateMessage", "Incorrect email or phone number!");
                            request.getRequestDispatcher("forgot_password.jsp").include(request, response);
                        }
                    } else {
                        request.setAttribute("updateMessage", "You do not have the permission to perform this action!!");
                        request.getRequestDispatcher("forgot_password.jsp").include(request, response);
                    }
                }
            } catch (Exception e) {
                request.setAttribute("updateMessage", "Wrong username, please try again!!");
                request.getRequestDispatcher("forgot_password.jsp").include(request, response);
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
