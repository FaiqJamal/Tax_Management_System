<%-- 
    Document   : UpdateSalesSql
    Created on : Dec 16, 2021, 12:21:09 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.io.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<%  String cnic = request.getParameter("cnic");
    String type = request.getParameter("type");
    String bankaccount = request.getParameter("bankaccount");
    int consumernumber = Integer.parseInt(request.getParameter("consumernumber"));
    String businessname = request.getParameter("businessname");
    String AccusitionDate = request.getParameter("AccusitionDate");
    String businessactivity = request.getParameter("businessactivity");
    String goods = request.getParameter("goods");
    String quantity = request.getParameter("quantity");
    String totalvalue = request.getParameter("totalvalue");
    String url = "jdbc:mysql://127.0.0.1:3306/?user=root";
    String user = "root";
    String password = "Athlete14!";
   
    Connection conn = DriverManager.getConnection(url, user, password);
    Statement st1 = conn.createStatement();
    Statement st = conn.createStatement();
    Statement st2 = conn.createStatement();
    Statement st3 = conn.createStatement();
    ResultSet rslt;
    String selectquery = "select * from tax_management_system.tax_payer where CNIC='" + cnic + "' ";
    rslt = st1.executeQuery(selectquery);
    if(rslt.next()){
        int i = st.executeUpdate("insert into tax_management_system.sales_tax (consumer_num,reg_type,bank_account,CNIC) "
                + "values('"+consumernumber+"','"+type+"','"+bankaccount+"','"+cnic+"')");
        int p = st2.executeUpdate("insert into tax_management_system.goods_details(description,quantity,value,consumer_num) "
                + "values('"+goods+"','"+quantity+"','"+totalvalue+"','"+consumernumber+"')");
        int q = st3.executeUpdate("insert into tax_management_system.business_details(business_name,acquisition_date,business_activity,consumer_num) "
                + "values('"+businessname+"','"+AccusitionDate+"','"+businessactivity+"','"+consumernumber+"')");
        
        %>
<script>
alert("Record Updated in Sales Table");
window.location.href="UpdateSales.jsp";
</script>
<%

    }
else{
%>
<script>
alert("No Record Found in Tax Payer List, Try again");
window.location.href="UpdateSales.jsp";
</script>
<%
}
        

%>