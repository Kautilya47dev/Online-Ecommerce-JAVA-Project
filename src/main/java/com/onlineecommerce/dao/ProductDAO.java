package com.onlineecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.onlineecommerce.model.Product;
import com.onlineecommerce.util.DBConnection;

public class ProductDAO {

    public boolean addProduct(Product product) {

        boolean status = false;

        String sql = "INSERT INTO products(seller_id,product_name,description,price,stock,image) VALUES(?,?,?,?,?,?)";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, product.getSellerId());
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getDescription());
            ps.setDouble(4, product.getPrice());
            ps.setInt(5, product.getStock());
            ps.setString(6, product.getImage());

            status = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Product> getProductsBySeller(int sellerId) {

        List<Product> products = new ArrayList<>();

        String sql = "SELECT * FROM products WHERE seller_id=?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, sellerId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Product product = new Product();

                product.setProductId(rs.getInt("product_id"));
                product.setSellerId(rs.getInt("seller_id"));
                product.setProductName(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setStock(rs.getInt("stock"));
                product.setImage(rs.getString("image"));

                products.add(product);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    public boolean updateProduct(Product product) {

        boolean status = false;

        String sql = "UPDATE products SET product_name=?, description=?, price=?, stock=?, image=? WHERE product_id=? AND seller_id=?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getStock());
            ps.setString(5, product.getImage());
            ps.setInt(6, product.getProductId());
            ps.setInt(7, product.getSellerId());

            status = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public boolean deleteProduct(int productId, int sellerId) {

        boolean status = false;

        String sql = "DELETE FROM products WHERE product_id=? AND seller_id=?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, productId);
            ps.setInt(2, sellerId);

            status = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Product> getAllProducts() {

        List<Product> list = new ArrayList<>();

        String sql = """
                SELECT p.*
                FROM products p
                JOIN sellers s
                ON p.seller_id = s.seller_id
                WHERE s.status='APPROVED'
                """;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Product product = new Product();

                product.setProductId(rs.getInt("product_id"));
                product.setSellerId(rs.getInt("seller_id"));
                product.setProductName(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setStock(rs.getInt("stock"));
                product.setImage(rs.getString("image"));

                list.add(product);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Product getProductById(int productId) {

        Product product = null;

        String sql = """
                SELECT p.*, s.name, s.business_name
                FROM products p
                JOIN sellers s
                ON p.seller_id = s.seller_id
                WHERE p.product_id=?
                """;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, productId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                product = new Product();

                product.setProductId(rs.getInt("product_id"));
                product.setSellerId(rs.getInt("seller_id"));
                product.setProductName(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setStock(rs.getInt("stock"));
                product.setImage(rs.getString("image"));

                product.setSellerName(rs.getString("name"));
                product.setBusinessName(rs.getString("business_name"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return product;
    }
}