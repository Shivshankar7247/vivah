<%-- 
    Document   : vivahregister
    Created on : 21 Oct, 2022, 10:26:44 AM
    Author     : Admin
--%>

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
       String pf=request.getParameter("n1");
       String fn=request.getParameter("n2");
       String mn=request.getParameter("n3");
       String ln=request.getParameter("n4");
       String gender=request.getParameter("n5");
       String dob=request.getParameter("n6");
       String village=request.getParameter("n7");
       String taluka=request.getParameter("n8");
       String district=request.getParameter("n9");
       String state=request.getParameter("n10");
       String mob=request.getParameter("n11");
       String email=request.getParameter("n12");
       String password=request.getParameter("n13");
       
       Class.forName("oracle.jdbc.driver.OracleDriver");
       Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiv","shiv");
       Statement stmt=con.createStatement();
       String sql = "insert into vivah (userid,profilefor,firstname,middlename,lastname,gender,dob,village,taluka,district,state,mobile,email,password) values (userid.nextval,'"+pf+"','"+fn+"','"+mn+"','"+ln+"','"+gender+"','"+dob+"','"+village+"','"+taluka+"','"+district+"','"+state+"','"+mob+"','"+email+"','"+password+"')";
       out.print(sql);
       int i=stmt.executeUpdate(sql);
       if(i>0)
       {
       response.sendRedirect("userlogin.html");
       
       }
       else
       {
       response.sendRedirect("vivahregister.html");
       }
       %>
    </body>
</html>
