package com.onlineecommerce.model;

public class Product {

    private int productId;
    private int sellerId;
    private String productName;
    private String description;
    private double price;
    private int stock;
    private String image;
    private String sellerName;

private String businessName;

    public Product() {

    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    public String getSellerName() {
    return sellerName;
}

public void setSellerName(String sellerName) {
    this.sellerName = sellerName;
}

public String getBusinessName() {
    return businessName;
}

public void setBusinessName(String businessName) {
    this.businessName = businessName;
}

}