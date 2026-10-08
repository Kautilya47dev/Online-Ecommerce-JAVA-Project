package com.onlineecommerce.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectionTest {

    public static void main(String[] args) {

        try {
            Connection con = DBConnection.getConnection();

            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT DATABASE()");

            if (rs.next()) {
                System.out.println("Connected Database : " + rs.getString(1));
            }

            System.out.println("Database Connected Successfully");

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}