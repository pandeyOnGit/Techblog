<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 15-08-2024
  Time: 00:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isErrorPage="true" %>
<html>
<head>
    <title>Sorry! something went wrong... </title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background {
            clip-path: polygon(20% 0%, 80% 0%, 100% 0, 100% 90%, 63% 94%, 20% 95%, 0 100%, 0 0);
        }
    </style>
</head>
<body>
    <div class="container text-center">
        <img src="img/error1.png" class="img-fluid">
        <h3 class="display-3">Sorry! Something went wrong...</h3>
        <a href="index.jsp" class="btn primary-background btn-lg  text-white mt-3">Home</a>
    </div>
</body>
</html>
