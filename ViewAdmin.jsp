<!-- View Admin JSP PAGE -->

<%-- 
    Document   : ViewAdmin
    Created on : Apr 27, 2025, 10:45:08 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="ViewAdmin.html" %>

    <fieldset>
        <table>
            <h2>Admin List</h2> <hr>
            
            <tr>
                <th>Admin id: </th>
                <th>Admin Name: </th>
                <th>Action: </th>
            </tr>
    <%
        String url = "jdbc:mysql://localhost:3306/refillmanagement";
        String username = "root";
        String password = "Aney@2612";

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, username, password); 
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT Admin_id, Admin_name FROM adminlist");
                while(rs.next()){
                    String Admin_id = rs.getString("Admin_id");
                    String Admin_name = rs.getString("Admin_name");
                    %>
                    <tr>
                        <td><%= Admin_id %></td>
                        <td><%= Admin_name %></td>
                        <td><a href = "deleteAdmin.jsp?Admin_id=<%= Admin_id %>" onclick="return confirm ('Are you sure you want to delete this record?');">Delete</a></td>
                    </tr>
                    <%
                }
        } catch (Exception e) {
            out.println("Error: " +e.getMessage());
        } 
        %>
        
        </table> 
            </fieldset>
    </body>
</html>