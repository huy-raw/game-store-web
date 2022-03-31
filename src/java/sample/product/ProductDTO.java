/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Date;

/**
 *
 * @author HuyRaw
 */
public class ProductDTO {
    private String productID;
    private String productName;
    private String image;
    private int price;
    private int quantity;
    private String categoryID;
    private Date importDate;

    public ProductDTO() {
    }

    public ProductDTO(String productID, String productName, String image, int price, int quantity, String categoryID, Date importDate) {
        this.productID = productID;
        this.productName = productName;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.importDate = importDate;
    }

    

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String imge) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public Date getImportDate() {
        return importDate;
    }

    public void setImmportDate(Date immportDate) {
        this.importDate = importDate;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "productID=" + productID + ", productName=" + productName + ", image=" + image + ", price=" + price + ", quantity=" + quantity + ", categoryID=" + categoryID + ", immportDate=" + importDate + '}';
    }

    
    
    
    
    
}
