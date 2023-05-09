<%-- 
    Document   : ManageSnacks
    Created on : Apr 24, 2023, 2:18:13 PM
    Author     : TRI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <title>ManageSnacks Page</title>
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp"/> 
        
        <form action="manageSnacksServlet" method="post" class="formsearch">
            <input type="text" name="txtsearch" value="<%= (request.getParameter("txtsearch")==null)?"": request.getParameter("txtsearch") %>">
            <select name="searchby">
                <option value="byname">by name</option>
                <option value="bycate">by category</option>
            </select>
            <input type="submit" value="search" name="action">
        </form>
        
        <a href="AddSnack.jsp">__Add Snack__</a>                      
        
        <h1></h1>
        <table class="order">
            <tr><th> ID</th>
                <th> Name</th>
                <th> Image</th>
                <th> Price</th>
                <th> Categories</th>
                <th> Description</th>
                <th> Status</th>
                <th> Action</th>
            </tr>

            <c:set var="listSnacks" value="${requestScope.listSnacks}"/>      
            
            <c:forEach var="sna" items="${listSnacks}">
                <tr><th><c:out value="${sna.getId()}"></c:out></th>
                    <th><c:out value="${sna.getName()}"></c:out></th>
                    <th><img src="${sna.getImgpath()}" class="snackimg"></th>
                    <th><c:out value="${sna.getPrice()}"></c:out></th>
                    <th><c:out value="${sna.getCatename()}"></c:out></th>
                    <th><c:out value="${sna.getDescription()}"></c:out></th>
                    <th><c:choose >
                            <c:when test="${sna.getStatus() eq 1}"> Availability</c:when>
                            <c:when test="${sna.getStatus() eq 0}"> Out of stock</c:when>
                        </c:choose>
                    </th>
                    <th>
                        <c:url var="mylink" value="updateSnacksByAdmin.jsp">
                            <c:param name="snackid" value="${sna.getId()}"></c:param>
                            <c:param name="action" value="updateSnacks"></c:param>
                        </c:url>
                        <a href="${mylink}">Update Snack</a>                       
                    </th>
                </c:forEach>
            </table>
        </body>
</html>
