<%-- 
    Document   : deleteemp
    Created on : 26 Oct, 2022, 6:36:52 PM
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
        <link rel="stylesheet" href="deleteemp1.css">
    </head>
    <body>
        <div class="box">
        <form action="directorvalidation.jsp">
                <input type="submit" value="Back">
                </form>
        <%
        String jobid=request.getParameter("n1");
        int jid=Integer.parseInt(jobid);
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiv","shiv");
        Statement stmt=con.createStatement();
        if(jid>1)
        {
        String sql="delete from vivahadmin where jobid='"+jobid+"' ";
        int i=stmt.executeUpdate(sql);
        
        if(i>0)
        {%>
          <h1>Employee Deleted</h1>
        <%}
        else
        {
            out.println("Wrong input the job id you entered does not exist");
        }
        }
        else
        {%>
            <h1>You cant delete director</h1>
        <%}
       %>
       </div>
    </body>
</html>
