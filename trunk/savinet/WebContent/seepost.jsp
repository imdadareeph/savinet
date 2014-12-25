<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<link href="shadetable.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
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
<form id="commForm" name="commForm" method="post" action="comment">
    <br>
  <table class="shade" width="1040" height="170" border="0" style="background-color:#92C7D8">
      <tr>
      <td>
          &nbsp;&nbsp;&nbsp;
          <a href="home">Home</a>
      </td>
      <td><a href="blogpost">Blog</a></td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;&nbsp;&nbsp;${post.content}</td>
      <input type="hidden" name="postId" value="${post.postId}">
    </tr>
    <tr>
      <td width="750" height="50"><label>
        <textarea name="comm" id="comm" cols="100" rows="2"></textarea>
      </label></td>
      <td width="138"><label>

        <input type="image" src="pictures/comment1.png"  name="postComm" id="postComm" width="120" height="80" value="Comment" />
      </label></td>
    </tr>
    <tr style="background-color:#208ec3;"><td class="roundleft roundright" colspan="2">
        &nbsp;
    </td></tr>
    <c:forEach  items="${comments}" var="c" >
        <tr style="background-color:#e3f2e1;">
            <td class="roundleft" height="50">&nbsp;&nbsp;&nbsp;${c.content}</td>
            <td class="roundright">${c.commDate}<br/>${c.firstName} <br>
                <c:if test="${sessionScope.SessionId==post.userId || sessionScope.SessionId==c.userId}">
                    <a href="deletecomment?postid=${post.postId}&commentid=${c.commentId}">delete</a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
  </table>
</form>
</div>
</div>
 <%@include file="footer.jsp"%>
</body>
</html>
