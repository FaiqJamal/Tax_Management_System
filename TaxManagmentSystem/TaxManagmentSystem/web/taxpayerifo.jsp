<%-- 
    Document   : taxpayerifo
    Created on : Dec 17, 2021, 9:14:18 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Tax Payer Information</h1>
    <centre>
    
<%String url = "jdbc:mysql://127.0.0.1:3306/?user=root";
    String user = "root";
    String password = "Athlete14!";
    String s_cnic=request.getParameter("username");
    String cnic = (String)session.getAttribute("cnic");
    int cnic_i = Integer.parseInt(cnic);
    Connection conn = DriverManager.getConnection(url, user, password);
    Statement st = conn.createStatement();
    ResultSet rs;
    ResultSet rs1;
    String selectquery = "select * from tax_management_system.tax_payer where CNIC='"+cnic_i+"'";
    rs = st.executeQuery(selectquery);
    while(rs.next()){
        out.println("CNIC: "+rs.getString(1));
        out.println("Name: "+rs.getString(2));
        out.println("Email Address: "+rs.getString(3));
        out.println("Nationality: "+rs.getString(4));
        out.println("Residential Address: "+rs.getString(5));
    } 
    String query = "{CALL tax_management_system.property_tax(?)}";
   CallableStatement stmt1 = conn.prepareCall(query);
   stmt1.setInt(1,cnic_i);
   rs1=stmt1.executeQuery();
   while(rs1.next()){
       out.println("Property Total Tax: "+rs1.getString(1));
   }
   String queryIncome = "{CALL tax_management_system.income_tax(?)}";
   CallableStatement stmtIncome = conn.prepareCall(queryIncome);
   stmtIncome.setInt(1,cnic_i);
   ResultSet rsIncome;
   rsIncome=stmtIncome.executeQuery();
   if(rsIncome.next()){
       out.println("Income Total Tax: "+rsIncome.getString(1));
   }
   String querySales = "{CALL tax_management_system.sales_tax(?)}";
   CallableStatement stmtSales = conn.prepareCall(querySales);
   stmtSales.setInt(1,cnic_i);
   ResultSet rsSale;
   rsSale=stmtSales.executeQuery();
   if(rsSale.next()){
       out.println("Sales Total Tax: "+rsSale.getString(1));
   }
   String ActiveTaxquery = "select * from tax_management_system.active_tax_payer where CNIC='" + cnic_i + "' ";
   Statement stActive = conn.createStatement();
   ResultSet rsltActive;
   rsltActive = stActive.executeQuery(ActiveTaxquery);
   if(rsltActive.next()){
       out.println("Active Tax Payer!");
   }
   else{
       out.println(" Not Active Tax Payer!");
   }

%>


    </centre>
    </body>
</html>
