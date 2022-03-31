/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author HuyRaw
 */
public class Cart {
    public Map<String, Game> cart;

    public Cart() {
    }

    public Cart(Map<String, Game> cart) {
        this.cart = cart;
    }

    public Map<String, Game> getCart() {
        return cart;
    }

    public void setCart(Map<String, Game> cart) {
        this.cart = cart;
    }
    
      public void add(Game game){
        if(this.cart == null){
            this.cart = new HashMap<>();
        }
        if(this.cart.containsKey(game.getGameID())) {
            int currentQuantity = this.cart.get(game.getGameID()).getQuantity();
            game.setQuantity(currentQuantity + game.getQuantity());
        }
        cart.put(game.getGameID(), game);
    }
    
    public void delete(String id) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }

    }
    
    public int getCartAmountGame(){
        int amount = 0;
        for (Game game: this.cart.values()){
            amount+= game.getQuantity();
        }
        return amount;
    }
    
    public double getCartTotalPrice() {
        double total = 0;
        for (Game game : this.cart.values()) {
            total += (game.getPrice()*game.getQuantity());
        }
        return  total;
    }
    
    public void update(Game newGame) {
        if (this.cart==null) return;
        if(this.cart.containsKey(newGame.getGameID())){
            this.cart.replace(newGame.getGameID(), newGame);
        }
    }
}
