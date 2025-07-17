<!-- VIEW CONSUMER DETAILS JSP PAGE (ADMIN INSERT)-->

<%-- 
    Document   : consd.jsp
    Created on : Apr 20, 2025, 5:52:04 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="Consumerdetails.html" %>
<html>
    <head>
        <title>Consumer details</title>
    </head>
    <body>
        <fieldset>
        <h1>Consumer details</h1><hr>
        <table>
        <tr>
            <th>Consumer_id </th>
            <th>Consumer_name </th> 
            <th>Phone </th> 
            <th>Email </th>
            <th>Address </th> 
            <th>District </th> 
            <th>State </th> 
            <th>Country </th> 
            <th>Pin_code </th> 
            <th>Code </th> 
            <th>Conn_date </th>
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
                    int Consumer_id = rs.getInt("Consumer_id");
                    String Consumer_name = rs.getString("Consumer_name");
                    int Phone = rs.getInt("Phone");
                    String Email = rs.getString("Email"); 
                    String Address = rs.getString("Address");
                    String District = rs.getString("District");
                    String State = rs.getString("State"); 
                    String Country = rs.getString("Country");
                    int Pin_code = rs.getInt("Pin_code");
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
                        </tr>
                    <%
                }
        } catch (Exception e) {
            out.println("Error: " +e.getMessage());
        } finally{
            try{
                if(rs !=null){
                    rs.close();
                }
            }catch (SQLException ignored){}
            
            try{
                if(stmt !=null){
                    stmt.close();
                }
            }catch (SQLException ignored){}

            try{
                if(conn !=null){
                    conn.close();
                }
            }catch (SQLException ignored){}
        }
        %>
        </table> 
        </fieldset>
    </body>
</html>