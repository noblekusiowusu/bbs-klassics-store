package controller;

import dao.ProductDAO;
import model.Product;
import model.Cart;
import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ProductDAO dao = new ProductDAO();
        Product p = dao.getProductById(id);

        HttpSession session = request.getSession();
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        Cart c = new Cart();
        c.setId(p.getId());
        c.setName(p.getName());
        c.setPrice(p.getPrice());
        c.setImage(p.getImage());

        cart.add(c);

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }
}