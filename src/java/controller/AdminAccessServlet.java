package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AdminAccessServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("login.jsp");
    }
}