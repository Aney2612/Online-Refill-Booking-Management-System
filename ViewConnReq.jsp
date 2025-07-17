<!-- View Connection request JSP PAGE -->

<%-- 
    Document   : ViewConnReq
    Created on : Apr 27, 2025, 9:56:04 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="ViewConnReq.html" %>

    <fieldset>
        <table>
            <h2>Connection Request</h2> <hr>
            
            <tr>
                <th>User id: </th>
                <th>Connection message: </th>
                <th>Date: </th>
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
            ResultSet rs = stmt.executeQuery("SELECT User_id, Conn_mess, date FROM newconnreq");
                while(rs.next()){
                    String User_id = rs.getString("User_id");
                    String Conn_mess = rs.getString("Conn_mess");
                    String date = rs.getString("date");
                    %>
                    <tr>
                        <td><%= User_id %></td>
                        <td><%= Conn_mess %></td>
                        <td><%= date %></td>
                        <td><a href = "deleteConn.jsp?User_id=<%= User_id %>" onclick="return confirm ('Are you sure you want to delete this record?');">Delete</a></td>
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