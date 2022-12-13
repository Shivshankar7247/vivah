<%-- 
    Document   : updateinfo
    Created on : 21 Oct, 2022, 11:31:05 AM
    Author     : Admin
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="updateinfo.css">
    </head>
    <body>
         <%
           
        String un=(String)session.getAttribute("un");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiv","shiv");
        Statement stmt=con.createStatement();
        ResultSet a=stmt.executeQuery("select profilefor,firstname,middlename,lastname,gender,dob,village,taluka,district,state,mobile,email,password from vivah where email='"+un+"'");
       
       %>
       <div class="box">
      
            <form  action="additioninfo.jsp" method="post">
                
            <center>
            <table border="2">
                <% while(a.next())
                {%>
                <tr><td>Profile for</td><td><input type="text" name="n1" value="<%=a.getString(1)%>" required></td></tr>
                <tr><td>First Name</td><td><input type="text" name="n2" value="<%=a.getString(2)%>" required></td></tr>
                <tr><td>Middle Name</td><td><input type="text" name="n3" value="<%=a.getString(3)%>" required></td></tr>
                <tr><td>Last Name</td><td><input type="text" name="n4" value="<%=a.getString(4)%>" required></td></tr>
                <tr><td>Gender</td><td><input type="text" name="n5" value="<%=a.getString(5)%>" required></td></tr>
                <tr><td>DOB</td><td><input type="text" name="n6" value="<%=a.getString(6)%>" placeholder="dd-mon-yyyy"required></td></tr>
                <tr><td>Village</td><td><input type="text" name="n7" value="<%=a.getString(7)%>" required></td></tr>
                <tr><td>Taluka</td><td><input type="text" name="n8" value="<%=a.getString(8)%>" required></td></tr>
                <tr><td>District</td><td><input type="text" name="n9" value="<%=a.getString(9)%>" required></td></tr>
                <tr><td>State</td><td><input type="text" name="n10" value="<%=a.getString(10)%>" required></td></tr>
                <tr><td>Mobile</td><td><input type="text" name="n11" pattern="[0-9]{10}" value="<%=a.getString(11)%>" required></td></tr>
                <tr><td>Email</td><td><input type="text" name="n12" placeholder="abc@gmail.com" value="<%=a.getString(12)%>" required></td></tr>
                <tr><td>Password</td><td><input type="text" name="n13" value="<%=a.getString(13)%>" required></td></tr>
                
                <% } %>
            </table>
            <br>
            <div class="cancel">
            <input type="submit" value="Save & Next"> <input type="reset" value="Cancel">
            </div>
                </form>
            </div>
    </body>
</html>
