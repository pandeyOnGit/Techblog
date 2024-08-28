<%@ page import="com.myown.techblog_project.entities.User" %>
<%@ page import="com.myown.techblog_project.entities.Message" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
    assert user != null;%>
<html>
<head>
    <title>MyProfile</title>
    <%--    CSS--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background {
            clip-path: polygon(20% 0%, 80% 0%, 100% 0, 100% 90%, 63% 94%, 20% 95%, 0 100%, 0 0);
        }

        a {
            color: white;
        }
    </style>
</head>
<body>

<%--  Navbar--%>
<nav class="navbar navbar-expand-lg navbar-Dark primary-background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-binoculars"></span>Techblog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#"><span class="	fa fa-bolt"></span>I am Learning <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-check-square"></span> Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Programming Language</a>
                    <a class="dropdown-item" href="#">Project implementation</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Data Structure</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><span class="fa fa-phone-square"></span>Contact</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle fa-spin"></span>Login</a>
            </li>

        </ul>
        <ul class="navbar-nav mr-right">
            <li class="nav-item">
                <a href="#!" data-toggle="modal" data-target="#profile-modal" class="nav-link"><span
                        class="fa fa-user-circle"></span><%= user.getName()%>
                </a>
            </li>
            <li class="nav-item">
                <a href="LogoutServlet" class="nav-link"><span class=" fa fa-sign-out"></span>Logout</a>
            </li>
        </ul>
    </div>
</nav>
<%-- End Of Navbar --%>


<%
    Message m = (Message) session.getAttribute("msg");
    if (m != null) {
%>
<div class="alert <%= m.getCssClass()%>" role="alert">
    <%=m.getContent()%>
</div>

<%
        session.removeAttribute("msg");
    }
%>


<%--Profile Modal--%>
<!-- Button trigger modal -->

<%--     Profile Details --%>
<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header primary-background text-white">
                <h5 class="modal-title" id="exampleModalLabel"> Tech Blog</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <img src="pics/<%= user.getProfile()%>" class="image-fluid"
                         style="border-radius: 50%; max-width: 80px">
                    <br/>

                    <h5 class="modal-title mt-3" id="exampleModalLabel1"><%= user.getName()%>
                    </h5>
                    <%--                    Tables For the further Details --%>
                    <div id = "profile-details">
                        <table class="table">
                            <tbody>
                            <tr>
                                <th scope="row">ID:</th>
                                <td><%= user.getId()%>
                                </td>

                            </tr>
                            <tr>
                                <th scope="row">Email:</th>
                                <td><%= user.getEmail() %>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Gender :</th>
                                <td><%=user.getGender()%>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">About :</th>
                                <td><%=user.getAbout()%>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Registered On :</th>
                                <td><%=user.getDatetime().toString()%>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <%--                     Profile Edit--%>
                    <div id="profile-edit" style="display: none">
                        <h3 class="mt-2">Please Edit Carefully</h3>
                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <td>ID :</td>
                                    <td><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <td>Email :</td>
                                    <td><input type="email" name="user_email" value="<%= user.getEmail() %>"></td>
                                </tr>
                                <tr>
                                    <td>Name :</td>
                                    <td><input type="text" name="user_name" value="<%= user.getName() %>"></td>
                                </tr>
                                <tr>
                                    <td>Password :</td>
                                    <td><input type="password" name="user_password" value="<%= user.getPassword() %>"></td>
                                </tr>
                                <tr>
                                    <td>Gender :</td>
                                    <td> <%=user.getGender().toUpperCase(java.util.Locale.ROOT)%> </td>
                                </tr>
                                <tr>
                                    <td>About :</td>
                                    <td>
                                        <textarea rows="3" class="form-control" name = "user_about"><%= user.getAbout() %></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Profile pic:</td>
                                    <td>
                                       <input type="file" name="image" class="form-control">
                                    </td>
                                </tr>

                            </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script>
    $(document).ready(()=>
    {
        let editstatus = false ;

        $('#edit-profile-button').click(function () {

            if(editstatus == false){
                $("#profile-details").hide();
                $("#profile-edit").show();
                editstatus = true;
                $(this).text("Back");
            }
            else{
                $("#profile-details").show();
                $("#profile-edit").hide();
                editstatus = false;
                $(this).text("Edit");
            }
        })
    });
</script>
</body>
</html>
