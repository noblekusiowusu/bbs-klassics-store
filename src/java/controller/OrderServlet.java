package controller;

import dao.OrderDAO;
import java.io.IOException;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import model.Order;

public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerName = request.getParameter("name");
        String phone = request.getParameter("phone");
        String productName = request.getParameter("product");
        double price = Double.parseDouble(request.getParameter("price"));
        String size = request.getParameter("size");

        Order o = new Order();
        o.setCustomerName(customerName);
        o.setPhone(phone);
        o.setProductName(productName);
        o.setPrice(price);
        o.setSize(size);

        OrderDAO.saveOrder(o);

        String message = "Hello BBS KLASSICS, I want to order:\n"
                + "Name: " + customerName + "\n"
                + "Phone: " + phone + "\n"
                + "Product: " + productName + "\n"
                + "Price: GHS " + price + "\n"
                + "Size: " + size;

        String whatsappLink = "https://wa.me/233552894940?text="
                + URLEncoder.encode(message, "UTF-8");

        response.sendRedirect(whatsappLink);
    }
}