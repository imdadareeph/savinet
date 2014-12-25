<%--
    Document   : groups
    Created on : Jul 31, 2011, 8:47:46 PM
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


    <script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js'></script>
    <script type='text/javascript' src='javascripts/jquery.tipsy.js'></script>
    <script type='text/javascript'>
        $(function() {
            $('#tipsy').tipsy({fade: true, gravity: 's'});
        });
    </script>
    <head>
        <title>group</title>
    </head>
    <style>

		.wrapper {
		width: 1040px;
		min-height: 400px;
		margin: 0 auto;
		text-align: center;
		background: url(images/commingsoon/bg-light.png) repeat;
		padding-top: 20px;
		}



		a{ color: #77dff1; text-decoration: none;}

		@font-face {
    	font-family: 'LeagueGothicRegular';
   		src: url('fonts/League_Gothic-webfont.eot');
    	src: url('fonts/League_Gothic-webfont.eot?#iefix') format('embedded-opentype'),
        url('fonts/League_Gothic-webfont.woff') format('woff'),
        url('fonts/League_Gothic-webfont.ttf') format('truetype'),
        url('fonts/League_Gothic-webfont.svg#LeagueGothicRegular') format('svg');
    	font-weight: normal;
    	font-style: normal;
    	}

		h1 {
		text-transform: uppercase;
		color: #77dff1;
		font-family: LeagueGothicRegular;
		font-size: 80px;
		font-weight: lighter;
		text-shadow: 0px 2px 0px #000;
		margin: 30px 0 0 0;
		}

		h2 {
		text-transform: uppercase;
		color: #77dff1;
		font-family: LeagueGothicRegular;
		font-size: 24px;
		font-weight: lighter;
		text-shadow: 0px 2px 0px #000;
		margin: 15px 0 15px 20px;
		text-align: left;
		}


		p.credit {font-size: 12px; margin-top: 40px; color: #ccc;}

        p.notready {
            color: #fff;
		margin: 0;
		font-size: 16px;
		text-shadow: 0 -2px 0 #000;
        }
		.hr {
		display: block;
		border: none;
		width: 960px;
		height: 2px;
		background: url(images/commingsoon/divider.png);
		margin: 10px 0;
		}

		.clear {
		clear: both;
		}

		.progress {
		height: 110px;
		margin: 80px 0;
		background: url(images/commingsoon/progress-container.png) no-repeat;
		position: relative;
		}

		.txt-launch-day-hat {
		background: url(images/commingsoon/txt-launch-day-hat.png) no-repeat;
		width: 117px;
		height: 159px;
		position: absolute;
		top: -120px;
		right: 35px;
		}

		.txt-launch-day {
		background: url(images/commingsoon/txt-launch-day.png) no-repeat;
		width: 112px;
		height: 110px;
		position: absolute;
		top: -80px;
		right: -40px;
		}

		.progress-bar {
		height: 43px;
		background: #72dbf1 url(images/commingsoon/progress-bar.png) repeat-x;
		position: absolute;
		top:14px;
		left: 0px;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		}

		.progress-bar-container {
		width: 930px;
		height: 70px;
		margin-left: 13px;
		position: relative;
		}

		.mailing-list h2 {
		width: 400px;
		float: left;
		}

		.mailing-list form {
		display: block;
		width: 450px;
		float: right;
		margin: 5px 0 0 0;
		}

		.mailing-list input[type=text]{
		width:280px;
		height: 16px;
		background: url(images/commingsoon/form-bg.png) no-repeat;
		border: none;
		color: #c9c9c9;
		font-size: 14px;
		padding: 15px 10px;
		margin: 0;
		}

		.mailing-list input[type=submit]{
		width:90px;
		height: 44px;
		background: url(images/commingsoon/btn-subscribe.png) no-repeat;
		border: none;
		text-indent: -5000px;
		cursor: pointer;
		margin: 0 0 0 -10px;
		text-transform: capitalize;1
		}

		.mailing-list input[type=submit]:hover{
		background-position: 0 -44px;
		}

		.mailing-list input[type=submit]:active{
		background-position: 0 -88px;
		}

		.mailing-list input[type=text]:focus {
		outline: none;
		}

		.tipsy { margin-bottom: 25px; font-size: 18px; opacity: 0.8; filter: alpha(opacity=80); background-repeat: no-repeat;  background-image: url(images/commingsoon/tipsy.png); font-family: 'LeagueGothicRegular'; text-transform: uppercase;  }
  		.tipsy-inner { padding: 10px 20px; background-color: black; color: white; max-width: 400px; text-align: right; -webkit-box-shadow: 0 20px 15px rgba(0,0,0,0.5); -moz-box-shadow: 0 20px 15px rgba(0,0,0,0.5);   }
  		.tipsy-inner { -moz-border-radius:5px; -webkit-border-radius:5px; }
  		.tipsy-north { background-position: top center; }
  		.tipsy-south { background-position: bottom center; }
  		.tipsy-east { background-position: right center; }
  		.tipsy-west { background-position: left center; }
  		.tipsy-container { border: 1px solid green;}
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
                <table class="shade" border="0" cellpadding="0" cellspacing="0" width="1040" align="center"  >
                    <tr>
                        <td bgcolor="black">
                            <div class="wrapper">

                                <div class="hr"></div>
                                <h1> SAVINET GROUP Coming Soon</h1>
                                <br><br><br><br>
                                <p class="notready"><b>Unfortunately, this page is not ready yet. <strong> But, you can see our progress below:</strong></b></p>

                                <section class="progress">
                                    <div class="progress-bar-container" id="tipsy" title="87% Complete"> <!-- Edit this title for the tooltip pop up -->
                                        <article class="progress-bar" style="width:87%"  ></article> <!-- Edit the width percentage value to indicate progress -->
                                    </div>
                                    <article class="txt-launch-day-hat"></article>
                                </section>

                                <div class="hr"></div>
                                <section class="mailing-list">
                                    <h2>Want to be the first to know when this will be ready?</h2>
                                    <form>
                                        <input type="text" value="your@email.com" onfocus="if(!this._haschanged){this.value=''};this._haschanged=true;">
                                        <input type="submit" value="Subscribe">
                                    </form>
                                </section><div class="clear"></div>
                                <div class="hr"></div>

                                <p class="credit">Credit <a href="http://localhost:8084/WorkingCopyASINET/home">Savinet</a></p>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
