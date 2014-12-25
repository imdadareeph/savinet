<%-- 
    Document   : about
    Created on : Jul 16, 2011, 8:31:52 AM
    Author     : imdadareeph
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>SAVINET E</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="shadetable.css" rel="stylesheet" type="text/css" />
<body>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div id="main">
    	<div class="container">
            <c:choose>
            <c:when test="${sessionScope.SessionId==null}">
                <jsp:include page="header_before.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="header_after.jsp"/>
            </c:otherwise>
            </c:choose>


<!-- <p>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> -->
                <br>

<table class="shade" width="1040" cellpadding="80" cellspacing="1" border="0" align="center"  style="color:black">
  <tbody align="justify">
    <tr>
      <td class="lined padded-6"><b><span class="text1"><h2>SAVINET PRIVACY POLICY</h2></span></b>
        <p class="text1"><b><span class="text1">SAVINET </span></b><span class="text1">
        does not send Spam or sell email addresses.</span></p>
        <p class="text1"><b><h2>ABOUT <span class="text1">SAVINET's </span>Information Collection details </h2></b>
        <b><span class="text1">SAVINET </span></b>is an online
        Blog community that connects people through networks of
        friends for making new friends. To accomplish this, our users
        create their own profiles which are shown to the people in their
        personal network. A personal network consists of a user?s friends as
        well as the extended group of people that a user is connected to via
        chains of mutual friends if they are following any blog of the user. To fulfill the purpose of this site, some
        personal information we ask for is displayed to people within these
        personal networks.</p>
        
        <p class="text1"><b><span class="text1">SAVINET</span></b>
         collects user-submitted account information such as name and
        email address to identify users and send notifications related to the
        use of the service. <b><span class="text1">SAVINET </span></b>
        also collects user-submitted profile information such as gender, age,
        occupation, location, etc.</p>
        <p class="text1">Information not Directly Submitted by Users to <b><span class="text1">SAVINET</span></b></p>
        <p class="text1">This is information we collect that is not personally
        identifiable, such as browser type and IP address. This information is
        gathered for all users to the site.</p>
        
        <p class="text1">Profile information as well as first name and photos
        are displayed to people in a user's personal network, to support the
        function of the site as social networking community where users can meet
        new people through their friends. Email address and full name are used
        when a user invites a friend via email to join the service, when a user
        requests to add another user to their friend list, and when we send
        notifications to a user related to their use of the service. Except when
        inviting or adding friends, a user's email address is not shared or
        displayed with people within a user's personal network. Users within a
        personal network communicate on <b><span class="text1">SAVINET </span></b>
        with each other through the <b><span class="text1">SAVINET </span></b>
        service, without disclosing email addresses. </p>
       
        <p class="text1">We use your server, IP address, and browser-type
        related information in the general administration of our website.</p>
        
        <p class="text1"><h2>LINKS</h2></p>
        <p class="text1">This site may contain links to other websites. Please
        be aware that <b><span class="text1">SAVINET </span></b>
        is not responsible for the privacy practices of other Web sites. We
        encourage our users to be aware when they leave our site and to read the
        privacy statements of each and every web site that collects personally
        identifiable information. This privacy statement applies solely to
        information collected by this Web site.</p>
        
        <p class="text1"><h2>Correcting/Updating or Removing Information</h2></p>
        
        <p class="text1">Changes in Our Privacy Policy</p>
        <p class="text1">If we change our privacy policy, we will post those
        changes on our web site so our users are always aware of what
        information we collect, how we use it, and under what circumstances, if
        any, we disclose it. If we are going to use users' personally
        identifiable information in a manner different from that stated at the
        time of collection we will notify users via email.</p>
        <p class="text1"><h2>Invite a Friend</h2></p>
        <p class="text1">If a user elects to use our Invite feature to invite a
        friend to our site, we ask them for the friend's email address. <b><span class="text1">SAVINET </span></b> will automatically send the friend an email
        inviting them to join the site. <b><span class="text1">SAVINET </span></b>

        SAVINET does not sell these email addresses or use
        them to send any other communication besides invitations. The friend may contact <b><span class="text1">SAVINET
        </span></b> to request the removal of this information from our
        database.</p>
                
        <p><br>
        </p>
      </td>
    </tr>
  </tbody>
</table>
<br>
        </div>
    </div>
<%@include  file="footer.jsp"%>

</body>

</html>
