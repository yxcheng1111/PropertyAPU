/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    @EJB
    private OwnerFacade ownerFacade;

    @EJB
    private CustomerFacade customerFacade;

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

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String userrole = request.getParameter("userrole");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-M-dd");
        String dob = request.getParameter("dob");
        Date date = null;
        try {
            date = dateFormat.parse(dob);
        } catch (ParseException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }

        String p_validator = "", e_validator = "";

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {

                UserAcc found = userAccFacade.find(username);
                if (found != null) {
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
                Calendar dob1 = Calendar.getInstance();
                dob1.setTime(date);

                Calendar currentDate = Calendar.getInstance();

                int years = currentDate.get(Calendar.YEAR) - dob1.get(Calendar.YEAR);
                if (currentDate.get(Calendar.MONTH) == dob1.get(Calendar.MONTH)) {
                    if (currentDate.get(Calendar.DAY_OF_MONTH) < dob1.get(Calendar.DAY_OF_MONTH)) {
                        years--;
                    }
                }
                if (currentDate.get(Calendar.MONTH) < dob1.get(Calendar.MONTH)) {
                    years--;
                }

                if (e_validator.length() != 0 || p_validator.length() != 0) {
                    request.setAttribute("updateMessage", "The " + e_validator + p_validator + " is invalid, please try again!!");
                    request.getRequestDispatcher("register.jsp").include(request, response);
                } else {
                    if (years < 21) {
                        request.setAttribute("updateMessage", "You must be at least 21 years old to register for an account");
                        request.getRequestDispatcher("register.jsp").include(request, response);
                    } else {
                        if (!phone.contains("-")) {
                            phone = phone.substring(0, 3) + "-" + phone.substring(3, phone.length());
                        }
                        userAccFacade.create(new UserAcc(username, password, userrole, null));
                        if (userrole.equals("owner")) {
                            ownerFacade.create(new Owner(username, name, email, phone, gender, dob, "pending"));
                        } else {
                            customerFacade.create(new Customer(username, name, email, phone, gender, dob));
                        }
                        request.setAttribute("updateMessage", "Registration has been completed successfully!");
                        request.getRequestDispatcher("login.jsp").include(request, response);
                    }
                }

            } catch (Exception e) {
                request.setAttribute("updateMessage", "The username has been use, try another one!!");
                request.getRequestDispatcher("register.jsp").include(request, response);
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
