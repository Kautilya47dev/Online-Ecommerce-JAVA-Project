package com.onlineecommerce.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.onlineecommerce.util.DBConnection;

public class Admin {

    private int adminId;
    private String name;
    private String email;
    private String password;

    public Admin() {
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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