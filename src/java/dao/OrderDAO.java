package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Order;

public class OrderDAO {

    public static void saveOrder(Order o) {

        try {
            Connection conn = DBConnection.getConnection();

            String sql = "INSERT INTO orders(customer_name, phone, product_name, price, size, status) VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, o.getCustomerName());
            ps.setString(2, o.getPhone());
            ps.setString(3, o.getProductName());
            ps.setDouble(4, o.getPrice());
            ps.setString(5, o.getSize());
            ps.setString(6, "Pending");

            ps.executeUpdate();

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<Order> getAllOrders() {

        List<Order> list = new ArrayList<Order>();

        try {
            Connection conn = DBConnection.getConnection();

            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM orders ORDER BY id DESC");

            while (rs.next()) {

                Order o = new Order();

                o.setId(rs.getInt("id"));
                o.setCustomerName(rs.getString("customer_name"));
                o.setPhone(rs.getString("phone"));
                o.setProductName(rs.getString("product_name"));
                o.setPrice(rs.getDouble("price"));
                o.setSize(rs.getString("size"));
                o.setStatus(rs.getString("status"));

                list.add(o);
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static void updateOrderStatus(int id, String status) {

        try {
            Connection conn = DBConnection.getConnection();

            String sql = "UPDATE orders SET status=? WHERE id=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, status);
            ps.setInt(2, id);

            ps.executeUpdate();

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}