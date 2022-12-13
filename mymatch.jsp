<%-- 
    Document   : mymatch
    Created on : 23 Oct, 2022, 11:57:22 AM
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
        <link rel="stylesheet" href="mymatch.css">
    </head>
    <body>
        <%
            String un=(String)session.getAttribute("un");
         Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiv","shiv");
        Statement stmt=con.createStatement();
        ResultSet x=stmt.executeQuery("select state,district,education,cast,annualincome,occupation,age,gender from expections where email='"+un+"'");
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
        String sql="select *from vivah where state='"+state+"' and district='"+dist+"' and education='"+edu+"' and cast='"+cast+"' and annualincome="+income+" and occuption='"+occupation+"' and age="+age+" and gender='"+gender+"' ";
        ResultSet a=stmt.executeQuery(sql);
        
        
        %>
        <div class="box">
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
                <td><a href="viewall.jsp"><input type="submit" value="ViewAll"></a></td>
                
                </form>
                </tr>
                <%
                }
                %>
            </table>
         </box>   
    </body>
</html>
