<%-- 
    Document   : searchbydistrict
    Created on : 25 Oct, 2022, 6:08:57 PM
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
        <link rel="stylesheet" href="searchbymatch2.css">
    </head>
    <body>
        <div class="box">
        <form action="validation.jsp">
                <input type="submit" value="Back">
                </form>
        <%
        
        String state=request.getParameter("n1");
        String district=request.getParameter("n2");
        String education=request.getParameter("n3");
        String cast=request.getParameter("n4");
        String a=request.getParameter("n5");
        String gender=request.getParameter("n6");
        
        long age=Long.parseLong(a);
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiv","shiv");
        Statement stmt=con.createStatement();
        String sql="select *from vivah where state='"+state+"' and district='"+district+"' and education='"+education+"' and cast='"+cast+"' and age="+age+" and gender='"+gender+"' ";
        ResultSet x=stmt.executeQuery(sql);
        
        %>
        
          <table border="2">
             <tr>
                 <th>Email</th>
                <th>Fname</th>
                <th>Lname</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Annual Income</th>
                <th>View</th>
             </tr>
             <%
                 
             while(x.next())
             {
             %>
             <tr>
                 <form action="viewall.jsp" method="post">
                <td><input type="text" value="<%=x.getString(13)%>" name="n1"></td>
                <td><%=x.getString(3)%></td>
                <td><%=x.getString(5)%></td>
                <td><%=x.getInt(28)%></td>
                <td><%=x.getString(6)%></td>
                <td><%=x.getLong(17)%></td>
                <td><a href="viewall.jsp"><input type="submit" value="viewall"></a></td>
                </form>
                </tr>
                <%
                }
                %>
            </table>
            </div>
            
    </body>
</html>
