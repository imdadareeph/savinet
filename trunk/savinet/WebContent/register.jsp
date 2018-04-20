<%--
    Document   : Registration
    Created on : Jul 14, 2011, 6:26:53 AM
    Author     : imdadareeph
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>

    <head>
        <title>User name</title>
        <script type="text/javascript" src="javascripts/jquery-1.6.1.min.js"></script>
        <script type="text/javascript" src="javascripts/ajax_functions.js"></script>
    </head>
    <link href="shadetable.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="style.css" rel="stylesheet" type="text/css" />
    
    <!-- border: 1px solid black; -->
    <script type="text/javascript">
        $(document).ready(
            function(){ nameCheck();}
        );
    </script>
    <body bgcolor="#ffffff">
        <div id="main">
    	<div class="container">

        <thead>
            <%@include file="header_before.jsp"%>
            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        </thead>
        <jsp:useBean id="user" class="model.User" scope="request"/>
        <br>
                <table class="shade" width="1040" border="0" align="center" bgcolor="white"  height="400">
                    <tr><td>
        <div align="center">
            <center>
                <p>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                <table height="1" cellspacing="1" width="1040" border="0">
                    <caption><font color="#f34353"><h4>REGISTER AT SAVINET & CONNECT WITH PEOPLE YOU LOVE</h4></font>
                    </caption>
                    <tbody>
                        <tr>
                            <td width="100%" height="1">
                                <form action="register" method="POST" enctype="multipart/form-data">
                                    <div align="right">
                                        <table cellspacing="1" width="85%" border="0" height="240">
                                            <tbody>
                                                <tr>
                                                    <td width="100%" height="25" colspan="3"><b><i><font size="4"><center>
                                                                        <marquee width="600" height="22" behavior="scroll" scrollamount="4">
                                                                            <label style="color:purple;">User Registration Page. Register into SAVINET to Reach out the world!!!</label>
                                                                        </marquee>
                                                                    </center>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></i></b></td>
                                                    
                                                </tr>
                                                <tr>
                                                    <td width="300" height="25"><b>User name</b></td>

                                                    <td  height="25"><input id="uname" name="uname" size="20" value="${user.userName}"></td>
                                                    <td style="color:red;font-weight:bold" width="550" height="25"><div id="uerr">${user.errors.uname}
                                                    ${user.errors.userExist}</div></td>
                                                </tr>
                                                <tr>
                                                    <td width="300" height="28"><b>First Name</b></td>
                                                    <td  height="28">

                                                        <p><input type="text" name="fname" value="${user.firstName}" size="20"></p>

                                                    </td>
                                                    <td style="color:red;font-weight:bold" >${user.errors.fname}</td>
                                                    
                                                </tr>
                                                <tr>
                                                    <td width="300" height="25"><b>Password</b></td>
                                                    <td  height="25"><input type="password" name="pword" size="20"></td>
                                                    <td style="color:red;font-weight:bold" >${user.errors.pwd}</td>
                                                </tr>
                                                <tr>
                                                    <td width="300" height="25"><b>Confirm
                                                    Password</b></td>
                                                    <td  height="25"><input type="password" name="cpwd" size="20"></td>
                                                    <td style="color:red;font-weight:bold" >${user.errors.pwdError}</td>
                                                </tr>
                                                <tr>
                                                    <td width="300" height="25"><b>Insert&nbsp; Image</b></td>
                                                    <td  height="25">
                                                    <input type="file" value="Submit" name="image"></td>
                                                    <td style="color:red;font-weight:bold" >${user.errors.image}</td>
                                                </tr>
                                                <tr>
                                                    <td width="300" height="25"><b>E-mail
                                                    Id</b></td>
                                                    <td  height="25"><input name="ename" value="${user.email}" size="20"></td>
                                                    <td style="color:red;font-weight:bold" >${user.errors.email}</td>
                                                </tr>
                                                <tr>
                                                    <td width="300" height="25"><b>Phone Number
                                                    </b></td>
                                                    <td  height="25"><input name="phone" value="${user.phone}" size="20"></td>
                                                    <td style="color:red;font-weight:bold" >${user.errors.phone}</td>
                                                </tr>
                                                <tr>
                                                    <td width="300" height="22"><b>Address</b></td>
                                                    <td  height="22"><textarea rows="2" name="add" cols="15">${user.address}</textarea></td>
                                                </tr>
                                                <tr>
                                                    <td width="300" height="25"><b>Country</b></td>
                                                    <td style="color:red;font-weight:bold"  height="25">
                                                        <select size="1" name="country">
                                                            <option selected>--Select--</option>
                                                           <c:forEach var="cntry" items="${countries}">
                                                            <c:choose>
                                                                <c:when test="${cntry == user.country}">
                                                                    <option selected value="${cntry}">${cntry}</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${cntry}">${cntry}</option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                         </c:forEach>
                                                    </select></td>
                                                </tr>
                                                <tr>
                                                    <td width="300" height="21"><b>Gender</b></td>
                                                    <td  height="21"><input type="radio" checked value="M" name="gender">Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="radio"  <c:if test="${user.gender == 'F'}">checked</c:if>  value="F" name="gender">Female</td>
                                                </tr>
                                                <tr>
                                                    <td width="300" height="27"><b>Birthday</b></td>
                                                    <td   height="27"><select size="1" name="date">
                                                            <option selected>Day</option>
                                                            <c:forEach var="day" begin="${1}" end="${31}">
                                                                <c:choose>
                                                                    <c:when test="${day == param.date}">
                                                                        <option selected value="${day}">${day}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <option value="${day}">${day}</option>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </select><select size="1" name="month">
                                                            <option selected>Month</option>
                                                            <c:forEach var="month" items="${months}" varStatus="monthCount">
                                                            <c:choose>
                                                                        <c:when test="${monthCount.count == param.month}">
                                                                            <option  selected value="${monthCount.count}">${month}</option>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <option  value="${monthCount.count}">${month}</option>
                                                                        </c:otherwise>
                                                                    </c:choose>

                                                         </c:forEach>
                                                        </select><select size="1" name="year">
                                                            <option selected>Year</option>
                                                            <c:forEach var="year" begin="${1986}" end="${2000}">
                                                                   <c:choose>
                                                                        <c:when test="${year == param.year}">
                                                                            <option selected value="${year}">${year}</option>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <option value="${year}">${year}</option>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                            </c:forEach>
                                                    </select></td>
                                                    <td style="color:red;font-weight:bold">${user.errors.dob}</td>
                                                </tr>
                                                <tr>
                                                    <td width="300" height="1"><b>Hobby</b></td>
                                                    <td  height="1">

                                                        <p><select size="1" name="hobby">
                                                            <option selected>--Select--</option>
                                                            <c:forEach var="hobby" items="${hobbies}">
                                                                <c:choose>
                                                                <c:when test="${hobby == user.hobby}">
                                                                    <option selected value="${hobby}">${hobby}</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${hobby}">${hobby}</option>
                                                                </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                            &nbsp;
                                                    </select>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td width="300" height="27"><b>Games</b></td>
                                                    <td  height="27"><select size="1" name="game">
                                                            <option selected>--Select--</option>
                                                            <c:forEach var="game" items="${games}">
                                                                <c:choose>
                                                                    <c:when test="${game == user.game}">
                                                                        <option selected value="${game}">${game}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <option value="${game}">${game}</option>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                                &nbsp;
                                                    </select></td>
                                                </tr>
                                                <tr>
                                                    <td width="300" height="27"><b>Education</b></td>
                                                    <td  height="27"><select size="1" name="edu">
                                                            <option selected>--Select--</option>
                                                            <c:forEach var="educ" items="${educs}">
                                                                <c:choose>
                                                                    <c:when test="${educ == user.education}">
                                                                        <option selected value="${educ}">${educ}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <option value="${educ}">${educ}</option>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                                &nbsp;
                                                    </select></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td><input type="submit" value="Register" name="Register"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>                               
                                                                       
                                  <!--  <input type="image" style="background:transparent" src="image/sub.gif" name="Register" > -->
                                </form>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </center>

        </div>
        </td></tr>
        </table>
        </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>

</html>
