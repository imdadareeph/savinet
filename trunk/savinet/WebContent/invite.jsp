<%-- 
    Document   : invite
    Created on : Jul 31, 2011, 8:37:14 PM
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
        <title>invite</title>
    </head>

    <body bgcolor="#ffffff">
        <div id="main">
            <div class="container">
                <thead>
                    <jsp:include page="header_after.jsp"></jsp:include>
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
                            <form method="POST" action="invite">
                               
                                <div align="center">
                                    <center>
                                        <p>
                                        <font face="Balerina-Normal" color="#0000FF"><u>INVITE A FRIEND</u></font>
                                        <P>

                                        <table border="0" width="70%">
                                            <tr>
                                                <td><label style="color:green">${sentStatus}</label></td>
                                            </tr>
                                            <tr>
                                                <td width="30%"><b>TO</b></td>
                                                <td width="70%"><input type="text" name="T1" size="20"></td>
                                            </tr>
                                            <tr>
                                                <td width="30%"><b>FROM</b></td>
                                                <td width="70%"><input type="text" name="T2" size="20"></td>
                                            </tr>
                                            <tr>
                                                <td width="30%"><b>SUBJECT</b></td>
                                                <td width="70%"><input type="text" readonly="TRUE" name="T3"value="INVITATION" size="20"></td>
                                            </tr>
                                            <tr>
                                                <td width="30%"><b>MESSAGE</b></td>
                                                <td width="70%"><textarea readonly="true" rows="5" name="S1" cols="38">I hope you'll try out a new service I joined. You can connect with my friends, invite yours, post listings, write your blogs etc.

It is fun, it is easy and it's addictive

It is a really cool website and I have been making so many friends through my network It really works!!!

Join http://localhost:8080/asinet/ today itself and do let me know what you think.

To check it out, click the Web link below.  (If this link doesn't work, copy it into your browser.)
                                                </textarea></td>
                                            </tr>
                                            <tr>
                                                <td width="30%"></td>
                                                <td width="70%"></td>
                                            </tr>
                                        </table>
                                    </center>
                                </div>
                                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="submit" value="Submit" name="B1" style="font-family: Franklin Gothic Medium; font-size: 12pt; color: #0000FF; font-weight: bold"><input type="reset" value="Reset" name="B2" style="font-family: Franklin Gothic Medium; font-size: 12pt; color: #0000FF; font-weight: bold"></p>
                            </form>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
