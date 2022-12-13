<%-- 
    Document   : logout
    Created on : 21 Oct, 2022, 11:26:21 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        session.setAttribute("un",null);
        session.invalidate();
        response.sendRedirect("index.html");
        %>
    </body>
</html>
