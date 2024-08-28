package com.myown.techblog_project.dao;

import com.myown.techblog_project.entities.User;

import java.sql.*;

public class Userdao {
    private Connection con;
    public Userdao(Connection con) {
        this.con = con;
    }
    // method to insert user data
    public  boolean saveUser(User user){
        boolean f = false;
        try {

            String query = "insert into user(name , email ,password,gender, about) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getEmail());
            pstmt.setString(3,user.getPassword());
            pstmt.setString(4,user.getGender());
            pstmt.setString(5,user.getAbout());

            pstmt.executeUpdate();
            f= true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return f;
    }

    // Get user by useremail and password :
    public User getUserByEmailAndPassword(String email , String password){
        User user = null;
        try{
            String query = "SELECT * FROM user WHERE email=? and password = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1,email);
            pstmt.setString(2,password);

            ResultSet set = pstmt.executeQuery();

            if(set.next()){
                user = new User();
                String name = set.getString("name"); // Data from Database
                user.setName(name); // Set to user object

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDatetime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
        }catch(Exception e ){
            e.printStackTrace();
        }
        return user ;
    }

    public  boolean updateUser(User user){
        boolean f = false;
        try{
            String query = "update user set name= ? , email = ?, password = ? ,gender=?,about = ? , profile = ? where id = ?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2,user.getEmail());
            p.setString(3,user.getPassword());
            p.setString(4,user.getGender());
            p.setString(5,user.getAbout());
            p.setString(6,user.getProfile());
            p.setInt(7,user.getId());

            p.executeUpdate();
            f= true;

        }
        catch (Exception e ){
            e.printStackTrace();
        }
        return f ;
    }

}
