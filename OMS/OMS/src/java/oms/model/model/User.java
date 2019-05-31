/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.model.model;

import java.io.Serializable;

/**
 *
 * @author sadkmalk
 */
public class User implements Serializable {
    
    private String email;
    private String firstName;
    private String lastName;
    private String phone;
    private String password;
    
    public User(String email, String firstName, String lastName, String phone, String password){
        
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.password = password;
        
    }
    
    public User(){}

    public void setPassword(String password) {
        this.password = password;
    }

    public void updateDetails(String email, String phone){
        
        this.email = email;
        this.phone = phone;     
    }

    public String getPassword() {
        return password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public String getEmail() {
        return email;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPhone() {
        return phone;
    }   
    
}
