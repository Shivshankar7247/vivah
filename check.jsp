<%-- 
    Document   : adminlogin.jsp
    Created on : 25 Oct, 2022, 8:48:43 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
        String jobtype=request.getParameter("n1");
        String username=request.getParameter("n2");
        String password=request.getParameter("n3");
        session.setAttribute("username", username);
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiv","shiv");
        Statement stmt=con.createStatement();
        
        
        int a=stmt.executeUpdate("update vivahadmin set lastlogindate=sysdate where jobtype='"+jobtype+"' and username='"+username+"' and password='"+password+"'");
        if(jobtype.equals("director") && a>0)   
        {
            
            response.sendRedirect("directorvalidation.jsp");
        }
        else if(jobtype.equals("manager") && a>0)
        {
            response.sendRedirect("managervalidation.jsp");
        }
        else if(jobtype.equals("salesexecutive") && a>0)
        {
            response.sendRedirect("salesexecutivevalidation.jsp");
        }
        else if(jobtype.equals("customersupport") && a>0)
        {
            response.sendRedirect("customersupportvalidation.jsp");
        }
        else
        {
            response.sendRedirect("adminlogin.html");
        }
        %>
    </body>
</html>
