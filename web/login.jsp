<%-- 
    Document   : login
    Created on : Apr 23, 2018, 8:56:41 AM
    Author     : Siti Khusnul Azifah
--%>

<%@page import="entities.Usermanagement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Bootstrap -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap-theme.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" />

        <script src="/js/jquery.min.js"></script>
        <script src="/js/jquery.bootstrap-growl.js"></script>
        <script src="/js/bootstrap.js"></script>

        <style>
            body {  background-color: #c7deeb;
                    position: center;
                    top: 0;
                    left: 0;
                    padding-top:70px;
                    word-wrap:break-word;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <center>
                <div class="row">
                    <div class="col-sm-6 col-md-4 col-md-offset-4">
                        <h1 class="text-center login-title" style="font-size: 30px; color: white;"><b>Login  Web Cuti</b></h1>
                        <div class="account-wall">
                            <img class="profile-img" src="img/person.png" style="width:100px; height:100px" alt="" />
                            <form class="form-login" action="userManagementController" method="post">
                                <input class="form-control" type="text" name="txtUsername" value="" id="username" placeholder="Username" required="" autofocus=""/>
                                <input class="form-control" type="password" name="txtPassword" id="password" value="" placeholder="Password" required=""/>
                                <button class="btn btn-lg btn-primary btn-block btn-login" id="btnLogin" type="submit">Login</button><br/><br/>
                                <!--<p>Didn't have account? <a href="/signup">Sign Up</a></p>-->
                            </form>
                        </div>
                    </div>
                </div>
            </center>
        </div>
    </body>
</html>