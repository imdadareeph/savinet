<%--
    Document   : home
    Created on : Jul 28, 2011, 10:39:37 PM
    Author     : soorej
--%>
<html>
    <head>
        <title>profile</title>
        <script type="text/javascript" src="javascripts/jquery-1.6.1.min.js"></script>
        <script type="text/javascript" src="javascripts/ajax_functions.js"></script>
    </head>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link href="pagetable.css" rel="stylesheet" type="text/css" />
    <link href="followunfollow.css" rel="stylesheet" type="text/css" />
    <style>
        #proftab tr{
            color:purple;
            background-color: #e3f2e1;
        }
    </style>

    <table class="round" border="0" cellpadding="0" cellspacing="10" width="330" height="600" bgcolor="#208ec3" align="center" >
        <tr>
            <td valign="top" height="200"><center>
                    <img src="myphoto?uid=${user.userId}" width="150" height="200" border="5">
                </center>
            </td>
        </tr>
        <tr>
        <td align="center" valign="top" >
            <div id="followDiv">
                <c:if test="${sessionScope.SessionId != user.userId}">
                    <c:choose>
                        <c:when test="${follow==false}">
                            <p class="button">
                                <a href="follow?fUserId=${user.userId}">Follow</a>
                            </p>
                        </c:when>
                        <c:otherwise>
                            <p class="button2">
                                <a href="follow?ufUserId=${user.userId}">UnFollow</a>
                            </p>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </div>
        </td>
        <tr><td>
                <h3 align="center" style="background-color: black;color:white">My Profile</h3>

                <table id="proftab" width="330">

                    <tr>
                        <td>${user.userName}</td>
                    </tr>
                    <tr>
                        <td>${user.email}</td>
                    </tr>
                    <tr>
                        <td><c:choose>
                                <c:when test='${user.gender == "M"}'>
                                    Male
                                </c:when>
                                <c:otherwise>
                                    Female
                                </c:otherwise>
                        </c:choose></td>
                    </tr>
                    <tr>
                        <td>${user.country}</td>
                    </tr>
                    <tr>
                        <td>${user.game}</td>
                    </tr>
                </table>


            </td>
        </tr>
        <tr>
            <td valign="top">
                <h3 align="center" style="background-color:black;color:white">My latest Posts</h3>
                <table id="proftab" width="330">
                    <c:forEach var="post" items="${user.posts}">
                        <tr><td>
                                <a href="seepost?postid=${post.postId}">${post.title}</a>
                        </td></tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
    </table>
</html>
