<%-- 
    Document   : UpdateVehicleSql
    Created on : Dec 16, 2021, 9:28:27 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.io.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<%  String cnic = request.getParameter("cnic");
    int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
    int enginesize = Integer.parseInt(request.getParameter("enginesize"));
    String RegistrationDate = request.getParameter("RegistrationDate");
    String paymentstatus = "unpaid";
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
        int i = st.executeUpdate("insert into tax_management_system.vehicle_tax(vehicle_id,engine_size,date_registeration,CNIC,payment_status) "
                + "values ('"+vehicleId+"','"+enginesize+"','"+RegistrationDate+"','"+cnic+"','"+paymentstatus+"')");
        %>
<script>
alert("Record Updated in Vehicle Table");
window.location.href="UpdateVehicle.jsp";
</script>
<%

    }
else{
%>
<script>
alert("No Record Found in Tax Payer Table, Try again");
window.location.href="UpdateVehicle.jsp";
</script>
<%
}
        

%>
