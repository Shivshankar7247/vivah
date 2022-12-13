<%-- 
    Document   : viewallemp
    Created on : 26 Oct, 2022, 6:08:03 PM
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
        <link rel="stylesheet" href="viewallemp.css">
    </head>
    <body>
        <%
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiv","shiv");
        Statement stmt=con.createStatement();
        ResultSet i=stmt.executeQuery("select *from vivahadmin");
        %>
        <div class="box">
         <table border="2">
             <tr>
             <td>JOBID</td>
             <td>JOBTYPE</td>
             <td>FIRST NAME</td>
             <td>MIDDLE NAME</td>
             <td>LAST NAME</td>
             <td>ADDRESS</td>
             <td>MOBILE</td>
             <td>LASTLOGINDATE</td>
             </tr>
        <%
            while(i.next())
        {%>
             <tr>
                 <td><%=i.getInt(1)%></td>
                 <td><%=i.getString(2)%></td>
                 <td><%=i.getString(3)%></td>
                 <td><%=i.getString(4)%></td>
                 <td><%=i.getString(5)%></td>
                 <td><%=i.getString(6)%></td>
                 
                 <td><%=i.getString(9)%></td>
                 <td><%=i.getString(10)%></td>
             </tr>
        <%
        }
        %>
             </table>
             </div>
    </body>
</html>
