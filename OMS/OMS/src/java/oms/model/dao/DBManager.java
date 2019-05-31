/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.model.dao;

import java.sql.*;
import oms.model.User;

/**
 *
 * @author sadkmalk
 */
public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    //Find student by Email in the database
    public User findUser(String email, String password) throws SQLException {
        //setup the select sql query string
        //execute this query using the statement field
        //add the results to a ResultSet
        //search the ResultSet for a User using the parameters   
        return null;
    }

    //Add a user-data into the database
    public void addUser(String email, String firstName, String lastName, String phone, String password) throws SQLException {        
        if (email != null){
            st.execute("INSERT INTO Users (email, first_name, last_name, phone, password) VALUES('" + email + "','" + firstName + "','" + lastName + "','" + phone + "','" + password + "')" );
        }
    }

    //update a user's details in the database
    public void updateUser(String oldEmail , String email, String phone, String password) throws SQLException {
        String q = "UPDATE Users SET email = '" + email +"', phone = '" + phone + "', password = '" + password + "'";
        q = q + "where email = '" + oldEmail + "'";
        
        st.executeUpdate(q);
    }
    
    //Update or Add Users Shipping
    public void updateShipping(String email, String street, String suburb, String city, String country, String postCode) throws SQLException{
        String q = "UPDATE Users SET street = '" + street +"', suburb = '" + suburb + "', city = '" + city + "', country = '" + country + "', postcode = '" + postCode + "'";
        q = q + "where email = '" + email + "'";
        
        st.executeUpdate(q);
    }
    
    //Update or Add Users Payments
    public void updatePayment(String email, String cardNumber, String cardType, String cardHolderName, String card_cvv) throws SQLException{
        String q = "UPDATE Users SET cardnumber = '" + cardNumber +"', cardtype = '" + cardType + "', cardholdername = '" + cardHolderName + "', card_cvv = '" + card_cvv + "'";
        q = q + "where email = '" + email + "'";
        
        st.executeUpdate(q);
    }
    
    //delete a User from the database
    public void deleteUser(String email) throws SQLException{
        //code for delete-operation
        st.executeUpdate("DELETE FROM users WHERE email = '" + email + "'");
    }
}