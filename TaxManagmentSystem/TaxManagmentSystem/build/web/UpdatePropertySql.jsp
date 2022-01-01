<%-- 
    Document   : UpdatePropertySql
    Created on : Dec 13, 2021, 8:35:00 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.io.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<%  String cnic = request.getParameter("cnic");
    float value = Integer.parseInt(request.getParameter("value"));
    float landsize = Integer.parseInt(request.getParameter("landsize"));
    String propertyaddress = request.getParameter("propertyaddress");
    String unpaid = "unpaid";
    String url = "jdbc:mysql://127.0.0.1:3306/?user=root";
    String user = "root";
    String password = "Athlete14!";
   
    Connection conn = DriverManager.getConnection(url, user, password);
    Statement st1 = conn.createStatement();
    Statement st = conn.createStatement();
    ResultSet rslt;
    String selectquery = "select * from tax_management_system.tax_payer where CNIC='" + cnic + "' ";
    rslt = st1.executeQuery(selectquery);
    if(rslt.next()){
        int i = st.executeUpdate("insert into tax_management_system.property_tax(annual_value,land_size,address,payment_status,CNIC) "
            + "values('"+value+"','"+landsize+"','"+propertyaddress+"','"+unpaid+"','"+cnic+"')");
        %>
<script>
alert("Record Updated in Property Table");
window.location.href="UpdateProperty.jsp";
</script>
<%

    }
else{
%>
<script>
alert("No Record Found in Property Table, Try again");
window.location.href="UpdateProperty.jsp";
</script>
<%
}
        

%>
