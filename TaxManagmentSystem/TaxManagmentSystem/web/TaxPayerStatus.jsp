<%-- 
    Document   : Accountant
    Created on : Dec 10, 2021, 11:08:52 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.io.*" %>

<!DOCTYPE html>
<html>

    <head>
        <title>Taxpayer info status</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--css-->
        <!--boostrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!--background-->
        <link rel="stylesheet" href="bg.css" >

        <!--navbar-->
        <link rel="stylesheet" href="navbar.css" >
    </head>


    <style type= "text/css">

        /*css for this file*/

        h1{
            color:whitesmoke;
            font-size:50px;                
            font-family: "Montserrat";
            text-transform: none;
            padding-top: 100px;
            padding-bottom: 0px;

        }
        body{
            background-attachment: fixed;

        }

        .container{

            color:white;
        }
    </style>
    <body>


        <!--nabar-->
        <div class="navbar">
            <ul>            

                <li><a href=taxpayer.jsp" >Back</a></li>
                <li><a href="login.jsp">Logout</a></li>    

            </ul>
        </div>

        <h1 style="text-align:center">Tax Payer Information</h1>
        <div class = "container" style="text-align: center">
            <div class="row">
                <!--column 1-->
                <div class="container col-md-5"  >

                    <!--table 1-->
                    <table class="table table-sm">
                        <br>
                        <h4 style="text-align:center; font-size:20px">Vehicle Tax</h4>


                        <thead>
                            <tr>
                                <!--entities of table-->
                                <th scope="col" style="font-size:15px; width: 80px  ">Total Tax</th>
                                <th scope="col" style="font-size:15px">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% String url = "jdbc:mysql://127.0.0.1:3306/?user=root";
                                    String user = "root";
                                    String password = "Athlete14!";
                                    String s_cnic = request.getParameter("username");
                                    String cnic = (String) session.getAttribute("cnic");
                                    int cnic_i = Integer.parseInt(cnic);
                                    Connection conn = DriverManager.getConnection(url, user, password);
                                    ResultSet rsVehicleStatus;
                                    ResultSet rs3;
                                    String Vehiclestatus = "select payment_status from tax_management_system.vehicle_tax where CNIC='" + cnic_i + "' and payment_status='paid';";
                                    Statement stVehicle = conn.createStatement();
                                    rsVehicleStatus = stVehicle.executeQuery(Vehiclestatus);
                                    float vehicleTotal=0;
                                    String vehicle = "select engine_size from tax_management_system.vehicle_tax where CNIC='" + cnic_i + "'";
                                    Statement st3 = conn.createStatement();
                                    rs3 = st3.executeQuery(vehicle);
                                    while (rs3.next()) {
                                        String queryV = "{CALL tax_management_system.vehicle_tax_active(?)}";
                                        CallableStatement stmtVehicle = conn.prepareCall(queryV);
                                        int engineSize=Integer.parseInt(rs3.getString(1));
                                        stmtVehicle.setInt(1, engineSize);
                                        ResultSet rsVehicle;
                                        rsVehicle = stmtVehicle.executeQuery();
                                        if (rsVehicle.next()) {
                                            int tax= Integer.parseInt(rsVehicle.getString(1));
                                            vehicleTotal+=tax;
                                        }
                                    }
                               

                                if (rsVehicleStatus.next ()) {

                            %>
                            <tr>
                                <!--filling in the table-->
                                <td><%=vehicleTotal%></td>
                                <td><%=rsVehicleStatus.getString(1)%></td> 
                            </tr>
                            <% } else{%>
                            <tr>
                                <!--filling in the table-->
                                <td><%=vehicleTotal%></td>
                                <td>Unpaid</td> 
                            </tr>
                            <% } %>
                            
                        </tbody>
                    </table>
                    <table class="table table-sm">

                        <h4 style="text-align:center; font-size:20px">Property Tax</h4>


                        <thead>
                            <tr>
                                <!--entities of table-->
                                <th scope="col" style="font-size:15px; width: 80px  ">Total Tax</th>
                                <th scope="col" style="font-size:15px">Status</th>
                            </tr>
                        </thead>
                        <tbody> <%
                            Statement st = conn.createStatement();
                            ResultSet rs1;
                            ResultSet rs2;
                            String status = "select payment_status from tax_management_system.property_tax where CNIC='" + cnic_i + "' and payment_status='paid';";
                            Statement stproperty = conn.createStatement();
                            rs2  = stproperty.executeQuery(status);
                            String query = "{CALL tax_management_system.property_tax(?)}";
                            CallableStatement stmt1 = conn.prepareCall(query);

                            stmt1.setInt (
                            1, cnic_i);
                            rs1  = stmt1.executeQuery();
                            %>
                            <%
                                if (rs1.next () 
                                    && rs2.next()) {
                            %>
                            <tr>
                                <!--filling in the table-->
                                <td><%=rs1.getString(1)%></td>
                                <td><%=rs2.getString(1)%></td> 
                            </tr>
                            <% }

                                else if (rs1.next () 
                                    ) {
                            %>
                            <tr>
                                <!--filling in the table-->
                                <td><%=rs1.getString(1)%></td>
                                <td>Unpaid</td> 
                            </tr>
                            <%}

                                
                                
                                else {
                            %>
                            <tr>
                                <!--filling in the table-->
                                <td>0</td>
                                <td>Unpaid</td> 
                            </tr>
                            <% }%>


                        </tbody>
                    </table>
                    <table class="table table-sm">

                        <h4 style="text-align:center; font-size:20px">Income Tax</h4>


                        <thead>
                            <tr>
                                <!--entities of table-->
                                <th scope="col" style="font-size:15px; width: 80px  ">Total Tax</th>
                                <th scope="col" style="font-size:15px">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%String queryIncome = "{CALL tax_management_system.income_tax(?)}";
                                CallableStatement stmtIncome = conn.prepareCall(queryIncome);

                                stmtIncome.setInt (
                                1, cnic_i);
                                ResultSet rsIncome;
                                ResultSet rsIncomeStatus;
                                rsIncome  = stmtIncome.executeQuery();
                                String stIncomeStatus = "select payment_status from tax_management_system.income_tax where CNIC='" + cnic_i + "' and payment_status='paid';";
                                Statement stIncome = conn.createStatement();
                                rsIncomeStatus  = stIncome.executeQuery(stIncomeStatus);

                                if (rsIncome.next () 
                                    && rsIncomeStatus.next()) {
                            %>
                            <tr>
                                <!--filling in the table-->
                                <td><%=rsIncome.getString(1)%></td>
                                <td><%=rsIncomeStatus.getString(1)%></td> 
                            </tr>
                            <% }

                                else if (rsIncome.next () 
                                    ) {
                            %>
                            <tr>
                                <!--filling in the table-->
                                <td><%=rsIncome.getString(1)%></td>
                                <td>Unpaid</td> 
                            </tr>
                            <%}

                                
                                
                                else {
                            %>
                            <tr>
                                <!--filling in the table-->
                                <td>0</td>
                                <td>Unpaid</td> 
                            </tr>
                            <% }%>

                        </tbody>
                    </table>
                    <table class="table table-sm">

                        <h4 style="text-align:center; font-size:20px">Sales Tax</h4>


                        <thead>
                            <tr>
                                <!--entities of table-->
                                <th scope="col" style="font-size:15px; width: 80px  ">Total Tax</th>
                                <th scope="col" style="font-size:15px">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% String querySales = "{CALL tax_management_system.sales_tax(?)}";
                                CallableStatement stmtSales = conn.prepareCall(querySales);

                                stmtSales.setInt (
                                1, cnic_i);
                                ResultSet rsSale;
                                ResultSet rsSaleStatus;
                                rsSale  = stmtSales.executeQuery();
                                String stSalesStatus = "select payment_status from tax_management_system.sales_tax where CNIC='" + cnic_i + "' and payment_status='paid';";
                                Statement stSales = conn.createStatement();
                                rsSaleStatus  = stIncome.executeQuery(stIncomeStatus);

                                if (rsSale.next () 
                                    && rsSaleStatus.next()) {

                            %>
                            <tr>
                                <!--filling in the table-->
                                <td><%=rsSale.getString(1)%></td>
                                <td><%=rsSaleStatus.getString(1)%></td> 
                            </tr>
                            <% }

                                else if (rsIncome.next () 
                                    ) {
                            %>
                            <tr>
                                <!--filling in the table-->
                                <td><%=rsSale.getString(1)%></td>
                                <td>Unpaid</td> 
                            </tr>
                            <%}

                                
                                
                                else {
                            %>
                            <tr>
                                <!--filling in the table-->
                                <td>0</td>
                                <td>Unpaid</td> 
                            </tr>
                            <% }%>


                        </tbody>
                    </table>
                    <table class="table table-sm">

                        <h4 style="text-align:center; font-size:20px">Active Taxpayer</h4>


                        <thead>
                            <tr>
                                <!--entities of table-->

                                <th scope="col" style="font-size:15px">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String ActiveTaxquery = "select * from tax_management_system.active_tax_payer where CNIC='" + cnic_i + "' ";
                                Statement stActive = conn.createStatement();
                                ResultSet rsltActive;
                                rsltActive  = stActive.executeQuery(ActiveTaxquery);

                                if (rsltActive.next () 
                                

                                
                                
                            ) {
                            %>
                            <tr>
                                <!--filling in the table-->

                                <td>Active Tax Payer</td> 
                            </tr>
                            <% } else {%>
                            <tr>
                                <!--filling in the table-->

                                <td>Non-Active Tax Payer</td> 
                            </tr>
                            <%}%>

                        </tbody>
                    </table>

                </div>

                <!--column 2-->

            </div>
        </div>

        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
