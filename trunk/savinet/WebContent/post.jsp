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
    <body bgcolor="ffffff">
        <div id="main">
    	<div class="container">
        <thead>
            <%@include file="header_after.jsp"%>
        </thead>

        <%@page import="java.util.HashMap,model.Post,java.util.Set,java.util.Iterator;" %>
<%
                    Post post = null;
                    HashMap errs = null;
                    if (request.getAttribute("post") != null) {

                            post = (Post) request.getAttribute("post");
                            errs = (HashMap) post.getErrors();
                           // out.println(errs);
                    }
%>
<!-- Session check -->
        <%  String sessId = (String) session.getAttribute("SessionId");
            if (sessId == null) {
                response.sendRedirect("login_warning.jsp");
        
            }
        %>
<!-- Session check -->

             <center>
                <form action="post" method="POST">
                    <br>
                <!--<table border="0" align="center" style="background-color:rgb(32,142,195);">-->
                <table border="0" align="center" style="background-color:teal;" width="1040">
                    
                    <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     Title<input name="title" type="text" value="<% if(post != null && post.getTitle() != null){ out.print(post.getTitle()); }%>"> &nbsp;&nbsp;&nbsp;
                     <font color="red">
                         <% if(errs!=null && errs.get("title")!=null){out.println(errs.get("title"));} %>
                     </font>
                    </td>

                    </tr>
                    <tr>
                        <tr>
                            <td>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                Content 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <font color="red">
                        <% if(errs!=null && errs.get("content")!=null){out.println(errs.get("content"));} %>
                        </font>
                    </td></tr>
                    <td align="center">
                        <textarea name="content" rows="10" cols="110"><% if(post != null && post.getContent() != null){ out.print(post.getContent()); }%></textarea>
                    </td>
                    
                    </tr>
                    <tr>
                    <td>
                       <center> 
                       <!--input type="submit" value="Post It"-->
                       <input type="image" src="pictures/g-submit.png"  value="Post It" />

                           </center>
                    </td>
                    <td></td>
                    </tr>
                    <tr><td bgcolor="yellow">
                        <%
                        try{
                        HashMap allPosts = (HashMap)request.getAttribute("allPosts");
                        Set s = allPosts.keySet();
                        
                        Iterator it = s.iterator();
                        while (it.hasNext()) {
                            int key = (Integer)it.next();
                            out.println("<tr><td colspan='2'><a href=''>"+allPosts.get(key)+"</a> </td></tr>");
                            }
                           }catch(Exception e){
                               out.println("The exception is : "+e.getMessage());
                            }
                        %>
                    </td>
                    </tr>
                    
                 
                </table>
                </form>
        </center>
        </div>
        </div>
        <%@include file="footer.jsp"%>
</body></html>