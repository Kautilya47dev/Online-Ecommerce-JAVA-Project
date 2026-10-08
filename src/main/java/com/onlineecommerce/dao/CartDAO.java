package com.onlineecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.onlineecommerce.model.CartItem;
import com.onlineecommerce.model.Product;
import com.onlineecommerce.util.DBConnection;

public class CartDAO {

    public int getCartId(int userId) {

        int cartId = -1;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT cart_id FROM cart WHERE user_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                cartId = rs.getInt("cart_id");

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return cartId;
    }

    public int createCart(int userId) {

        int cartId = -1;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO cart(user_id) VALUES(?)";

            PreparedStatement ps = con.prepareStatement(sql,
                    PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setInt(1, userId);

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();

            if (rs.next()) {

                cartId = rs.getInt(1);

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return cartId;
    }

    public void addToCart(int cartId, int productId) {
        System.out.println("Inside addToCart()");

        try {

            Connection con = DBConnection.getConnection();

            String check = "SELECT quantity FROM cart_items WHERE cart_id=? AND product_id=?";

            PreparedStatement ps = con.prepareStatement(check);

            ps.setInt(1, cartId);
            ps.setInt(2, productId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                int quantity = rs.getInt("quantity") + 1;

                PreparedStatement update = con.prepareStatement(
                        "UPDATE cart_items SET quantity=? WHERE cart_id=? AND product_id=?");

                update.setInt(1, quantity);
                update.setInt(2, cartId);
                update.setInt(3, productId);

                update.executeUpdate();

                update.close();

            } else {

                PreparedStatement insert = con.prepareStatement(
                        "INSERT INTO cart_items(cart_id,product_id,quantity) VALUES(?,?,1)");

                insert.setInt(1, cartId);
                insert.setInt(2, productId);

                insert.executeUpdate();

                insert.close();

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

    public List<CartItem> getCartItems(int cartId) {

        List<CartItem> cart = new ArrayList<>();

        String sql = """
SELECT
ci.cart_item_id,
ci.quantity,
p.product_id,
p.seller_id,
p.product_name,
p.description,
p.price,
p.stock,
p.image
FROM cart_items ci
JOIN products p
ON ci.product_id=p.product_id
WHERE ci.cart_id=?
""";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, cartId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Product product = new Product();

                product.setProductId(rs.getInt("product_id"));
                product.setSellerId(rs.getInt("seller_id"));
                product.setProductName(rs.getString("product_name"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
                product.setStock(rs.getInt("stock"));

                CartItem item = new CartItem();

                item.setProduct(product);
                item.setQuantity(rs.getInt("quantity"));

                cart.add(item);

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return cart;

    }

    public void updateQuantity(int cartId, int productId, int quantity) {

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "UPDATE cart_items SET quantity=? WHERE cart_id=? AND product_id=?");

            ps.setInt(1, quantity);
            ps.setInt(2, cartId);
            ps.setInt(3, productId);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

    public void removeItem(int cartId, int productId) {

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM cart_items WHERE cart_id=? AND product_id=?");

            ps.setInt(1, cartId);
            ps.setInt(2, productId);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

}