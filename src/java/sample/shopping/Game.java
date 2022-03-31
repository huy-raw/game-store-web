/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

/**
 *
 * @author HuyRaw
 */
public class Game {
    public String gameID;   
    public String gameName;
    public int price;
    public int quantity;
    public String image;

    public Game() {
    }

    public Game(String gameID, String gameName, int price, int quantity, String image) {
        this.gameID = gameID;
        this.gameName = gameName;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
    }

    public String getGameID() {
        return gameID;
    }

    public void setGameID(String gameID) {
        this.gameID = gameID;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
}
