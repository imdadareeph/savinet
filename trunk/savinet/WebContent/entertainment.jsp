<%-- 
    Document   : entertainmen
    Created on : Aug 2, 2011, 4:08:39 AM
    Author     : imdadareeph
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession;" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <link href="shadetable.css" rel="stylesheet" type="text/css" />
    <head>
        <title>entertainment</title>
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
                <table class="shade" border="0" cellpadding="0" cellspacing="0" width="1040" height="400" bgcolor="white" align="center" style="background-color:#a4b9c8" >
                  <!--  <caption>
                        <h3>LISTEN TO AMBIENT MUSICS</h3>
                    </caption> -->
                    <tr>
                        <td>
                            <center>
                                <h3>LISTEN TO AMBIENT MUSICS</h3><br>
                                <object type="application/x-shockwave-flash" data="swf/player_mp3_multi.swf" width="200" height="100">
                                    <param name="movie" value="swf/player_mp3_multi.swf" />
                                    <param name="FlashVars" value="mp3=1.mp3|2.mp3|3.mp3&amp;title=savinet 1|savinet 2|savinet 3" />

                                </object>
                            </center>
                            <br>
                            <center> ENTERTAINMENT PAGE NOT READY YET<br>MORE IS YET TO COME</center>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
