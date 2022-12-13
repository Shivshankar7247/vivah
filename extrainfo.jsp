<%-- 
    Document   : extrainfo
    Created on : 21 Oct, 2022, 12:19:15 PM
    Author     : Admin
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
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
        String education=request.getParameter("t1");
        String occupation=request.getParameter("t2");
        String aincome=request.getParameter("t3");
        String look=request.getParameter("t4");
        String ca=request.getParameter("t5");
        String pa=request.getParameter("t6");
        String property=request.getParameter("t7");
        String car=request.getParameter("t8");
        String farm=request.getParameter("t9");
        String sibling=request.getParameter("t10");
        String foccupation=request.getParameter("t11");
        String totalfamilyincome=request.getParameter("t12");
        String cast=request.getParameter("t13");
        String a=request.getParameter("t14");
        Long ai=Long.parseLong(aincome);
        int ncar=Integer.parseInt(car);
        int nfarm=Integer.parseInt(farm);
        long tfa=Long.parseLong(totalfamilyincome);
        int age=Integer.parseInt(a);
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiv","shiv");
        Statement stmt=con.createStatement();
        
        String sql="update vivah set education='"+education+"',occuption='"+occupation+"',annualincome="+ai+",look='"+look+"',currentaddress='"+ca+"',permanentaddress='"+pa+"',PROPERTYDETAILS='"+property+"',car="+ncar+",farm="+nfarm+",sibling='"+sibling+"',FATHEROCCUPTION='"+foccupation+"',TOTALFAMILYINCOME="+tfa+",cast='"+cast+"',age="+age+" where email='"+un+"' ";
        int i=stmt.executeUpdate(sql);
        
       
       if(i>0)
       {
          response.sendRedirect("validation.jsp");
       }
       else
       {
       response.sendRedirect("updateinfo.jsp");
       }
        %>
    </body>
</html>
