<!-- VIEW USER DETAILS JSP PAGE (ADMIN INSERT)-->

<%-- 
    Document   : usrd.jsp
    Created on : Apr 20, 2025, 5:18:14 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="userdetails.html" %>
<html>
    <head>
        <title>User details</title>
    </head>
    <body>
        <fieldset>
            <h1>User details </h1><hr>
        <table>
        <tr>
            <th>User_id </th>
            <th>Name </th> 
            <th>Phone </th> 
            <th>Address </th> 
            <th>District </th> 
            <th>State </th> 
            <th>Country </th> 
            <th>Pin_code </th> 
            <th>Email </th> 
            <th>Birth_date </th> 
            <th>Join_date</th>
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
            rs = stmt.executeQuery("select User_id, Name, Phone, Address, District, State, Country, Pin_code, Email, Birth_date, Join_date from userdetails");
                while(rs.next()){
                    int User_id = rs.getInt("User_id");
                    String Name = rs.getString("Name");
                    int Phone = rs.getInt("Phone");
                    String Address = rs.getString("Address");
                    String District = rs.getString("District");
                    String State = rs.getString("State"); 
                    String Country = rs.getString("Country");
                    int Pin_code = rs.getInt("Pin_code");
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