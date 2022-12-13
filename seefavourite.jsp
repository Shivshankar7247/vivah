<%-- 
    Document   : seeaddfavourite
    Created on : 26 Oct, 2022, 11:10:08 PM
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
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiv","shiv");
        Statement stmt=con.createStatement();
        String sql="select *from favourite where '"+un+"' ";
        ResultSet a=stmt.executeQuery(sql);
        
        
        %>
             <table border="2">
             <tr>
                 <th>Email</th>
                
                <th>View</th>
             </tr>
             <%
             while(a.next())
             {
             %>
             <tr>
                 <form action="viewall.jsp" method="post">
                <td><input type="text" value="<%=a.getString(13)%>" name="n1"></td>
                
                <td><a href="viewall.jsp"><input type="submit" value="viewall"></a></td>
                </form>
                </tr>
                <%
                }
                %>
    </body>
</html>
