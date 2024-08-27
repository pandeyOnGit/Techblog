<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register Page</title>
    <!-- CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background {
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
        }
    </style>
</head>
<body>

<%@include file="normal_navbar.jsp" %>

<main class="primary-background banner-background" style="padding-bottom: 80px;">

    <div class="container">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header text-center primary-background text-white">
                    <span class="fa fa-3x fa-user-circle"></span>
                    <br>
                    Register here
                </div>
                <div class="card-body">
                    <form id="reg-form" action="RegisterServlet" method="POST">

                        <div class="form-group">
                            <label for="user_name">User Name</label>
                            <input name="user_name" type="text" class="form-control" id="user_name" placeholder="Enter name">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                        </div>

                        <div class="form-group">
                            <label>Select Gender</label>
                            <br>
                            <input type="radio" id="genderMale" name="gender" value="Male"> Male
                            <input type="radio" id="genderFemale" name="gender" value="Female"> Female
                        </div>

                        <div class="form-group">
                            <textarea name="about" class="form-control" rows="5" placeholder="Enter something about yourself"></textarea>
                        </div>

                        <div class="form-check">
                            <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Agree to terms and conditions</label>
                        </div>

                        <br>

                        <div class="container text-center" id="loader" style="display: none;">
                            <span class="fa fa-refresh fa-spin fa-4x"></span>
                            <h4>Please wait.</h4>
                        </div>

                        <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</main>

<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
    $(document).ready(function () {
        $('#reg-form').on('submit', function (event) {
            event.preventDefault();

            let form = new FormData(this);

            $("#submit-btn").hide();
            $("#loader").show();

            $.ajax({
                url: "RegisterServlet",
                type: 'POST',
                data: form,
                success: function (data) {
                    $("#submit-btn").show();
                    $("#loader").hide();

                    if (data.trim() === 'done') {
                        swal("Registered successfully. We are going to redirect to the login page")
                            .then(() => {
                                window.location = "login_page.jsp";
                            });
                    } else {
                        swal(data);
                    }
                },
                error: function () {
                    $("#submit-btn").show();
                    $("#loader").hide();
                    swal("Something went wrong. Please try again.");
                },
                processData: false,
                contentType: false
            });
        });
    });
</script>

</body>
</html>
