<%-- 
    Document   : login_warning
    Created on : Jul 18, 2011, 7:51:49 AM
    Author     : imdadareeph
--%>

<html>

    <head>
        <title>Only registered customers can use this service</title>
    </head>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <link href="shadetable.css" media="screen" rel="stylesheet" type="text/css" />
    <body>
        <div id="main">
    	<div class="container">
        <%  String sessId = (String) session.getAttribute("SessionId");
        if (sessId != null) {%>
        <jsp:forward page="home.jsp"/>
        <%        }
        %>
        <%@include  file="header_before.jsp"%>
        <form method="POST" action="login">
            <br>
        <table class="shade" border="0" cellpadding="60" cellspacing="0" width="1040"  align="center">
        <tr><td>
            <div align="center">
                <center>
                    <table class="shade" border="0" cellpadding="2" cellspacing="5" width="51%" style="background-color: #fff" align="center">
                        <br>
                        <tr>
                            <td width="100%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="index.jsp">
                                    <img border="0" src="pictures/home3.gif" width="88" height="27">
                                </a>
                                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <b>Only registered customers can use this service!!!!</b></p>
                                <p>&nbsp;<b> If you are not registered please signup to use
                                our services.<a href="register">Sign Up</a></b></p>
                                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>
                                        If you are already a
                                registered customer please login</b></p>
                                <div align="center">
                                    <table border="0" cellpadding="2" cellspacing="5" width="74%">
                                        <tr>
                                            <td width="100%">User ID<b>&nbsp;</b>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="uname" size="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <p>Password&nbsp;&nbsp; <input type="password" name="pwd" size="22"></p>
                                                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="submit" value="LOGIN" name="B1" style="background-color: #6699FF; color: #FFFFFF; border-style: ridge; padding-top: .3em; padding-bottom:.3em">

                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </center>
            </div>
            <pre>


            </pre>
            </td>
            </tr>
            </table>
        </form>
        </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>

</html>
