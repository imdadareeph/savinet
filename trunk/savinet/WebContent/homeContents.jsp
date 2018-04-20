<%--
    Document   : homeContents
    Created on : Sep 1, 2011, 12:56:44 AM
    Author     : Reja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@page contentType="text/html"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        li {
            list-style-image:url('pictures/sticky.png')
        }
    </style>
    <body>
        <div id="homeFollowDiv">
            <table align="center" border="0" cellpadding="10">
                <tr>
                    <td align="left" valign="top" width="330">
                        <table border="0" align="center">
                            <tr>
                                <td align="left" valign="top" width="330" colspan="2">
                                    <c:choose>
                                        <c:when test="${followers !=null}">
                                            <center><h2 style="background-color:#208ec3;color:white;font-family: 'LeagueGothicRegular';">Followers</h2></center>

                                            <c:forEach var="flwr" items="${followers}">
                                                <tr style="background-color:#92C7D8;font-weight:bold;font-size:14px;">
                                                    <td>&nbsp;
                                                        <b>  <a href="home?profileid=${flwr.follower.userId}">${flwr.follower.userName}</a></b>
                                                        <td width="30">
                                                            <a href="home?profileid=${flwr.follower.userId}"><img src="myphoto?uid=${flwr.follower.userId}" width="30" height="50"></a>
                                                        </td>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </c:when>
                                        <c:otherwise>
                                            <h2 style="background-color:silver">Followers</h2>
                                            <tr>
                                                <td>No Followers</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="left" valign="top" width="330">
                        <table align="center" border="0">
                            <tr>
                                <td align="left" id="tdcolor" valign="top" width="330" colspan="2" >
                                <c:choose>
                                    <c:when test="${followees !=null}">
                                        
                                           <center> <h2 style="background-color:#208ec3;color:white;font-family: 'LeagueGothicRegular';">Followee</h2></center>
                                            <tr>
                                                <c:forEach var="flwe" items="${followees}">
                                                    <td style="background-color:#92C7D8;font-weight:bold;font-size:14px;">
                                                        &nbsp;
                                                        <b> <a href="home?profileid=${flwe.user.userId}">${flwe.user.userName}</a></b>
                                                        <td width="30">
                                                            <a href="home?profileid=${flwe.user.userId}"><img src="myphoto?uid=${flwe.user.userId}" width="30" height="50"></a>
                                                        </td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="background-color:#e3f2e1;" colspan="2">
                                                        <c:forEach var="post" items="${flwe.user.posts}">
                                                            <li>
                                                                <a href="seepost?postid=${post.postId}">${post.title}</a>
                                                            </li>
                                                        </c:forEach>

                                                    </td>
                                                </tr>

                                            </c:forEach>
                                        
                                    </c:when>

                                    <c:otherwise>
                                        
                                            <h2 style="background-color:silver">Followees</h2>

                                            <tr>
                                                <td align="left" id="tdcolor" valign="top" width="330">
                                                    No Followee
                                                </td>
                                            </tr>
                                        
                                    </c:otherwise>
                                </c:choose>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
