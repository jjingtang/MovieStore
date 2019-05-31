/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.model.model.dao;

import java.sql.*;
import oms.model.model.User;

/**
 *
 * @author sadkmalk
 */
public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    //Find student by ID in the database
    public User findUser(String ID, String password) throws SQLException {
        //setup the select sql query string
        //execute this query using the statement field
        //add the results to a ResultSet
        //search the ResultSet for a student using the parameters
        
        return null;
    }

    //Add a student-data into the database
    public void addUser(String email, String firstName, String lastName, String phone, String password) throws SQLException {        
        st.execute("INSERT INTO USERS VALUES('" + email + "','" + firstName + "','" + lastName + "','" + phone + "','" + password + "')" );
    }

    //update a student details in the database
    public void updateUser(String ID, String email, String name, String password, String dob, String favcol) throws SQLException {
        
    }
    
    //delete a student from the database
    public void deleteUser(String ID) throws SQLException{
        //code for delete-operation
    }
}