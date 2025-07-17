<!-- Insert and Update status for address update JSP PAGE(Update Page) -->



<%-- 
    Document   : Admin_Add_update
    Created on : Apr 24, 2025, 6:05:24 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="AdminAdd_UpdateStatus.html" %>

<form method="post">
    <fieldset>
        <table>
            <tr>
                <th colspan="2"> <h2>Address Update Status</h2> <hr></th>
            </tr>
            <tr>
                <th><label for="Consumer_id">Consumer id: </label></th>
                <td><input type="number" name="Consumer_id" id="Consumer_id" required style="height: 25px;"></td>
            </tr>
            <tr>
                <th><label for="Status">Status: </label></th>
                <td><input type="text" name="Status" id="Status" required style="height: 25px;"></td>
            </tr>
            <tr>
                <th><label for="curr_date">Current date: </label></th>
                <td><input type="date" style = "width: 162px; height: 25px;"name="curr_date" id="curr_date" required></td>
            </tr>
<%
    if("POST".equalsIgnoreCase(request.getMethod())){
        String Consumer_id = request.getParameter("Consumer_id");
        String Status = request.getParameter("Status");
        String curr_date = request.getParameter("curr_date");

        if (Consumer_id != null && Status != null && curr_date != null){
            try{
                String url = "jdbc:mysql://localhost:3306/refillmanagement";
                String username = "root";
                String password = "Aney@2612";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection(url, username, password); 

                String query = "INSERT INTO addchangeresp (Consumer_id, Status, curr_date) VALUES (?,?,?)";
                PreparedStatement stmt= conn.prepareStatement(query);
                stmt.setString(1, Consumer_id);
                stmt.setString(2, Status);
                stmt.setString(3, curr_date);

                int rows = stmt.executeUpdate();

                if(rows>0){
                    %>
                    <script>
                        alert("Status updated Successfully");
                        window.location = "Admin_Add_updatestatus.jsp";
                    </script>
                    <%
                }else{
                    %>
                <script>
                    alert("Failed to update status. Try Again");
                    window.location = "Admin_Add_updatestatus.jsp";
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