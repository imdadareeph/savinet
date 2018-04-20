<%-- 
    Document   : mail
    Created on : Jul 31, 2011, 8:51:35 PM
    Author     : imdadareeph
--%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <link href="shadetable.css" rel="stylesheet" type="text/css" />
    <head>
        <title>gallery</title>
    </head>

    <body bgcolor="#ffffff">
        <div id="main">
            <div class="container">
                <thead>
                    <%@include file="header_after.jsp"%>
                </thead>
                <!-- Session check -->
                <c:if test="${sessionScope.SessionId==null}">
                    <jsp:forward page="login_warning.jsp"/>
                </c:if>
                <!-- Session check -->

                <br>
                <table class="shade" border="0" cellpadding="0" cellspacing="0" width="1040" height="400" bgcolor="white" align="center"  >
                    <tr>
                        <td>
                            <center> GALLERY PAGE NOT READY YET</center>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
