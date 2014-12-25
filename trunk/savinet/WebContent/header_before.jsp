<%--
    Document   : header_before
    Created on : Jul 14, 2011, 1:01:46 AM
    Author     : imdadareeph
--%>

<HTML>
    <head>

    <SCRIPT language=javascript>
        //--------------- LOCALIZEABLE GLOBALS ---------------
        var d=new Date();
        var monthname=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
        var TODAY = monthname[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear();
        //---------------   END LOCALIZEABLE   ---------------
    </SCRIPT>

    <link href="menu.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="shadeheadertable.css" media="screen" rel="stylesheet" type="text/css" />
    

    <body>
        <br>
            <br>
                <br>
        <table class="shadeheaderbanner" cellSpacing=0 cellPadding=0 width="1040" height="145" border=0 align="center" >
            <tr>
                <td align="center">
                    <img border="0" src="image/savinet3.jpg" width="1030" height="130">
                </td>
            </tr>
        </table>
        <br>
        <table class="shadeheader" cellSpacing=0 cellPadding=0 width="1040" height="50" align="center" >
            <tr  align="center">
                <td width="338" style="vertical-align: middle">
                    <ul id="navigation" class="nav-main">
                        <li><a href="home">Home</a></li>
                        <li><a href="invite.jsp">INVITE</a></li>
                        <li><a href="gallery.jsp">GALLERY</a></li>
                        <li><a href="post.jsp">BLOG</a></li>
                        <li><a href="groups.jsp">GROUP</a></li>

                        <li><a href="search">SEARCH</a></li>&nbsp;
                        <li><a href="about.jsp">ABOUT</a></li>&nbsp;
                        <li><a href="contact.jsp">CONTACT</a></li>&nbsp;
                        <li><a href="entertainment.jsp">ENTERTAINMENT</a></li>&nbsp;
                        <li> <br>TODAY::<SCRIPT language=javascript>document.write(TODAY);</SCRIPT></li>
                    </ul>
                </td>
            </tr>
        </table>

    </body>
</HTML>
