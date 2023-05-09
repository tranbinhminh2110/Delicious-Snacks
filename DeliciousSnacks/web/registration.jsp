<%-- 
    Document   : registration
    Created on : Apr 24, 2023, 2:25:33 PM
    Author     : TRI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>
            <form action="mainController" method="post" class="formsearch">
                <h1>Register page!</h1>
                <table>
                    <tr><td>email</td><td><input type="text" name="txtemail" required="" value="<%= (request.getAttribute("txtemail")==null)?"":request.getAttribute("txtemail") %>"></td></tr>
                    <tr><td>full name</td><td><input type="text" name="txtfullname" required="" value="<%= (request.getAttribute("txtfullname")==null)?"":request.getAttribute("txtfullname") %>"></td></tr>
                    <tr><td>password</td><td><input type="text" name="txtpassword" required=""></td></tr>
                    <tr><td>phone</td><td><input type="text" name="txtphone" required="" value="<%= (request.getAttribute("ERROR")==null)?"":request.getAttribute("ERROR") %>"></td></tr>
                    <tr><td colspan="2"><input type="submit" value="register" name="action"></td></tr>              
                </table>   
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
