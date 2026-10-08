package com.onlineecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.onlineecommerce.model.Seller;
import com.onlineecommerce.util.DBConnection;

public class SellerDAO {

    public boolean registerSeller(Seller seller) {

        boolean status = false;

        String sql = "INSERT INTO sellers(name,email,password,phone,business_name,status) VALUES(?,?,?,?,?,?)";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, seller.getName());
            ps.setString(2, seller.getEmail());
            ps.setString(3, seller.getPassword());
            ps.setString(4, seller.getPhone());
            ps.setString(5, seller.getBusinessName());
            ps.setString(6, "PENDING");

            int row = ps.executeUpdate();

            if (row > 0) {
                status = true;
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public Seller loginSeller(String email, String password) {

    Seller seller = null;

    String sql = "SELECT * FROM sellers WHERE email=? AND password=?";

    try {

        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, email);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            seller = new Seller();

            seller.setSellerId(rs.getInt("seller_id"));
            seller.setName(rs.getString("name"));
            seller.setEmail(rs.getString("email"));
            seller.setPhone(rs.getString("phone"));
            seller.setBusinessName(rs.getString("business_name"));
            seller.setStatus(rs.getString("status"));

        }

        rs.close();
        ps.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    return seller;
}
    public List<Seller> getAllSellers() {

    List<Seller> list = new ArrayList<>();

    String sql = "SELECT * FROM sellers";

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

            list.add(seller);

        }

        rs.close();
        ps.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
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

}