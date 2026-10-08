package com.onlineecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.onlineecommerce.model.Admin;
import com.onlineecommerce.model.Seller;
import com.onlineecommerce.model.User;
import com.onlineecommerce.util.DBConnection;

public class AdminDAO {

    public Admin loginAdmin(String email, String password) {

        Admin admin = null;

        String sql = "SELECT * FROM admins WHERE email=? AND password=?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                admin = new Admin();

                admin.setAdminId(rs.getInt("admin_id"));
                admin.setName(rs.getString("name"));
                admin.setEmail(rs.getString("email"));
                admin.setPassword(rs.getString("password"));

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }

    public List<Seller> getAllSellers() {

        List<Seller> sellers = new ArrayList<>();

        String sql = "SELECT * FROM sellers ORDER BY seller_id";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Seller seller = new Seller();

                seller.setSellerId(rs.getInt("seller_id"));
                seller.setName(rs.getString("name"));
                seller.setEmail(rs.getString("email"));
                seller.setPhone(rs.getString("phone"));
                seller.setBusinessName(rs.getString("business_name"));
                seller.setStatus(rs.getString("status"));

                sellers.add(seller);

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return sellers;
    }

    public boolean updateSellerStatus(int sellerId, String status) {

        boolean success = false;

        String sql = "UPDATE sellers SET status=? WHERE seller_id=?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setInt(2, sellerId);

            success = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public List<User> getAllUsers() {

        List<User> users = new ArrayList<>();

        String sql = "SELECT * FROM users ORDER BY user_id";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                User user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));

                users.add(user);

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }
    public boolean deleteSeller(int sellerId) {

    boolean success = false;

    String sql = "DELETE FROM sellers WHERE seller_id=?";

    try {

        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, sellerId);

        success = ps.executeUpdate() > 0;

        ps.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    return success;
}

}