package com.myown.techblog_project.servlets;

import com.myown.techblog_project.dao.Userdao;
import com.myown.techblog_project.entities.Message;
import com.myown.techblog_project.entities.User;
import com.myown.techblog_project.helper.Connection_provider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;

//import static jdk.internal.org.jline.utils.Colors.s;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            // Fetch all data
            String email = req.getParameter("user_email");
            String name = req.getParameter("user_name");
            String password = req.getParameter("user_password");
            String about = req.getParameter("user_about");
            Part part = req.getPart("image");
            String imageName = part.getSubmittedFileName();

            // Get the User from the session
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("currentUser");

            if (user != null) {
                user.setEmail(email);
                user.setName(name);
                user.setPassword(password);
                user.setAbout(about);
                String oldFile = user.getProfile();
                user.setProfile(imageName);

                // Update database
                Userdao userDao = new Userdao(Connection_provider.getConnection());
                boolean isUpdated = userDao.updateUser(user);

                if (isUpdated) {
                    String realPath = req.getServletContext().getRealPath("/");
                    Path profilePath = Paths.get(realPath, "pics", user.getProfile());
                    String fullPath = profilePath.toString();

                    // Handle file deletion
                    String realPath1 = req.getServletContext().getRealPath("/");
                    Path profilePath1 = Paths.get(realPath1, "pics", oldFile);
                    String fullPath1 = profilePath1.toString();

                    if (!oldFile.equals("default.png")) {
                        Helper.deleteFile(fullPath1);
                    }

                    // Save new file
                    if (imageName != null && !imageName.isEmpty()) {
                        if (Helper.saveFile(part.getInputStream(), fullPath)) {
                            out.println("Profile Updated");
                            Message msg = new Message("Profile details Updated...", "success", "alert-success");
                            session.setAttribute("msg", msg);
                        } else {
                            out.println("File not saved successfully");
                            Message msg = new Message("File not saved successfully", "error", "alert-danger");
                            session.setAttribute("msg", msg);
                        }
                    } else {
                        out.println("No file selected or file name is empty");
                        Message msg = new Message("No file selected or file name is empty", "error", "alert-danger");
                        session.setAttribute("msg", msg);
                    }

                } else {
                    out.println("Not Updated");
                }
            } else {
                out.println("User session is invalid");
            }

            resp.sendRedirect("profile.jsp");
        } catch (Exception e) {
            e.printStackTrace(); // Log exception details
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred: " + e.getMessage());
        }
    }
}
