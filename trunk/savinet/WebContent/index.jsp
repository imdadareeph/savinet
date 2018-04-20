<%--
    Document   : index
    Created on : Jul 14, 2011, 12:58:45 AM
    Author     : imdadareeph
--%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

    <head>
        <title>HOME</title>


    </head>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <link href="login.css" rel="stylesheet" type="text/css" />
    <link href="shadetable.css" media="screen" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="css/slidestyle.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="css/default.css" type="text/css" media="screen" />

    <body bgcolor="#fffff">
        <div id="main">
            <div class="container">
                <!-- Session check -->
                <c:if test="${sessionScope.SessionId!=null}">
                    <jsp:forward page="home"/>
                </c:if>
                <!-- Session check -->

                <thead>
                    <jsp:include page="header_before.jsp"></jsp:include>
                </thead>
                <tbody align="left">
                    <br>
                    <table class="shade" width="1040" border="0" align="center" bgcolor="white" >


                        <td>
                            <div class="wrapper">
                                <form  id="simple-form" name ="form1" method="POST" action="login">
                                    <label for="input-1">Login</label>
                                    <input type="text" name="uname" size="22" id="input-1">
                                    <label for="input-2">Password</label>
                                    <input type="password" name="pwd" size="22" id="input-2"/>
                                    <input type="submit" value="LOGIN" name="B1" id="submit"><br>
                                    <p style="color: red;">${loginError}</p>
                                    <br><a href="forgot_password.jsp">Forgot Password</a><br>
                                    <br><a href="register">Sign Up</a>
                                </form>
                            </div>
                            <br><br>
                        </td>
                        <td width="700" align="center">

                            <!--   <h3>This part is kept for displaying Sliding images using jQuery
                    <br>Code is not ready yet
                    </h3> -->
                            <div id="wrapper">

                                <div class="slider-wrapper theme-default">

                                    <div id="slider" class="nivoSlider">
                                        <img src="images/toystory.jpg" alt="" />
                                        <a href="home.jsp"><img src="images/up.jpg" alt="" title="welcome to the world of savinet" /></a>
                                        <img src="images/walle.jpg" alt="" />
                                        <img src="images/nemo.jpg" alt="" title="#htmlcaption" />
                                    </div>
                                    <div id="htmlcaption" class="nivo-html-caption">
                                        <strong>Connect with</strong> Savinet <em>now.</em> Register <a href="register.jsp">here</a>.
                                    </div>
                                </div>

                            </div>
                            <script type="text/javascript" src="javascripts/jquery-1.6.1.min.js"></script>
                            <script type="text/javascript" src="javascripts/jquery.nivo.slider.pack.js"></script>
                            <script type="text/javascript">
                                $(window).load(function() {
                                    $('#slider').nivoSlider();
                                });
                            </script>

                        </td>

                    </table>
                </tbody>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>

