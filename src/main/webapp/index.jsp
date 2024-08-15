<%@ page import="java.sql.*" %>
<%@ page import="com.myown.durgesh_techblog_project.helper.Connection_provider" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background{
            clip-path: polygon(20% 0%, 80% 0%, 100% 0, 100% 90%, 63% 94%, 20% 95%, 0 100%, 0 0);
        }
    </style>
</head>
<body>
<%--    Navbar--%>
<%@include file="normal_navbar.jsp" %>
<%--<%--%>
<%--    Connection con = Connection_provider.getConnection();--%>
<%--%>--%>

<%--    Banner    --%>
<div class="container-fluid p-0 m-0 banner-background">
    <div class="jumbotron primary-background">
        <div class="container">
            <h3 class="display-3">Welcome to Tech blog</h3>
            <p>Welcome to techical blog , world of technology <br/>
                Programming languages are described in terms of their syntax (form) and semantics (meaning), usually
                defined by a formal language.<br/>
                An implementation of a programming language is required in order to execute programs, namely an
                interpreter or a compiler.
            </p>
            <button class="btn btn-outline-light btn-lg"><span class="fa fa-external-link"></span> Start ! it's Free
            </button>
            <a href="login_page.jsp" class="btn btn-outline-light btn-lg">
                <span class="	fa fa-user-circle fa-spin"></span> Login
            </a>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Java Programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn btn-primary primary-background text-white">Read More.</a>
                </div>
            </div>
        </div> <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Java Programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn btn-primary primary-background text-white">Read More.</a>
                </div>
            </div>
        </div> <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Java Programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn btn-primary primary-background text-white">Read More.</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Java Programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn btn-primary primary-background text-white">Read More.</a>
                </div>
            </div>
        </div> <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Java Programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn btn-primary primary-background text-white">Read More.</a>
                </div>
            </div>
        </div> <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Java Programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn btn-primary primary-background text-white">Read More.</a>
                </div>
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

</body>
</html>