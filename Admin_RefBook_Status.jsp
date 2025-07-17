<!-- Insert and Update status for Refill Booking request JSP PAGE (Update Page) -->


<%-- 
    Document   : Admin_RefBook_Status
    Created on : Apr 24, 2025, 9:55:26 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="Admin_RefBook_Status.html" %>

<form method="post">
    <fieldset>
        <table>
            <tr>
                <th colspan="2"> <h2>Refill Booking Request Status Update</h2> <hr></th>
            </tr>
            <tr>
                <th><label for="Consumer_id">Consumer id: </label></th>
                <td><input type="number" name="Consumer_id" id="Consumer_id" required style="height: 25px"></td>
            </tr>
            <tr>
                <th><label for="dil_status">Delivery Status: </label></th>
                <td><input type="text" name="dil_status" id="dil_status" required style="height: 25px"></td>
            </tr>
            <tr>
                <th><label for="details">Details: </label></th>
                <td><textarea style="width:80%; height: 25px" name="details" id = "details" required></textarea></td>
            </tr>
            <tr>
                <th><label for="dil_date">Delivery Date: </label></th>
                <td><input type="date" name="dil_date" id="dil_date" required style="height: 25px"></td>
            </tr>
<%
    if("POST".equalsIgnoreCase(request.getMethod())){
        String Consumer_id = request.getParameter("Consumer_id");
        String dil_status = request.getParameter("dil_status");
        String details = request.getParameter("details");
        String dil_date = request.getParameter("dil_date");

        if (Consumer_id != null && dil_status != null && details != null && dil_date != null){
            try{
                String url = "jdbc:mysql://localhost:3306/refillmanagement";
                String username = "root";
                String password = "Aney@2612";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection(url, username, password); 

                String query = "INSERT INTO refillbookpos (Consumer_id, dil_status, details, dil_date) VALUES (?,?,?,?)";
                PreparedStatement stmt= conn.prepareStatement(query);
                stmt.setString(1, Consumer_id);
                stmt.setString(2, dil_status);
                stmt.setString(3, details);
                stmt.setString(4, dil_date);

                int rows = stmt.executeUpdate();

                if(rows>0){
                    %>
                    <script>
                        alert("Refill Booking Request Status Successfully");
                        window.location = "Admin_RefBook_Status.jsp";
                    </script>
                    <%
                }else{
                    %>
                <script>
                    alert("Failed to update status. Try Again");
                    window.location = "Admin_RefBook_Status.jsp";
                </script>
                <%
                }
            } catch(Exception e){
                   out.println("Error: " + e.getMessage());
            } 
        }
    }
    
%>       
    </table>
    <button type="submit" class="button">Update</button>
    </fieldset>
</form>
</body>
</html>
