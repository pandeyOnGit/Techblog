package com.myown.durgesh_techblog_project.servlets;

import com.myown.durgesh_techblog_project.dao.Userdao;
import com.myown.durgesh_techblog_project.entities.User;
import com.myown.durgesh_techblog_project.helper.Connection_provider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/RegisterServlet")
@MultipartConfig()
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String check = request.getParameter("check");
            if (check == null) {
                out.println("box not checked");
            } else {
                String name = request.getParameter("user_name");
                String email = request.getParameter("user_email");
                String password = request.getParameter("user_password");
                String gender = request.getParameter("gender");
                String about = request.getParameter("about");
                // Creating a user Object
                User user =  new User(name, email, password, gender, about);
                // Create a user dao object
                Userdao dao = new Userdao(Connection_provider.getConnection());

               if( dao.saveUser(user)){
                   // saved ...
                   out.println("done....");
               }
               else{
                   out.println("error");
               }
            }

        }
    }
}