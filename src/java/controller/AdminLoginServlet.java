package controller;

import dao.AdminDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean status = AdminDAO.login(username, password);

        if (status) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", username);

            response.sendRedirect("dashboard.jsp");
        } else {
            response.getWriter().println("Invalid Username or Password");
        }
    }
}