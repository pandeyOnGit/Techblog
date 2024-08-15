<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

<%@include file="normal_navbar.jsp" %>

<main class="primary-background p-5 banner-background text-dark" style="padding-bottom: 50px">
    <div class="container">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header text-center primary-background text-white">
                    <span class="fa fa-user-circle fa-2x"></span><br/>
                    Register Here
                </div>
                <div class="card-body">
                    <form id="reg-form" action="RegisterServlet" method="post">
                        <div class="form-group">
                            <label for="user_name">User Name</label>
                            <input type="text" name="user_name" class="form-control" id="user_name"
                                   aria-describedby="emailHelp" placeholder="Enter username">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="email" name="user_email" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" placeholder="Enter email">
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone
                                else.</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" name="user_password" class="form-control" id="exampleInputPassword1"
                                   placeholder="Password">
                        </div>
                        <div class="form-group">
                            <label for="gender">Select Gender</label>
                            <br/>
                            <input type="radio" id="gender" name="gender" value="male">Male
                            <input type="radio" name="gender" value="female">Female
                        </div>
                        <div class="form-group">
                            <textarea name="about" class="form-control" id="" rows="5"
                                      placeholder="Enter something about yourself"></textarea>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">I agree Terms & Conditions</label>
                        </div>
                        <div class="container text-center"  id="loader" style="display: none;">
                            <span class="	fa fa-refresh fa-spin fa-3x"></span>
                        </div>
                        <br/>
                        <button id="sub-btn" type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
                <div class="card-footer"></div>
            </div>
        </div>
    </div>
</main>

<%--Java Scripts--%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        console.log("loaded....")

        $('#reg-form').on('submit', function (event) {
            event.preventDefault();

            let form = new FormData(this);
            $("#sub-btn").hide();
            $("#loader").show();
            // Send this to register Servlet
            $.ajax({
                url: "RegisterServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR){
                    $("#sub-btn").show();
                    $("#loader").hide();
                    swal("Register Successful.. we are redirecting to login page")
                        .then((value) => {
                            if (value){
                                window.location = "login_page.jsp";
                            }
                        });
               },
                error: function(jqXHR, textStatus, errorThrown) {
                    // console.log(jqXHR)
                    $("#sub-btn").show();
                    $("#loader").hide();
                    swal("something went wrong..try again");
                },
                processData: false,
                contentType: false
            });
        });
    });
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
</body>
</html>
