<%--
    Document   : home
    Created on : Jul 28, 2011, 10:39:37 PM
    Author     : imdad
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
    <!--  <bgsound src="bgsound.mp3" loop=\"infinite\"/>-->
    <head>
        <title>HOME</title>
    </head>

    <body bgcolor="#ffffff">

        <!--------------PLAY BACKGROUND MUSIC---------->

        <audio autoplay id="bgsound">
            <source src="media/bgsound.mp3" type="audio/mp3"/>
        </audio>
       <center>
            <INPUT TYPE="image" SRC="images/butt1.gif" BORDER="0" onclick="document.getElementById('bgsound').play();">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <INPUT TYPE="image" SRC="images/butt3.gif" BORDER="0" onclick="document.getElementById('bgsound').pause();">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <INPUT TYPE="image" SRC="images/butt2.gif" BORDER="0" onclick="document.getElementById('bgsound').stop();">
        </center> 
        

        <div id="main">
            <div class="container">
                <thead>
                    <jsp:include page="header_after.jsp"></jsp:include>
                </thead>
                <!-- Session check  -->
                <c:if test="${sessionScope.SessionId==null}">
                    <jsp:forward page="index.jsp"/>
                </c:if>
                <!-- Session check -->

                <br>
                <table class="shade" style="background-color:#E5E5E5;" border="0" cellpadding="0" cellspacing="0" width="1040" height="400" bgcolor="white" align="center"  >

                    <tr>
                        <td width="330" align="center">
                            <jsp:include page="profile.jsp"></jsp:include>

                        </td>
                        <td align="left" valign="top" width="330" colspan="2">
                            <c:choose>
                                <c:when test="${followers != null || followees !=null}">
                                    <jsp:include page="homeContents.jsp"></jsp:include>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${sessionScope.SessionId != user.userId}">
                                            <h2 align="center"> ${user.userName} has no followers or followees currently </h2>

                                        </c:when>
                                        <c:otherwise>
                                            <h2 align="center"> Welcome ${user.userName}</h2>
                                            <h3 align="center">Please write your blog or go to search to search friends</h3>
                                        </c:otherwise>
                                    </c:choose>
                                    <br>

                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>
