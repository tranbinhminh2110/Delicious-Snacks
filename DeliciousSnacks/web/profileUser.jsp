

<%@page import="java.util.ArrayList"%>
<%@page import="sample.dao.AccountDAO"%>
<%@page import="sample.dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <%  String report =(String) request.getAttribute("report");
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            String password = (String) session.getAttribute("password");
            Cookie[] c=request.getCookies();
            boolean login=false;
            if (name == null) {
                String token = "";
                for (Cookie aCookie : c) {
                    if (aCookie.getName().equals("selector")) {
                        token = aCookie.getValue();
                        Account acc = AccountDAO.getAccount(token);
                        if(acc != null){
                            name = acc.getFullname();
                            email = acc.getEmail();
                            login = true;
                        }
                    }                       
                }
            }
            else 
                login= true;
            //show content if login=true;
            if(login){
        %>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>Welcome <%= name%> come back</h3>
            <h3><a href="mainController?action=logout">Logout</a></h3>
        </section>
        <section> <!-- load all orders of the user at here -->
            <%
                Account acc = AccountDAO.getAccount(email, password);
            %>
            <form action="mainController?fullname_old=<%= acc.getFullname() %>&phone_old=<%= acc.getPhone() %>" method = "post">
                <table>     
                    <h2><%= report %></h2>
                    <h1>Information User</h1>
                    <tr><td>Email:</td><td><%= acc.getEmail() %></td></tr>
                    <tr><td>Full Name:</td><td><%= acc.getFullname() %></td><td><input type="text" name ="txtfullnameupdate"></td></tr>
                    <tr><td>Phone:</td><td><%= acc.getPhone() %></td><td><input type="text" name ="txtphoneupdate"></td></tr>
                    <tr><td></td><td></td><td colspan="2"><input type="submit" value ="updateProfileAccount" name="action"></td></tr>
                </table>
            </form>
            <%               
            }
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
