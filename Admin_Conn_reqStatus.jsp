<!-- Insert and Update status for new connection request JSP PAGE (Update Page) -->

<%-- 
    Document   : Admin_Conn_reqStatus
    Created on : Apr 24, 2025, 7:09:11 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="Admin_Conn_reqStatus.html" %>

<form method="post">
    <fieldset>
        <table>
            <tr>
                <th colspan="2"> <h2>Connection Request Status Update</h2> <hr></th>
            </tr>
            <tr>
                <th><label for="User_id">User id: </label></th>
                <td><input type="number" name="User_id" id="User_id" required style="height: 25px;"></td>
            </tr>
            <tr>
                <th><label for="details">Details: </label></th>
                <td><textarea style="height:25px; width: 80%" name="details" id = "details" required></textarea></td>
            </tr>
            <tr>
                <th><label for="status">Status: </label></th>
                <td><input type="text" name="status" id="status" required style="height: 25px;"></td>
            </tr>
            <tr>
                <th><label for="date">Date: </label></th>
                <td><input type="date" style = "height: 25px;" name="date" id="date" required></td>
            </tr>
<%
    if("POST".equalsIgnoreCase(request.getMethod())){
        String User_id = request.getParameter("User_id");
        String details = request.getParameter("details");
        String status = request.getParameter("status");
        String date = request.getParameter("date");

        if (User_id != null && details != null && status != null && date != null){
            try{
                String url = "jdbc:mysql://localhost:3306/refillmanagement";
                String username = "root";
                String password = "Aney@2612";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection(url, username, password); 

                String query = "INSERT INTO connreqpos (User_id, details, Status, date) VALUES (?,?,?,?)";
                PreparedStatement stmt= conn.prepareStatement(query);
                stmt.setString(1, User_id);
                stmt.setString(2, details);
                stmt.setString(3, status);
                stmt.setString(4, date);

                int rows = stmt.executeUpdate();

                if(rows>0){
                    %>
                    <script>
                        alert("Connection Request status updated Successfully");
                        window.location = "Admin_Conn_reqStatus.jsp";
                    </script>
                    <%
                }else{
                    %>
                <script>
                    alert("Failed to update status. Try Again");
                    window.location = "Admin_Conn_reqStatus.jsp";
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