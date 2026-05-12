package controller;

import model.Cart;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        StringBuilder message = new StringBuilder();
        message.append("Hello BBS Klassics,%0A%0A");
        message.append("I want to order the following items:%0A");

        double total = 0;

        for (Cart c : cart) {
            message.append("- ")
                   .append(c.getName())
                   .append(" | ")
                   .append(c.getPrice())
                   .append("%0A");

            try {
                // remove "Ghc" or "GHS" to calculate
                String priceStr = c.getPrice().replaceAll("[^0-9]", "");
                total += Double.parseDouble(priceStr);
            } catch (Exception e) {
                // ignore if parsing fails
            }
        }

        message.append("%0A");
        message.append("Total: Ghc ").append(total).append("%0A%0A");
        message.append("Name: _______%0APhone: _______%0AAddress: _______");

        String encodedMessage = URLEncoder.encode(message.toString(), "UTF-8");

        String whatsappURL = "https://wa.me/233552894940?text=" + encodedMessage;

        response.sendRedirect(whatsappURL);
    }
}