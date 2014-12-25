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
        <title>failure Page</title>
    </head>
    <body>
        <%@include  file="header_before.jsp"%>
        <h1><center><%= request.getAttribute("error") %>Registered Failed !</center></h1><br>
        <center><h3><a href ="Registration.jsp" />GO BACK</h3></center>

    </body>
</html>
