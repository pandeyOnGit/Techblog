<%@ page import="com.myown.techblog_project.entities.Message" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 08-08-2024
  Time: 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<%--    navbar--%>
<%@include file="normal_navbar.jsp" %>


<main class="d-flex align-items-center primary-background text-dark banner-background" style="height: 80vh">
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-4">
                <div class="card">
                    <div class="card-header primary-background text-white text-center">
                        <span class="fa fa-user-plus fa-2x"></span>
                        <p>Login Here</p>
                    </div>
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
                    <div class="card-body">
                        <form action="LoginServlet" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" name="email" required class="form-control" id="exampleInputEmail1"
                                       aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with
                                    anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" name="password" required class="form-control"
                                       id="exampleInputPassword1"
                                       placeholder="Password">
                            </div>
                            <%--                            <div class="form-check">--%>
                            <%--                                <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
                            <%--                                <label class="form-check-label" for="exampleCheck1">Remember me</label>--%>
                            <%--                            </div>--%>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>
                        </form>
                    </div>

                </div>

            </div>

        </div>

    </div>
</main>


<%--    Java Scripts--%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
