package dao;

import java.sql.*;
import java.util.*;
import model.Product;

public class ProductDAO {

    public List<Product> getProductsByCategory(String category) {
        List<Product> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String query = "SELECT * FROM products WHERE category=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, category);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setCategory(rs.getString("category"));
                p.setPrice(rs.getString("price"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Product getProductById(int id) {
        Product p = null;

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM products WHERE id=?");
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setCategory(rs.getString("category"));
                p.setPrice(rs.getString("price"));
                p.setImage(rs.getString("image"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }
}