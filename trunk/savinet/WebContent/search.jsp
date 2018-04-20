<%--
    Document   : search
    Created on : Aug 13, 2011, 1:14:39 AM
    Author     : soorej
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
        <title>Search</title>
        <script type="text/javascript" src="javascripts/jquery-1.6.1.min.js"></script>
        <script type="text/javascript" src="javascripts/ajax_functions.js"></script>
        <script type="text/javascript">
            $(document).ready(
            function(){ searchUser();}
        );
        </script>
        <script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js'></script>
    <script type='text/javascript' src='javascripts/jquery.tipsy.js'></script>
    <script type='text/javascript'>
        $(function() {
            $('#tipsy').tipsy({fade: true, gravity: 's'});
        });
    </script>
    </head>
    <style>
        .searchStr input[type=text]{
		width:370px;
		height: 16px;
		background: url(images/commingsoon/searchbg.png) no-repeat;
		border: none;
		color: #c9c9c9;
		font-size: 14px;
		padding: 15px 10px;
		margin: 0;
		}
        .searchStr input[type=text]:focus {
		outline: none;
		}
        td.searchStr {
            -webkit-box-shadow: 2px 2px 10px #000;
    -moz-box-shadow: 2px 2px 10px #ccc;
    -webkit-border-bottom-left-radius: 0px;
    -webkit-border-bottom-right-radius: 0px;
    -webkit-border-top-left-radius: 20px;
    -webkit-border-top-right-radius: 20px;
        }
        td.bottomtd{
            -webkit-box-shadow: 2px 2px 10px #000;
    -moz-box-shadow: 2px 2px 10px #ccc;
    -webkit-border-bottom-left-radius: 20px;
    -webkit-border-bottom-right-radius: 20px;
    -webkit-border-top-left-radius: 0px;
    -webkit-border-top-right-radius: 0px;
        }

    </style>

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
                        <td class="searchStr" valign="top" bgcolor="#208ec3" height="120"><br>
                            <center>
                                <!--form id="searchForm" onsubmit="searchUser()" action=""-->
                                <input type="text"  id="searchStr" name="searchStr" value="Search" onfocus="if(!this._haschanged){this.value=''};this._haschanged=true;" />

                                <!--/form-->

                            </center>
                        </td>
                    </tr>
                    <tr>
                        <td class="bottomtd" bgcolor="#92c7d8"><center><div id="searchDiv"></div></center></td>
                    </tr>
                </table>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
