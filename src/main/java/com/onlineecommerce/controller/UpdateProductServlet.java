package com.onlineecommerce.controller;

import java.io.IOException;

import com.onlineecommerce.dao.ProductDAO;
import com.onlineecommerce.model.Product;
import com.onlineecommerce.model.Seller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/seller/updateProduct")
public class UpdateProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        Seller seller = (Seller) session.getAttribute("loggedSeller");

        if (seller == null) {
            response.sendRedirect("../seller/login.jsp");
            return;
        }

        Product product = new Product();

        product.setProductId(Integer.parseInt(request.getParameter("productId")));
        product.setSellerId(seller.getSellerId());
        product.setProductName(request.getParameter("productName"));
        product.setDescription(request.getParameter("description"));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setStock(Integer.parseInt(request.getParameter("stock")));
        product.setImage(request.getParameter("image"));

        ProductDAO dao = new ProductDAO();

        dao.updateProduct(product);

        response.sendRedirect("../seller/products.jsp");
    }
}