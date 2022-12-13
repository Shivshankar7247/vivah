<%-- 
    Document   : searchbyname
    Created on : 25 Oct, 2022, 5:39:09 PM
    Author     : Admin
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="searchbyname2.css">
     </head>
    <body>
        <div class="box">
        <form action="validation.jsp">
                <input type="submit" value="Back">
                </form>
        <%
        String fname=request.getParameter("n1");
        String lname=request.getParameter("n2");
        String gender=request.getParameter("n3");
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiv","shiv");
        Statement stmt=con.createStatement();
        
        String sql="select *from vivah where gender='"+gender+"' and firstname='"+fname+"' and lastname='"+lname+"' ";
        ResultSet a=stmt.executeQuery(sql);
        
        
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
             while(a.next())
             {
             %>
             <tr>
                 <form action="viewall.jsp" method="post">
                <td><input type="text" value="<%=a.getString(13)%>" name="n1"></td>
                <td><%=a.getString(3)%></td>
                <td><%=a.getString(5)%></td>
                <td><%=a.getInt(28)%></td>
                <td><%=a.getString(6)%></td>
                <td><%=a.getLong(17)%></td>
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
