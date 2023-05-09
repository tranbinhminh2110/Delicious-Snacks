<%-- 
    Document   : ManageAccounts
    Created on : Apr 24, 2023, 2:17:22 PM
    Author     : TRI
--%>

<%@page import="sample.dao.AccountDAO"%>
<%@page import="sample.dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp"/> 
        <form action="mainController" method="post">
            <input type="text" name="txtSearch">
            <input type="submit" value="searchAccount" name="action">
        </form>
        <h1></h1>
        <table class="order">
            <tr><th> ID</th>
                <th> Email</th>
                <th> Full name</th>
                <th> Status</th>
                <th> Phone</th>
                <th> Role</th>
                <th> Action</th>
            </tr>
            <c:set var="kq" value="${requestScope.emailsearch}"/>
            <c:if test="${kq == null}">
                <c:set var="list" value="${requestScope.accountList}"/>
            </c:if>
            <c:if test="${kq != null}">
                <c:set var="list" value="${requestScope.emailsearch}"/>
            </c:if>
            <c:forEach var="acc" items="${list}">
                <tr><th><c:out value="${acc.getAccID ()}"></c:out></th>
                    <th><c:out value="${acc.getEmail()}"></c:out></th>
                    <th><c:out value="${acc.getFullname()}"></c:out></th>
                    <th><c:choose >
                            <c:when test="${acc.getStatus() eq 1}"> active</c:when>
                            <c:otherwise>inActive</c:otherwise>
                        </c:choose>
                    </th>
                    <th><c:out value="${acc.getPhone()}"></c:out></th>
                    <th><c:choose >
                            <c:when test="${acc.getRole() eq 1}"> admin</c:when>
                            <c:otherwise>user</c:otherwise>
                        </c:choose>
                    </th>
                    <th><c:if test="${acc.getRole() eq 0}">
                            <c:url var="mylink" value="mainController">
                                <c:param name="email" value="${acc.getEmail()}"></c:param>
                                <c:param name="status" value="${acc.getStatus()}"></c:param>
                                <c:param name="action" value="updateStatusAccount"></c:param>
                            </c:url>
                            <a href="${mylink}">Block/Unlock</a>
                    </c:if>
                        
                    </th>
                </c:forEach>
            </table>
        </body>
    </html>