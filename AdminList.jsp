<!-- ADMIN LIST JSP PAGE -->

<%-- 
    Document   : AdmList.jsp
    Created on : Mar 13, 2025, 4:08:23 PM
    Author     : Dell-R
--%>
<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="AdminList.html" %>

    <fieldset>
        <table>
            <tr>
                <th colspan="2"> <h2>Admin List</h2> <hr></th>
            </tr>
            <tr>
                <th>Admin Id</th>
                <th>Admin Name</th>
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
                    String Adminid = rs.getString("Admin_id");
                    String Adminname = rs.getString("Admin_name");
                    %>
                    <tr>
                        <td><%= Adminid %></td>
                        <td><%= Adminname %></td>
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