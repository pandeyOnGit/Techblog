package com.myown.durgesh_techblog_project.helper;

import java.sql.*;
public class Connection_provider {
    private static Connection con;
    String url = "jdbc:mysql://localhost:3306/techblog";
    String user = "root";
    String Pass = "Pandey@0871";
    public static Connection getConnection(){
        String url = "jdbc:mysql://localhost:3306/techblog";
        String user = "root";
        String Pass = "Pandey@0871";
        try{
            if(con == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, user, Pass);
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }

        return con;
    }
}
