package controller;

import dao.OrderDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import model.Order;

public class ViewOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Order> orders = OrderDAO.getAllOrders();

        request.setAttribute("orders", orders);

        RequestDispatcher dispatcher = request.getRequestDispatcher("orders.jsp");
        dispatcher.forward(request, response);
    }
}