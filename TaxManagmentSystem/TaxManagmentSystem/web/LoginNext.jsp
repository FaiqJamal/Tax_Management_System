<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.io.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<%  String s_cnic = request.getParameter("username");
    String passw = request.getParameter("password");
    String userType = request.getParameter("userType");
    
    int cnic = Integer.parseInt(s_cnic);
    session.setAttribute("cnic",s_cnic);
    
    String url = "jdbc:mysql://127.0.0.1:3306/?user=root";
    String user = "root";
    String password = "Athlete14!";
    
    Connection conn = DriverManager.getConnection(url, user, password);
    Statement st = conn.createStatement();
    ResultSet rslt;
    
    
    if(userType.equals("Admin Officer")){
 
    String selectquery = "select * from tax_management_system.admin where CNIC='" + cnic + "' and password='" + passw + "'";
    rslt = st.executeQuery(selectquery);
    if(rslt.next()){
       %>
<script>
alert("Record Found in Admin Table");
window.location.href="admin.jsp";
</script>
<%} 
    else {%>
<script>
alert("No Record Found in Admin Table, Try again");
window.location.href="login.jsp";
</script>
<%} }

else if(userType.equals("Taxpayer")){
String selectquery = "select * from tax_management_system.usertaxpayer where CNIC='" + cnic + "' and password='" + passw + "'";
    rslt = st.executeQuery(selectquery);
    if(rslt.next()){
       %>
<script>
alert("Record Found in User Table");
window.location.href="TaxPayerStatus.jsp";
</script>
<%} 
    else {%>
<script>
alert("No Record Found in User Table, Try again");
window.location.href="login.jsp";
</script>
<%}
}

else if(userType.equals("Accountant")){
  String selectquery = "select * from tax_management_system.accountant where CNIC='" + cnic + "' and password='" + passw + "'";
    rslt = st.executeQuery(selectquery);
    if(rslt.next()){
       %>
<script>
alert("Record Found in Accountant Table");
window.location.href="Accountant.jsp";
</script>
<%} 
    else {%>
<script>
alert("No Record Found in Accountant Table, Try again");
window.location.href="login.jsp";
</script>
<%}
}



%>
