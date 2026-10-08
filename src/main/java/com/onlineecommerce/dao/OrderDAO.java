package com.onlineecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.onlineecommerce.model.CartItem;
import com.onlineecommerce.util.DBConnection;

public class OrderDAO {

    public int placeOrder(int userId, List<CartItem> cartItems) {

        int orderId = -1;

        Connection con = null;

        try {

            con = DBConnection.getConnection();

            con.setAutoCommit(false);

            double total = 0;

            for (CartItem item : cartItems) {
                total += item.getTotalPrice();
            }

            String orderSql =
                    "INSERT INTO orders(user_id,total_amount,status) VALUES(?,?,?)";

            PreparedStatement orderPs =
                    con.prepareStatement(orderSql,
                            java.sql.Statement.RETURN_GENERATED_KEYS);

            orderPs.setInt(1, userId);
            orderPs.setDouble(2, total);
            orderPs.setString(3, "PLACED");

            orderPs.executeUpdate();

            ResultSet rs = orderPs.getGeneratedKeys();

            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            rs.close();
            orderPs.close();

            String itemSql =
                    "INSERT INTO order_items(order_id,product_id,quantity,price) VALUES(?,?,?,?)";

            PreparedStatement itemPs = con.prepareStatement(itemSql);

            for (CartItem item : cartItems) {

                itemPs.setInt(1, orderId);
                itemPs.setInt(2, item.getProduct().getProductId());
                itemPs.setInt(3, item.getQuantity());
                itemPs.setDouble(4, item.getProduct().getPrice());

                itemPs.addBatch();

            }

            itemPs.executeBatch();

            itemPs.close();

            PreparedStatement clearPs = con.prepareStatement(
                    "DELETE FROM cart_items WHERE cart_id=(SELECT cart_id FROM cart WHERE user_id=?)");

            clearPs.setInt(1, userId);

            clearPs.executeUpdate();

            clearPs.close();

            con.commit();

        } catch (Exception e) {

            try {

                if (con != null) {
                    con.rollback();
                }

            } catch (Exception ex) {
                ex.printStackTrace();
            }

            e.printStackTrace();

        } finally {

            try {

                if (con != null) {
                    con.setAutoCommit(true);
                    con.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        return orderId;

    }

}