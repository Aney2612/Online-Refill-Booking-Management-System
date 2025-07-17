<!-- View Connection request status JSP PAGE (main page)  -->


<%-- 
    Document   : Conn_Req_Status
    Created on : Apr 24, 2025, 9:44:00 PM
    Author     : Dell-R
--%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ include file="Conn_Req_Status.html" %>

<html>
<head>
    <title>CONNECTION REQUEST STATUS</title>
</head>
<body>
    <form>
        <fieldset>
            <h2>CONNECTION REQUEST STATUS</h2>
            <hr>
            <table>
<%
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("index.html");
        return;
    }

    String url = "jdbc:mysql://localhost:3306/refillmanagement";
    String username = "root";
    String password = "Aney@2612";
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        int userId = -1;
        PreparedStatement psUser = conn.prepareStatement("SELECT User_id FROM userdetails WHERE Email = ?");
        psUser.setString(1, email);
        ResultSet rsUser = psUser.executeQuery();
        if (rsUser.next()) {
            userId = rsUser.getInt("User_id");
        }
        rsUser.close();
        psUser.close();

        if (userId != -1) {
            stmt = conn.prepareStatement("SELECT details, status, date FROM connreqpos WHERE User_id = ?");
            stmt.setInt(1, userId);
            rs = stmt.executeQuery();

            while (rs.next()) {
                String details = rs.getString("details");
                String status = rs.getString("status");
                String date = rs.getString("date");
%>
                <tr>
                    <td><label><b>User id: </b></label></td>
                    <td><input type="number" value="<%= userId %>" disabled style="height: 25px;"></td>
                </tr>
                <tr>
                    <td><label><b>Details: </b></label></td>
                    <td><input type="text" value="<%= details %>" disabled style="height: 25px;"></td>
                </tr>
                <tr>
                    <td><label><b>Status: </b></label></td>
                    <td><input type="text" value="<%= status %>" disabled style="height: 25px;"></td>
                </tr>
                <tr>
                    <td><label><b>Date: </b></label></td>
                    <td><input type="date" value="<%= date %>" disabled style="height: 25px;"></td>
                </tr>
<%
            }
        } else {
            out.println("<tr><td colspan='2'><b>No connection request found for your account.</b></td></tr>");
        }

    } catch (Exception e) {
        out.println("<tr><td colspan='2'><b>Error: </b>" + e.getMessage() + "</td></tr>");
    } finally {
        if (rs != null) 
            try { 
                rs.close(); 
            } 
        catch (SQLException ignored) {}
        if (stmt != null) 
        try { 
            stmt.close(); 
        } catch (SQLException ignored) {}
        if (conn != null) 
        try { 
            conn.close(); 
        } 
        catch (SQLException ignored) {}
    }
%>
            </table>
        </fieldset>
    </form>
</body>
</html>
