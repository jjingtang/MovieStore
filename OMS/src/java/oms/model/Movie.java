/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.model;

import java.io.Serializable;

/**
 *
 * @author sadkmalk
 */
public class Movie implements Serializable {
    
    private String name;
    private String genre;
    private int price;
    
    public Movie(String name, String g, int price){
        
        this.name = name;
        this.genre = g;
        this.price = price;
        
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public String getGenre() {
        return genre;
    }

    public int getPrice() {
        return price;
    }
    
    
    
}
