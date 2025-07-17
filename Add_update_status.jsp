<!-- View Address update status JSP PAGE (main page)  -->


<%-- 
    Document   : Add_update_status
    Created on : Apr 24, 2025, 6:34:22 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="Add_update_status.html" %>
<html>
    <head>
        <title>ADDRESS UPDATE STATUS</title>
    </head>
    <body>
        <form>
        <fieldset>
        <h2>ADDRESS UPDATE STATUS</h2><hr>
        <table>
        <%
        // Step 1: Get logged-in user's email from session
    String email = (String) session.getAttribute("email");

    if(email == null){
        out.println("<tr><td colspan='2'>Log in to view your status.</td></tr>");
    } 
    
    else {
        String url = "jdbc:mysql://localhost:3306/refillmanagement";
        String username = "root";
        String password = "Aney@2612";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            
            // Step 2: Join customer details and refillbookpos using email
            String query = "SELECT r.Consumer_id, r.Status, r.curr_date " +
                           "FROM addchangeresp r JOIN consumerdetails c ON r.Consumer_id = c.Consumer_id " +
                           "WHERE c.email = ?";

            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();

            boolean found = false;

            while (rs.next()) {
                found = true;
%>
            <tr>
                <td><label><b>Consumer ID:</b></label></td>
                <td><input type="number" value="<%= rs.getInt("Consumer_id") %>" disabled style="height: 25px;"></td>
            </tr>
            <tr>
                <td><label for="Status"><b>Status: </b></label></td>
                <td><input type="text" name="Status" value="<%= rs.getString("Status") %>" disabled style="height: 25px;"></td>
            </tr>                        
            <tr>
                <td><label for="curr_date"><b>Current date: </b></label></td>
                <td><input type="date" name="curr_date" value="<%= rs.getString("curr_date") %>" disabled style="height: 25px;"></td>
            </tr>
        <%
 }

            if (!found) {
                out.println("<tr><td colspan='2'>No booking found for your account.</td></tr>");
            }

        } catch (Exception e) {
            out.println("<tr><td colspan='2'>Error: " + e.getMessage() + "</td></tr>");
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
            try { if (ps != null) ps.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }
    }
%>
</table>
</fieldset>
</form>
</body>
</html>