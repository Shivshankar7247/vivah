<%-- 
    Document   : userlogin
    Created on : 21 Oct, 2022, 11:13:47 AM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         String un=request.getParameter("n1");
        String ps=request.getParameter("n2");
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiv","shiv");
        Statement stmt=con.createStatement();
        ResultSet a=stmt.executeQuery("select * from vivah where email='"+un+"' and password='"+ps+"'");
        if(a.next())
        {
            session.setAttribute("un",un);
            response.sendRedirect("validation.jsp");
        }
        else
        {
            out.println("Invalid Username or Password <a href='userlogin.html'>Try Again</a>");
        }
        %>
        
       
    </body>
</html>
