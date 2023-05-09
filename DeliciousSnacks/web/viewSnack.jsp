<%-- 
    Document   : viewSnack
    Created on : Apr 24, 2023, 2:28:14 PM
    Author     : TRI
--%>

<<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="snackObj" class="sample.dto.Snack" scope="request"/>
        <table>
            <tr><td rowspan="8"><img src="<jsp:getProperty name="snackObj" property="imgpath"></jsp:getProperty>"></td></tr>
            <tr><td>id:<jsp:getProperty name="snackObj" property="id"></jsp:getProperty></td></tr>
            <tr><td>product name:<jsp:getProperty name="snackObj" property="name"></jsp:getProperty></td></tr>
            <tr><td>price:<jsp:getProperty name="snackObj" property="price"></jsp:getProperty></td></tr>
            <tr><td>description:<jsp:getProperty name="snackObj" property="description"></jsp:getProperty></td></tr>
            <tr><td>status:<jsp:getProperty name="snackObj" property="status"></jsp:getProperty></td></tr>
            <tr><td>cate id:<jsp:getProperty name="snackObj" property="cateid"></jsp:getProperty></td></tr>
            <tr><td>category:<jsp:getProperty name="snackObj" property="catename"></jsp:getProperty></td></tr>
        </table>
        <!--su dung EL -->
        <table>
            <tr><td rowspan="8"><img src="${snackObj.imgpath}"></td></tr>
            <tr><td>id:${snackObj.id}</td></tr>
            <tr><td>product name:${snackObj.name}</td></tr>
            <tr><td>price::${snackObj.price}</td></tr>
            <tr><td>description:${snackObj.description}</td></tr>
            <tr><td>status:${snackObj.status}</td></tr>
            <tr><td>cate id:${snackObj.cateid}</td></tr>
            <tr><td>category:${snackObj.catename}</td></tr>
        </table>
        
    </body>
</html>

