package com.myown.techblog_project.servlets;

import com.myown.techblog_project.dao.Userdao;
import com.myown.techblog_project.entities.Message;
import com.myown.techblog_project.entities.User;
import com.myown.techblog_project.helper.Connection_provider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // fetch username and password
        PrintWriter out = resp.getWriter();
        String userEmail = req.getParameter("email");
        String userPassword = req.getParameter("password");

        Userdao dao = new Userdao(Connection_provider.getConnection());

        User u = dao.getUserByEmailAndPassword(userEmail,userPassword);

        if(u==null){
            // Login Error
//            out.println("Invalid Details... try again");
            Message msg = new Message("Invalid Details ! try again", "error","alert-danger");
            HttpSession s = req.getSession();
            s.setAttribute("msg", msg);
            resp.sendRedirect("login_page.jsp");
        }else{
            // Login Success
            HttpSession s = req.getSession();
            s.setAttribute("currentUser",u);
            resp.sendRedirect("profile.jsp");
        }

    }
}
