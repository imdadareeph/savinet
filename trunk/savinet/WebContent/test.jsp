<%-- 
    Document   : test
    Created on : Aug 14, 2011, 4:01:49 PM
    Author     : soorej
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajax test</title>
        <script type="text/javascript" src="javascripts/jquery-1.6.1.min.js"></script>
        <script type="text/javascript" src="javascripts/ajax_functions.js"></script>
    </head>
    <script type="text/javascript">
        $(document).ready(
            function(){ testCheck();}
        );
    </script>
    <body>
        <h1>Hello World!</h1>
        <table>
        <tr><td><input type="text" name="uname" id="uname"  value=""></td><td><div id="uerr"><h2></h2></div></td></tr>
        
        </table>
    </body>
</html>
