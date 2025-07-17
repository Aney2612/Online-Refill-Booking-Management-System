<!-- View User JSP PAGE (delete page)  -->


<%-- 
    Document   : ViewUser
    Created on : Apr 27, 2025, 11:03:48 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="ViewUser.html" %>

    <fieldset>
        <table>
            <h2>User details</h2> <hr>
            
            <tr>
                <th>User id </th>
                <th>Name </th>
                <th>Phone </th>
                <th>Address </th>
                <th>District </th>
                <th>State </th>
                <th>Country </th>
                <th>Pin code </th>
                <th>Email </th>
                <th>Birth date </th>
                <th>Join date </th>
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
            ResultSet rs = stmt.executeQuery("SELECT User_id, Name, Phone, Address, District, State, Country, Pin_code, Email, Password, Birth_date, Join_date FROM userdetails");
                while(rs.next()){
                    String User_id = rs.getString("User_id");
                    String Name = rs.getString("Name");
                    String Phone = rs.getString("Phone");
                    String Address = rs.getString("Address");
                    String District = rs.getString("District");
                    String State = rs.getString("State");
                    String Country = rs.getString("Country");
                    String Pin_code = rs.getString("Pin_code");
                    String Email = rs.getString("Email");
                    String Birth_date = rs.getString("Birth_date");
                    String Join_date = rs.getString("Join_date");
                    %>
                    <tr>
                        <td><%= User_id %></td>
                        <td><%= Name %></td>
                        <td><%= Phone %></td>
                        <td><%= Address %></td>
                        <td><%= District %></td>
                        <td><%= State %></td>
                        <td><%= Country %></td>
                        <td><%= Pin_code %></td>
                        <td><%= Email %></td>
                        <td><%= Birth_date %></td>
                        <td><%= Join_date %></td>
                        <td><a href = "deleteUser.jsp?User_id=<%= User_id %>" onclick="return confirm ('Are you sure you want to delete this record?');">Delete</a></td>
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