<%-- 
    Document   : searchbyeducation
    Created on : 25 Oct, 2022, 6:59:17 PM
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
        <link rel="stylesheet" href="searchbyeducation2.css">
    </head>
    <body>
        <div class="box">
       <form action="validation.jsp">
                <input type="submit" value="Back">
                </form>
        <%
        String education=request.getParameter("n1");
        String gender=request.getParameter("n2");
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiv","shiv");
        Statement stmt=con.createStatement();
        
        String sql="select *from vivah where education='"+education+"' and gender='"+gender+"' ";
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
