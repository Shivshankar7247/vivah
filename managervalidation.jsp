<%-- 
    Document   : managervalidation
    Created on : 25 Oct, 2022, 10:57:16 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="managervalidation.css">
    </head>
    <body>
         <%
        if((session.getAttribute("username")== null) || (session.getAttribute("username")==" "))
        {%>
        You are not logged in <a href="adminlogin.html">Please Try Again</a>
        <%
        }
        else
        {
        %>
        <div class="main">
        <h1>Welcome <%=session.getAttribute("username")%></h1>
        <ul>
        <li><a href="addmanager.html">Add Employee</a></li>
        <li><a href="viewallemp.jsp">View All Employee</a></li>
        <li><a href="viewparticular.html">View Particular Employee</a></li>
        <li><a href="searchbyjob.html">Search By Job</a></li>
        <li><a href="deleteemp.html">Delete Employee</a></li>
        <li><a href="logout.jsp">Logout</a></li>
        </ul>
        <div>
        <%
        }
        %>
    </body>
</html>
