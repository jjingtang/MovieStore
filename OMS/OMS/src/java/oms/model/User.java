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
public class User implements Serializable {
    
    private String email;
    private String firstName;
    private String lastName;
    private String phone;
    private String password;
    
    private boolean paymentAdded = false;   
    private String cardType;
    private String cardNumber;
    private String cardholderName;
    private String cardCvv;
    
    private boolean shippingAdded = false;
    private String street;
    private String suburb;
    private String city;
    private String country;
    private String postCode;

    public boolean isShippingAdded() {
        return shippingAdded;
    }

    public void setShippingAdded(boolean shippingAdded) {
        this.shippingAdded = shippingAdded;
    }
    
    public void updateShipping(String street, String suburb, String city, String country, String postCode){
           if(street != null && street.length() > 0){
            this.street = street;
        }
        if (suburb != null && suburb.length() > 0){
            this.suburb = suburb;
        }
        if(city != null && city.length() > 0){
            this.city = city;
        }
        if (country != null && country.length() > 0){
            this.country = country;
        }
        if (postCode != null && postCode.length() > 0){
            this.postCode = postCode;
        }
        
        shippingAdded = true;
    }
    
    public String getStreet() {
        return street;
    }

    public String getSuburb() {
        return suburb;
    }

    public String getCity() {
        return city;
    }

    public String getCountry() {
        return country;
    }

    public String getPostCode() {
        return postCode;
    }
    
    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCardCvv() {
        return cardCvv;
    }

    public void setPaymentAdded(boolean paymentAdded) {
        this.paymentAdded = paymentAdded;
    }

    public void setCardholderName(String cardholderName) {
        this.cardholderName = cardholderName;
    }

    public boolean isPaymentAdded() {
        return paymentAdded;
    }
    
    public User(String email, String firstName, String lastName, String phone, String password){
        
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.password = password;
        
    }
    
    public boolean confirmPassword(String p, String cp){
            return cp.equals(p);
    }
    
    public void updatePayment(String type, String number, String cardHolder, String card_Cvv){
        
        if(number != null && number.length() > 0){
            this.cardNumber = number;
        }
        if (type != null && type.length() > 0){
            this.cardType = type;
        }
        if(cardHolder != null && cardHolder.length() > 0){
            this.cardholderName = cardHolder;
        }
        if (card_Cvv != null && card_Cvv.length() > 0){
            this.cardCvv = card_Cvv;
        }
        
        paymentAdded = true;
    }

    public String getCardType() {
        return cardType;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public String getCardholderName() {
        return cardholderName;
    }
    
    public User(){}

    //Returns password as ------
    public String printHiddenPass(){
        String s = "";
        int length = password.length();
        
        while (length > 0) {
            s += "- ";
            length--;
        }
          
        return s;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public void updateDetails(String email, String phone, String password){
        
        if(email != null){
            this.email = email;
        }
        if(phone != null && phone.length() > 0){
            this.phone = phone;
        }
        if(password != null && password.length() > 0){
            this.password = password;
        }
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
