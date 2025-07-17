<!-- UPDATE CONSUMER DETAILS PAGE (ADMIN UPDATE)-->

<%-- 
    Document   : UpdateConsumer
    Created on : Apr 22, 2025, 5:31:49 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<html>
    <head>
        <script type="text/javascript">
            function success(){
                alert("Consumer details updated successfully!");
                window.location.href = "ConsDelUp.jsp";
            } 
            function unsuccess(){
            alert("Failed to update details. Please try again");
            window.location.href = "EditConsumer.jsp";
        } 
        </script>
    </head>
<%
    String id = request.getParameter("Consumer_id");
    String name = request.getParameter("Consumer_name");
    String phone = request.getParameter("Phone");
    String email = request.getParameter("Email");
    String address = request.getParameter("Address");
    String district = request.getParameter("District");
    String state = request.getParameter("State");
    String country = request.getParameter("Country");
    String pin = request.getParameter("Pin_code");
    String code = request.getParameter("Code");
    String date = request.getParameter("Conn_date");
    
    String url = "jdbc:mysql://localhost:3306/refillmanagement";
    String username = "root";
    String password = "Aney@2612";
    Connection conn = null;
    PreparedStatement ps = null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn=DriverManager.getConnection(url, username, password); 
        ps = conn.prepareStatement("UPDATE consumerdetails SET Consumer_name = ?, Phone = ?, Email = ?, Address = ?, District = ?, State = ?, Country = ?, Pin_code = ?, Code = ?, Conn_date = ? WHERE Consumer_id = ?");
        ps.setString(1, name);   
        ps.setString(2, phone); 
        ps.setString(3, email); 
        ps.setString(4, address); 
        ps.setString(5, district); 
        ps.setString(6, state); 
        ps.setString(7, country); 
        ps.setString(8, pin); 
        ps.setString(9, code);
        ps.setString(10,date); 
        
        ps.setString(11, id);
        
        int result = ps.executeUpdate();
        if (result > 0){
        %>
            <script>
                 success();
             </script>
        <%
        }
        else{
            %>
            <script>
                 unsuccess();
             </script>
        <%
        }
        conn.close();
    } catch (Exception e) {
        out.println("Error: " +e.getMessage());
    } 
    %>
    </body>
</html>