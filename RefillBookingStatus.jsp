<!-- View Refill booking request status JSP PAGE (main page)  -->

<%-- 
    Document   : RefillBookingStatus
    Created on : Apr 24, 2025, 10:49:39 PM
    Author     : Dell-R
--%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@include file="RefillBookingStatus.html" %>

<html>
<head>
    <title>REFILL BOOKING REQUEST STATUS</title>
</head>
<body>
<form>
<fieldset>
<h2>Refill Booking Request Status</h2><hr>
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
            String query = "SELECT r.Consumer_id, r.dil_status, r.details, r.dil_date " +
                           "FROM refillbookpos r JOIN consumerdetails c ON r.Consumer_id = c.Consumer_id " +
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
                    <td><label><b>Delivery Status:</b></label></td>
                    <td><input type="text" value="<%= rs.getString("dil_status") %>" disabled style="height: 25px;"></td>
                </tr>
                <tr>
                    <td><label><b>Details:</b></label></td>
                    <td><input type="text" value="<%= rs.getString("details") %>" disabled style="height: 25px;"></td>
                </tr>
                <tr>
                    <td><label><b>Delivery Date:</b></label></td>
                    <td><input type="date" value="<%= rs.getString("dil_date") %>" disabled style="height: 25px;"></td>
                </tr>
                <tr><td colspan="2"><hr></td></tr>
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
