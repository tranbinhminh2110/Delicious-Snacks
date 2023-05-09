<%-- 
    Document   : OrderDetail
    Created on : Apr 24, 2023, 2:24:21 PM
    Author     : TRI
--%>

<%@page import="sample.dto.OrderDetail"%>
<%@page import="sample.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name = (String) session.getAttribute("name");
            if (name == null) {
        %>
        <p><font color='red'>you must login to view personal page</font></p>
        <p></p>
        <%
        } else {
        %>
        <section>
            <h3>Welcome <%= name%> come back</h3>
            <h3><a href="mainController?action=logout">Logout</a></h3>
            <a href="personalPage.jsp">View all orders</a>
        </section>
        <section>
            <%
                String orderid = request.getParameter("orderid");
                if (orderid != null) {
                    int orderID = Integer.parseInt(orderid.trim());
                    ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(orderID);
                    if (list != null && !list.isEmpty()) {
                        int money = 0;
                        for (OrderDetail detail : list) {
            %>
                            <table class="order">
                                <tr><td>Order ID</td><td>Snack ID</td><td>Snack Name</td><td>Image</td><td>quantity</td></tr>
                                <tr><td><%= detail.getOrderID()%></td><td><%= detail.getSnackID()%></td>
                                    <td><%= detail.getSnackName()%></td>
                                    <td><img src="<%= detail.getImgPath()%>" class="snackimg"/> <br/> <%= detail.getPrice()%></td>
                                    <td><%= detail.getQuantity()%></td>
                                    <% money = money + detail.getPrice() * detail.getQuantity(); %>
                                </tr>
                            </table>
            <%
                        }//end for %>
            <h3> Total money: <%= money%> VND</h3>
            <%      }//end if
                    else {
            %>
            <p>You don't have any order</p>
            <%
                    }
                }//end if
        }
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
