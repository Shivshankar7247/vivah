<%-- 
    Document   : myprofile
    Created on : 23 Oct, 2022, 9:42:51 AM
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
        
        <link rel="stylesheet" href="myprofile.css">
    </head>
    <body>
         <%
           
        String un=(String)session.getAttribute("un");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiv","shiv");
        Statement stmt=con.createStatement();
        ResultSet x=stmt.executeQuery("select *from vivah where email='"+un+"'");
       
        while(x.next())
        {
       %>
       <div class="box">
         <center>
             <form action="" method="post" id="information">
           <table border="2" >
               <tr><td>User Id</td><td><input type="text" value="<%=x.getString(1)%>" required></td></tr
               <tr><td>Profile for</td><td><input type="text" value="<%=x.getString(2)%>" required></td></tr>
                <tr><td>First Name</td><td><input type="text" value="<%=x.getString(3)%>" required></td></tr>
                <tr><td>Middle Name</td><td><input type="text" value="<%=x.getString(4)%>" required></td></tr>
                <tr><td>Last Name</td><td><input type="text" value="<%=x.getString(5)%>" required></td></tr>
                <tr><td>Gender</td><td><input type="text" value="<%=x.getString(6)%>" required></td></tr>
                <tr><td>DOB</td><td><input type="text" value="<%=x.getString(7)%>" placeholder="dd-mon-yyyy" required></td></tr>
                <tr><td>Village</td><td><input type="text" value="<%=x.getString(8)%>" required></td></tr>
                <tr><td>Taluka</td><td><input type="text" value="<%=x.getString(9)%>" required></td></tr>
                <tr><td>District</td><td><input type="text" value="<%=x.getString(10)%>" required></td></tr>
                <tr><td>State</td><td><input type="text" value="<%=x.getString(11)%>" required></td></tr>
                <tr><td>Mobile</td><td><input type="text" pattern="[0-9]{10}" value="<%=x.getString(12)%>" required></td></tr>
                <tr><td>Email</td><td><input type="text" value="<%=x.getString(13)%>" required></td></tr>
                
               <tr><td>Education</td><td><input type="text" value="<%=x.getString(15)%>"></td></tr>
               <tr><td>Occupation</td><td><input type="text" value="<%=x.getString(16)%>"></td></tr>
               <tr><td>Annual Income</td><td><input type="text" value="<%=x.getString(17)%>"></td></tr>
               <tr><td>Look</td><td><input type="text" value="<%=x.getString(18)%>"></td></tr>
               <tr><td>Current Address</td><td><input type="text" value="<%=x.getString(19)%>"></td></tr>
               <tr><td>Permanent Address</td><td><input type="text" value="<%=x.getString(20)%>"></td></tr>
               <tr><td>Property Details</td><td><input type="text" value="<%=x.getString(21)%>"></td></tr>
               <tr><td>Car</td><td><input type="text" value="<%=x.getString(22)%>"></td></tr>
               <tr><td>Farm in Acres</td><td><input type="text" value="<%=x.getString(23)%>"></td></tr>
               <tr><td>Siblings</td><td><input type="text" value="<%=x.getString(24)%>"></td></tr>
               <tr><td>Father Occupation</td><td><input type="text" value="<%=x.getString(25)%>"></td></tr>
               <tr><td>Total Family Income</td><td><input type="text" value="<%=x.getString(26)%>"></td></tr>
               <tr><td>Cast</td><td><input type="text" value="<%=x.getString(27)%>"></td></tr>
               <tr><td>Age</td><td><input type="text" value="<%=x.getString(28)%>"></td></tr>
               
               </table>
               </form>
               <button onclick="window.print()">Print</button>
               </div>
               
               <%
                   }

%>

    </body>
</html>
