<%-- 
    Document   : adddirector
    Created on : 25 Oct, 2022, 11:05:11 PM
    Author     : Admin
--%>

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
            String fname=request.getParameter("n2");
            String mname=request.getParameter("n3");
            String lname=request.getParameter("n4");
            String address=request.getParameter("n5");
            
        String username=request.getParameter("n6");
        String password=request.getParameter("n7");
        String mobile=request.getParameter("n8");
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiv","shiv");
        Statement stmt=con.createStatement();
        String sql="insert into vivahadmin values(jobid.nextval,'"+jobtype+"','"+fname+"','"+mname+"','"+lname+"','"+address+"','"+username+"','"+password+"','"+mobile+"',sysdate)";
        
        int a=stmt.executeUpdate(sql);
        out.println(sql);
        if(a>0)
        {
           response.sendRedirect("directorvalidation.jsp");
        }
        else
        {
        response.sendRedirect("adddirector.html");
        }
        %>
    </body>
</html>
