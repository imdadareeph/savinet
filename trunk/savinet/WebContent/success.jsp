<%--
    Document   : success
    Created on : Jul 3, 2011, 12:10:53 PM
    Author     : soorej
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <link href="shadetable.css" rel="stylesheet" type="text/css" />
    <body>
        <div id="main">
            <div class="container">
                <thead>
                    <jsp:include page="header_after.jsp"></jsp:include>
                </thead>
                <br>
                <table class="shade" width="1040" border="0" align="center" bgcolor="white" >
                    <tr>
                        <td>
                            <h1><center>Registered Successfull !</center></h1><br>
                            <center><h3><a href ="index.jsp" />GO BACK TO LOGIN</h3></center>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
