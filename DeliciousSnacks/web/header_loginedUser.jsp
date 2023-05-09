<%-- 
    Document   : header_loginedUser
    Created on : Apr 24, 2023, 2:22:16 PM
    Author     : TRI
--%>

%-- 
    Document   : header_loginedUser
    Created on : Feb 28, 2023, 1:46:17 PM
    Author     : TRI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="profileUser.jsp">Change Profile</a></li>
                <li><a href="viewOrders.jsp?or=<%= 2%>">Completed Orders</a></li>
                <li><a href="viewOrders.jsp?or=<%= 3%>">Canceled Orders</a></li>
                <li><a href="viewOrders.jsp?or=<%= 1%>">Processing Orders</a></li>
                <li><a href="personalPage.jsp">View All Orders</a></li>
                <form action="personalPage.jsp" method="get">
                    <li>
                        From <input type="date" name="from"> to <input type="date" name="to">
                            <input type="submit" value="search" name="action">                   
                    </li>
                </form>
                
            </ul>
        </nav>
    </body>
</html>
