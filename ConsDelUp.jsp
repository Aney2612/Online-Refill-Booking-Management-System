<!-- CONSUMER DETAILS UPDATE JSP PAGE (UPDATE PAGE)-->


<%-- 
    Document   : ConsDelUp
    Created on : Apr 22, 2025, 2:50:00 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="ConsDelUp.html" %>
<html>
    <head>
        <title>Consumer details</title>
    </head>
    <body>
        <fieldset>
        <h1>Consumer details</h1><hr>
        <table>
        <tr>
            <th>Consumer id </th>
            <th>Consumer name </th> 
            <th>Phone </th> 
            <th>Email </th>
            <th>Address </th> 
            <th>District </th> 
            <th>State </th> 
            <th>Country </th> 
            <th>Pin code </th> 
            <th>Code </th> 
            <th>Connection date </th>
        </tr>
        <%
        String url = "jdbc:mysql://localhost:3306/refillmanagement";
        String username = "root";
        String password = "Aney@2612";
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(url, username, password); 
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select Consumer_id, Consumer_name, Phone, Email, Address, District, State, Country, Pin_code, Code, Conn_date from consumerdetails");
                while(rs.next()){
                    %>
                        <tr>
                            <td><%= rs.getString("Consumer_id") %></td>
                            <td><%= rs.getString("Consumer_name") %></td>
                            <td><%= rs.getString("Phone") %></td>
                            <td><%= rs.getString("Email") %></td>
                            <td><%= rs.getString("Address") %></td>
                            <td><%= rs.getString("District") %></td>
                            <td><%= rs.getString("State") %></td>
                            <td><%= rs.getString("Country") %></td>
                            <td><%= rs.getString("Pin_code") %></td>
                            <td><%= rs.getString("Code") %></td>
                            <td><%= rs.getString("Conn_date") %></td>
                            <td><a href="EditConsumer.jsp?id=<%=rs.getString("Consumer_id")%>">Edit</a></td>
                        </tr>
                    <%
                }
                conn.close();
        } catch (Exception e) {
            out.println("Error: " +e.getMessage());
        } 
        %>
        </table> 
        </fieldset>
    </body>
</html>