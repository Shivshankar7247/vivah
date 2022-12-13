<%-- 
    Document   : additioninfo
    Created on : 21 Oct, 2022, 11:49:12 AM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="additioninfo.css">
    </head>
    <body><%
        
        String un=(String)session.getAttribute("un");
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
       String sql="update vivah set profilefor='"+pf+"',firstname='"+fn+"',middlename='"+mn+"',lastname='"+ln+"',gender='"+gender+"',dob='"+dob+"',village='"+village+"',taluka='"+taluka+"',"
               + "district='"+district+"',state='"+state+"',mobile='"+mob+"',email='"+email+"',password='"+password+"'"
               + " where email='"+un+"' ";
       
       int i=stmt.executeUpdate(sql);
       if(i>0)
      {
          
      }
      else
      {
          out.println("Sorry we are unable to update data");
      }
           
        ResultSet a=stmt.executeQuery("select email from uregistartion where email='"+un+"' and password='"+password+"'");
        if(a.next())
        {
            String unm=a.getString(1);
            session.setAttribute("un",unm);
                
        }
        
        ResultSet x=stmt.executeQuery("select education,occuption,annualincome,look,currentaddress,permanentaddress,PROPERTYDETAILS,car,farm,sibling,FATHEROCCUPTION,"
                + "TOTALFAMILYINCOME,cast,age from vivah where email='"+un+"' and password='"+password+"'");
        if(x.next())
        {
       %>
       <div class="box">
       <form action="extrainfo.jsp" method="post">
           <table border="2">
               <tr><td>Education</td><td><input type="text" name="t1" value="<%=x.getString(1)%>"></td></tr>
               <tr><td>Occupation</td><td><input type="text" name="t2" value="<%=x.getString(2)%>"></td></tr>
               <tr><td>Annual Income</td><td><input type="text" name="t3" value="<%=x.getLong(3)%>"></td></tr>
               <tr><td>Look</td><td><input type="text" name="t4" value="<%=x.getString(4)%>"></td></tr>
               <tr><td>Current Address</td><td><input type="text" name="t5" value="<%=x.getString(5)%>"></td></tr>
               <tr><td>Permanent Address</td><td><input type="text" name="t6" value="<%=x.getString(6)%>"></td></tr>
               <tr><td>Property Details</td><td><input type="text" name="t7" value="<%=x.getString(7)%>"></td></tr>
               <tr><td>Car</td><td><input type="text" name="t8" value="<%=x.getInt(8)%>"></td></tr>
               <tr><td>Farm in Acres</td><td><input type="text" name="t9" value="<%=x.getInt(9)%>"></td></tr>
               <tr><td>Siblings</td><td><input type="text" name="t10" value="<%=x.getString(10)%>"></td></tr>
               <tr><td>Father Occupation</td><td><input type="text" name="t11" value="<%=x.getString(11)%>"></td></tr>
               <tr><td>Total Family Income</td><td><input type="text" name="t12" value="<%=x.getLong(12)%>"></td></tr>
               <tr><td>Cast</td><td><input type="text" name="t13" value="<%=x.getString(13)%>"></td></tr>
               <tr><td>Age</td><td><input type="text" name="t14" value="<%=x.getInt(14)%>"></td></tr>
               
               </table>
               <br>
               <div class="update">
               <input type="submit" value="Update"><input type="reset" value="Cancel">
               </div>
           </form>
               </div>
       <%    
       }
       else
        {
        %>
        <form action="extrainfo.jsp" method="post">
           <table border="2">
               <tr><td>Education</td><td><input type="text" name="t1"></td></tr>
               <tr><td>Occupation</td><td><input type="text" name="t2"></td></tr>
               <tr><td>Annual Income</td><td><input type="text" name="t3"></td></tr>
               <tr><td>Look</td><td><input type="text" name="t4"></td></tr>
               <tr><td>Current Address</td><td><input type="text" name="t5"></td></tr>
               <tr><td>Permanent Address</td><td><input type="text" name="t6"></td></tr>
               <tr><td>Property Details</td><td><input type="text" name="t7"></td></tr>
               <tr><td>Car</td><td><input type="text" name="t8"></td></tr>
               <tr><td>Farm in Acres</td><td><input type="text" name="t9"></td></tr>
               <tr><td>Siblings</td><td><input type="text" name="t10"></td></tr>
               <tr><td>Father Occupation</td><td><input type="text" name="t11"></td></tr>
               <tr><td>Total Family Income</td><td><input type="text" name="t12"></td></tr>
               <tr><td>Cast</td><td><input type="text" name="t13"></td></tr>
               <tr><td>Age</td><td><input type="text" name="t14"></td></tr>
               <tr><td><input type="submit" value="Save & Next"></td><td><input type="reset" value="Cancel"></td></tr>
               </table>
           </form>
       <% }
        %>
    </body>
</html>
