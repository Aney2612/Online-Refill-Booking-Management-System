<!-- View for Consumer JSP PAGE -->


<%-- 
    Document   : ViewConsumer
    Created on : Apr 27, 2025, 11:25:10 PM
    Author     : Dell-R
--%>
<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="ViewConsumer.html" %>

    <fieldset>
        <table>
            <h2>Consumer details</h2> <hr>
            
            <tr>
                <th>Consumer id </th>
                <th>Consumer Name </th>
                <th>Phone </th>
                <th>Email </th>
                <th>Address </th>
                <th>District </th>
                <th>State </th>
                <th>Country </th>
                <th>Pin code </th>
                <th>Code </th>
                <th>Connection date </th>
                <th>Action </th>
            </tr>
    <%
        String url = "jdbc:mysql://localhost:3306/refillmanagement";
        String username = "root";
        String password = "Aney@2612";

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, username, password); 
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT Consumer_id, Consumer_pwd, Consumer_name, Phone, Email, Address, District, State, Country, Pin_code, Code, Conn_date FROM consumerdetails");
                while(rs.next()){
                    String Consumer_id = rs.getString("Consumer_id");
                    String Consumer_name = rs.getString("Consumer_name");
                    String Phone = rs.getString("Phone");
                    String Email = rs.getString("Email");
                    String Address = rs.getString("Address");
                    String District = rs.getString("District");
                    String State = rs.getString("State");
                    String Country = rs.getString("Country");
                    String Pin_code = rs.getString("Pin_code");
                    String Code = rs.getString("Code");
                    String Conn_date = rs.getString("Conn_date");
                    %>
                    <tr>
                        <td><%= Consumer_id %></td>
                        <td><%= Consumer_name %></td>
                        <td><%= Phone %></td>
                        <td><%= Email %></td>
                        <td><%= Address %></td>
                        <td><%= District %></td>
                        <td><%= State %></td>
                        <td><%= Country %></td>
                        <td><%= Pin_code %></td>
                        <td><%= Code %></td>
                        <td><%= Conn_date %></td>
                        <td><a href = "deleteConsumer.jsp?Consumer_id=<%= Consumer_id %>" onclick="return confirm ('Are you sure you want to delete this record?');">Delete</a></td>
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