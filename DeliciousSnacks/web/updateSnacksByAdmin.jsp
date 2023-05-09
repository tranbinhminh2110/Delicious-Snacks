<%-- 
    Document   : updateSnacksByAdmin
    Created on : Apr 24, 2023, 2:27:23 PM
    Author     : TRI
--%>

<%@page import="sample.dto.Categories"%>
<%@page import="sample.dao.CategoriesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dao.SnackDAO"%>
<%@page import="sample.dto.Snack"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <title>UpdateSnacks Page</title>
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp"/> 
        
        <%
            int snackid = Integer.parseInt(request.getParameter("snackid"));
            Snack sna = SnackDAO.getSnack(snackid);
            ArrayList<Snack> snackall= SnackDAO.getAllSnacks();
            ArrayList<Categories> cateall= CategoriesDAO.getAllCategories();
            String report =(String) request.getAttribute("report");
        %>
        <form action="mainController?snackid=<%= snackid %>" method="post">
            <table>
                <%
                    if (report != null) {%>
                    <h1><%= report %></h1>
                <%     
                    }
                %>
                <h1>Information Snack</h1>   
                <tr><td>ID:</td><td><%= sna.getId() %></td></tr>
                <tr><td>Name:</td><td><%= sna.getName() %></td><td><input type="text" name ="txtnameupdate"></td></tr>
                <tr><td>Image:</td><td><img src="<%= sna.getImgpath() %>" class="snackimg"></td><td><input type="text" name ="txtimageupdate"></td></tr>
                <tr><td>Price:</td><td><%= sna.getPrice() %></td><td><input type="text" name ="txtpriceupdate"></td></tr>
                <tr><td>Categories:</td><td><%= sna.getCatename() %></td>
                    <td>                   
                        <select name="txtcategoriesupdate" id="txtcategoriesupdate">
                        <%             
                            for (Categories cate : cateall) {
                        %>
                                <option value="<%= cate.getCateName() %>"><%= cate.getCateName() %></option>
                        <%
                            }
                        %>
                        </select>
                    
                    </td>
                </tr>
                <tr><td>Description:</td><td><%= sna.getDescription() %></td>
                    <td>
                        <select name="txtdescriptionupdate" id="txtdescriptionupdate">
                        <%             
                            for (Snack snack : snackall) {
                        %>
                                <option value="<%= snack.getDescription() %>"><%= snack.getDescription() %></option>
                        <%
                            }
                        %>
                        </select>
                    </td>
                </tr>
                <tr><td>Status:</td>
                    <% if(sna.getStatus() == 1){ %>
                    <td>Availability</td>
                    <% } else %> <td>Out of stock</td>
                    
                    <td>
                        <select name="txtstatussupdate" id="txtstatussupdate">
                            <option value="1">Availability</option>
                            <option value="0">Out of stock</option>
                        </select>
                    </td>
                
                </tr>
                <tr><td colspan="2"><input type="submit" value ="updateSnacks" name="action"></td></tr>
            </table>
        </form>
    </body>
</html>
