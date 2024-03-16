package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Login Page</title>\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css\">\n");
      out.write("        <style>\n");
      out.write("            section{\n");
      out.write("                display: flex;\n");
      out.write("                justify-content: center;\n");
      out.write("                align-items: center;\n");
      out.write("                min-height: 100vh;\n");
      out.write("                width: 100%;\n");
      out.write("                background: url('image/background.jpg')no-repeat;\n");
      out.write("                background-position: center;\n");
      out.write("                background-size: cover;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-box-login .icon-close{\n");
      out.write("                position: absolute;\n");
      out.write("                top: 0;\n");
      out.write("                right: 0;\n");
      out.write("                width: 45px;\n");
      out.write("                height: 45px;\n");
      out.write("                background: white;\n");
      out.write("                font-size: 2em;\n");
      out.write("                display: flex;\n");
      out.write("                justify-content: center;\n");
      out.write("                align-items: center;\n");
      out.write("                border-bottom-left-radius: 20px;\n");
      out.write("                cursor: pointer;\n");
      out.write("                z-index: 1;\n");
      out.write("            }\n");
      out.write("            .form-box-login{\n");
      out.write("                position: relative;\n");
      out.write("                width: 400px;\n");
      out.write("                height: 450px;\n");
      out.write("                background: transparent;\n");
      out.write("                border: 2px solid rgba(255,255,255,0.5);\n");
      out.write("                border-radius: 20px;\n");
      out.write("                backdrop-filter:blur(15px);\n");
      out.write("                display: flex;\n");
      out.write("                justify-content: center;\n");
      out.write("                align-items: center;\n");
      out.write("                overflow: hidden;\n");
      out.write("                transition: transform .5s ease, height .2s ease;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-value h2{\n");
      out.write("                font-size: 2em;\n");
      out.write("                color: white;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("            .inputbox{\n");
      out.write("                position: relative;\n");
      out.write("                margin: 30px 0;\n");
      out.write("                width: 310px;\n");
      out.write("                border-bottom: 2px solid white;\n");
      out.write("            }\n");
      out.write("            .inputbox label{\n");
      out.write("                position: absolute;\n");
      out.write("                top: 50%;\n");
      out.write("                left: 5px;\n");
      out.write("                transform: translateY(-50%);\n");
      out.write("                color: white;\n");
      out.write("                font-size: 1em;\n");
      out.write("                pointer-events: none;\n");
      out.write("                transition: .5s;\n");
      out.write("            }\n");
      out.write("            input:focus ~ label,\n");
      out.write("            input:valid ~ label{\n");
      out.write("                top: -5px;\n");
      out.write("            }\n");
      out.write("            .inputbox input{\n");
      out.write("                width: 100%;\n");
      out.write("                height: 50px;\n");
      out.write("                background: transparent;\n");
      out.write("                border: none;\n");
      out.write("                outline: none;\n");
      out.write("                font-size: 1em;\n");
      out.write("                padding: 0 35px 0 5px;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("            .inputbox ion-icon{\n");
      out.write("                position: absolute;\n");
      out.write("                right: 8px;\n");
      out.write("                color: white;\n");
      out.write("                font-size: 1.2em;\n");
      out.write("                top: 15px;\n");
      out.write("            }\n");
      out.write("            .forget{\n");
      out.write("                margin: -15px 0 15px;\n");
      out.write("                font-size: .9em;\n");
      out.write("                color: white;\n");
      out.write("                display: flex;\n");
      out.write("                justify-content: space-between;\n");
      out.write("            }\n");
      out.write("            .forget a{\n");
      out.write("                color: white;\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("            .forget a:hover{\n");
      out.write("                text-decoration: underline;\n");
      out.write("            }\n");
      out.write("            button{\n");
      out.write("                width: 100%;\n");
      out.write("                height: 40px;\n");
      out.write("                background: white;\n");
      out.write("                border: none;\n");
      out.write("                outline: none;\n");
      out.write("                cursor: pointer;\n");
      out.write("                font-size: 1em;\n");
      out.write("                font-weight: 600;\n");
      out.write("            }\n");
      out.write("            .register{\n");
      out.write("                font-size: .9em;\n");
      out.write("                color: white;\n");
      out.write("                text-align: center;\n");
      out.write("                margin: 25px 0 10px;\n");
      out.write("            }\n");
      out.write("            .register p a{\n");
      out.write("                text-decoration: none;\n");
      out.write("                color: white;\n");
      out.write("                font-weight: 600;\n");
      out.write("            }\n");
      out.write("            .register p a:hover{\n");
      out.write("                text-decoration: underline;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <script>\n");
      out.write("            window.onload = function () {\n");
      out.write("                var message = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${updateMessage}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\";\n");
      out.write("                if (message) {\n");
      out.write("                    alert(message);\n");
      out.write("                }\n");
      out.write("            };\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "login_header.jsp", out, false);
      out.write("\n");
      out.write("        <section>\n");
      out.write("            <div class=\"form-box-login\">\n");
      out.write("                <span class=\"icon-close\">\n");
      out.write("                    <ion-icon name=\"close\"></ion-icon>\n");
      out.write("                </span>\n");
      out.write("                <div class=\"form-value\">\n");
      out.write("                    <form action=\"Login\" method=\"POST\">\n");
      out.write("                        <h2>Login</h2>\n");
      out.write("                        <div class=\"inputbox\">\n");
      out.write("                            <ion-icon name=\"person-outline\"></ion-icon>\n");
      out.write("                            <input type=\"text\" required name=\"username\" size=\"20\" autocomplete=\"off\">\n");
      out.write("                            <label for=\"\">Username</label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"inputbox\">\n");
      out.write("                            <ion-icon name=\"lock-closed-outline\"></ion-icon>\n");
      out.write("                            <input type=\"password\" required name=\"password\" size=\"20\" autocomplete=\"off\" id=\"password\">\n");
      out.write("                            <label for=\"passwordInput\">Password</label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"forget\">\n");
      out.write("                            <div class=\"col\">\n");
      out.write("                                <input type=\"checkbox\" name=\"checkbox\" id=\"showPasswordCheckbox\" onclick=\"showPassword()\">\n");
      out.write("                                <label for=\"showPasswordCheckbox\">Show Password</label>\n");
      out.write("                            </div>\n");
      out.write("                            <div>\n");
      out.write("                                <a href=\"forgot_password.jsp\">Forgot Password?</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <script>\n");
      out.write("                            function showPassword() {\n");
      out.write("                                var password = document.getElementById('password');\n");
      out.write("                                if (password.type === 'password') {\n");
      out.write("                                    password.type = 'text';\n");
      out.write("                                } else {\n");
      out.write("                                    password.type = 'password';\n");
      out.write("                                }\n");
      out.write("                            }\n");
      out.write("                        </script>\n");
      out.write("                        <button type=\"submit\" style=\"border-radius: 10px;\">Login</button>\n");
      out.write("                        <div class=\"register\">\n");
      out.write("                            <p>Don't have a account? <a href=\"register.jsp\">Sign Up</a></p>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("        <script type=\"module\" src=\"https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js\"></script>\n");
      out.write("        <script nomodule src=\"https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js\" integrity=\"sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa\" crossorigin=\"anonymous\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
