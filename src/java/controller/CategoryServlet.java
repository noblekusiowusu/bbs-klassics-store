package controller;

import dao.ProductDAO;
import model.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/category")
public class CategoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String category = request.getParameter("type");

        ProductDAO dao = new ProductDAO();
        List<Product> products = dao.getProductsByCategory(category);

        request.setAttribute("products", products);
        RequestDispatcher rd = request.getRequestDispatcher("shop.jsp");
        rd.forward(request, response);
    }
}