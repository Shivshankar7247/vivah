<%-- 
    Document   : validation
    Created on : 21 Oct, 2022, 11:18:48 AM
    Author     : Admin
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="validation.css">
    </head>
    <body>
        <%
        if((session.getAttribute("un")== null) || (session.getAttribute("un")==" "))
        {%>
        
        You are not logged in <a href="userlogin.html">Please Try Again</a>
        <%
        }
        else
        {
        %>
        <div class="main">
        <ul>
        <li><a href="myprofile.jsp">My Profile</a></li>
        <li><a href="mymatch.jsp">My match</a></li>
        <li><a href="updateinfo.jsp">Update Profile</a></li>
        <li><a href="expections.html">Exceptions</a></li>
        <li><a href="#">Search</a>
            <div class="sub-search">
            <ul>
                <li><a href="searchbyname.html">Search By Name</a></li>
                <li><a href="searchbyeducation.html">Search By Education</a></li>
                <li><a href="searchbydistrict.html">Search By District</a></li>
                <li><a href="searchbymatch.html">Search By Match</a></li>
           </ul>
            </div>
            
            </li>
        <li><a href="logout.jsp">Log Out</a></li>
        </ul>
        </div>
        <h1 class="username">Welcome <%=session.getAttribute("un")%></h1>
                <%
        }
%>
        
       
    </body>
</html>
