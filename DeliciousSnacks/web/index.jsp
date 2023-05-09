

<%@page import="sample.dao.SnackDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dto.Snack"%>
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
            <%
                String keyword = request.getParameter("txtsearch");
                String searchby = request.getParameter("searchby");
                ArrayList<Snack> list;
                String [] tmp = {"out of stock", "availble"};
                if (keyword==null && searchby==null) {
                    list = SnackDAO.getSnacks("", "");
                } else {
                    list = SnackDAO.getSnacks(keyword, searchby);
                }
                if (list!=null && !list.isEmpty()) {
                    for (Snack s : list) { 
            %>
                    <table class="product">
                        <tr>
                            <td><img src='<%= s.getImgpath() %>' class="snackimg"></td>
                            <td>Product ID:<%= s.getId() %></td>
                            <td>Product Name:<%= s.getName()%></td>
                            <td>Price:<%= s.getPrice()%></td>
                            <td>Status:<%= s.getStatus()%></td>
                            <td>Category:<%= s.getCatename()%></td>
                            <td><a href="mainController?action=addtocart&sid=<%= s.getId() %>&img=<%= s.getImgpath()%>">Add to cart</a></td>
                        </tr>
                    </table>
            <%
                    }
                }

            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
