package com.myown.techblog_project.servlets;

import com.myown.techblog_project.dao.Userdao;
import com.myown.techblog_project.entities.User;
import com.myown.techblog_project.helper.Connection_provider;
//import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
//import java.sql.Connection;

@WebServlet("/RegisterServlet")
@MultipartConfig()
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws  IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

//            fetch all form data
            String check = request.getParameter("check");
            if (check == null) {
                out.println("box not checked");
            } else {
                //baki ka data yaha nikalna..
                String name = request.getParameter("user_name");
                String email = request.getParameter("user_email");
                String password = request.getParameter("user_password");
                String gender = request.getParameter("gender");
                String about = request.getParameter("about");
                //create user object and set all data to that object
                User user = new User(name, email, password, gender, about);

                //create a user daao object..
                Userdao dao = new Userdao(Connection_provider.getConnection());
                if (dao.saveUser(user)) {
//                save..
                    out.println("done");
                } else {
                    out.println("error");
                }
            }

        }
    }
}
