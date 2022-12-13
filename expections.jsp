<%-- 
    Document   : expections
    Created on : 22 Oct, 2022, 9:33:58 PM
    Author     : Admin
--%>

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
        String un=(String)session.getAttribute("un");
        String state=request.getParameter("n1");
        String district=request.getParameter("n2");
        String education=request.getParameter("n3");
        String cast=request.getParameter("n4");
        String ai=request.getParameter("n5");
        String occupation=request.getParameter("n6");
        String a=request.getParameter("n7");
        String gender=request.getParameter("n8");
        long aincome=Long.parseLong(ai);
        long age=Long.parseLong(a);
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiv","shiv");
        Statement stmt=con.createStatement();
        int x=stmt.executeUpdate("insert into expections values ('"+un+"','"+state+"','"+district+"','"+education+"','"+cast+"',"+aincome+",'"+occupation+"',"+age+",'"+gender+"')"); 
        if(x>0)
        {
             response.sendRedirect("validation.jsp");
        }
        else
        {
            out.println("Sorry we are unable to update expections");
            response.sendRedirect("expections.html");
        }
        %>
    </body>
</html>
