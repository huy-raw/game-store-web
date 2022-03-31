/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.category;

/**
 *
 * @author HuyRaw
 */
public class CategoryDTO {
    private String categoryID;
    private String categoryNamme;

    public CategoryDTO() {
    }

    public CategoryDTO(String categoryID, String categoryNamme) {
        this.categoryID = categoryID;
        this.categoryNamme = categoryNamme;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryNamme() {
        return categoryNamme;
    }

    public void setCategoryNamme(String categoryNamme) {
        this.categoryNamme = categoryNamme;
    }

    @Override
    public String toString() {
        return "CategoryDTO{" + "categoryID=" + categoryID + ", categoryNamme=" + categoryNamme + '}';
    }

    
}
