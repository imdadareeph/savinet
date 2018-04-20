<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="style.css" type="text/css"></link>
    </head>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <link href="shadetable.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        A:link {text-decoration:none;color: blue}
        A:visited {text-decoration: none;color: navy}
        A:active {text-decoration: none;color: gray}
        A:focus {text-decoration: underline; color: olive;}
        A:hover {background: #FD9339 url(images/hover_list.jpg) repeat-x; color: #fff;
    </style>
    <body bgcolor="ffffff">
        <div id="main">
            <div class="container">
                <thead>
                    <%@include file="header_after.jsp"%>
                </thead>
                <%@page import="model.Post;" %>
                <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



                <!-- Session check -->
                <c:if test="${sessionScope.SessionId==null}">
                    <jsp:forward page="login_warning.jsp"/>
                </c:if>
                <!-- Session check -->

                <center>
                    <form action="blogpost" method="POST">
                        <br>
                        <!--<table border="0" align="center" style="background-color:rgb(32,142,195);">-->
                        <table class="shade" cellspacing="5" border="0" align="center" style="color:black; background-color:#92C7D8" width="1040" >

                            <tr>
                                <td> &nbsp;&nbsp;&nbsp;

                                    Title
                                    <font color="red">
                                        ${post.errors.title}
                                    </font>
                                </td>

                            </tr>
                            <tr>
                                <td> &nbsp;&nbsp;&nbsp;
                                    <input name="title" type="text" value="${post.title}"/>
                                </td>

                            </tr>

                            <tr>

                                <td> &nbsp;&nbsp;&nbsp;
                                    Content

                                    <font color="red">
                                        ${post.errors.content}
                                    </font>
                            </td></tr>
                            <tr>
                                <td> &nbsp;&nbsp;&nbsp;
                                    <textarea name="content" rows="10" cols="110">${post.content}</textarea>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <center> <input type="submit" value="Post It"></center>
                                </td>
                            </tr>
                            <tr style="background-color:#208ec3;"><td colspan="2">

                                    <c:forEach  items="${allPosts}" var="p" >
                                        <tr style="background-color:#e3f2e1;"><td  class="roundleft"><a href="seepost?postid=${p.postId}">${p.title}</a> </td><td  class="roundright">&nbsp;${p.postedDate}<br><a href="deletepost?postid=${p.postId}">delete</a></td></tr>
                                    </c:forEach>

                                </td>
                            </tr>


                        </table>
                    </form>
                </center>
            </div>
        </div>
        <%@include file="footer.jsp"%>
</body></html>