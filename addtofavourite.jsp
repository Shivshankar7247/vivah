<%-- 
    Document   : addtofavourite
    Created on : 26 Oct, 2022, 10:47:54 PM
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
            String un=(String)session.getAttribute("un");
            String emailid=request.getParameter("n1");
         Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiv","shiv");
        Statement stmt=con.createStatement();
        ResultSet x=stmt.executeQuery("insert into favourite values('"+emailid+"','"+un+"')");
        String state="",dist="",edu="",cast="",occupation="",gender="";
        long income=0,age=0;
        while(x.next())
        {
            state=x.getString(1);
            dist=x.getString(2);
            edu=x.getString(3);
            cast=x.getString(4);
            income=x.getLong(5);
            occupation=x.getString(6);
            age=x.getInt(7);
            gender=x.getString(8);
        }
        %>
    </body>
</html>
