<!-- PROFILE JSP PAGE -->


<%-- 
    Document   : profile.jsp
    Created on : Mar 13, 2025, 4:08:23 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="header & footer.html" %>
<%
    String Email = (String) session.getAttribute("email");
    String Name = "";
    String Phone="";

    if (Email != null){
        try{
            String url = "jdbc:mysql://localhost:3306/refillmanagement";
            String username = "root";
            String password = "Aney@2612";
            Connection conn = null; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(url, username, password);
            PreparedStatement stmt = conn.prepareStatement("SELECT Name, Phone FROM userdetails WHERE Email = ?");
            stmt.setString(1,Email);

            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                Name = rs.getString("Name");
                Phone = rs.getString("Phone");
            }
            conn.close();
        }catch(Exception e){
                out.print("Error: " + e.getMessage());
        }
    } else{
        response.sendRedirect("index.html");
    }
     
%>
<form method="post">
    <fieldset>
        <table>
            <tr>
                <th colspan="2"> <h2>Customer Profile</h2> <hr></th>
            </tr>
            <tr>
                <td><b>Name: </b></td>
                <td><%= Name %><br><br></td>
            </tr>
            <tr>
                <td><b>Email: </b></td>
                <td><%= Email %><br><br></td>
            </tr>
            <tr>          
                <td><b>Phone: </b></td>
                <td><%= Phone %><br><br></td>
            </tr>
        </table>
            <a href="editProfile.jsp" class="button">Edit Profile</a>
    </fieldset>
</form>
</body>
</html>