<!-- EDIT PROFILE JSP PAGE -->



<%-- 
    Document   : editProfile.jsp
    Created on : Apr 15, 2025, 10:36:59 PM
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
<form method="post" action="updateProfile.jsp">
    <fieldset>
        <table>
            <tr>
                <th colspan="2"> <h2>Edit Profile</h2> <hr></th>
            </tr>
            <tr>
                <td><label for ="name"><b>Name: </b></label></td>
                <td><input type = "text" name = "name" value="<%= Name %>" required><br><br></td>
            </tr>
            <tr>
                <td><label for ="email"><b>Email: </b></label></td>
                <td><input type = "email" name = "email" value="<%= Email %>" required><br><br></td>
            </tr>
            <tr>          
                <td><label for ="phone"><b>Phone: </b></label></td>
                <td><input type = "tel" name = "phone" value="<%= Phone %>" required><br><br></td>
            </tr>
        </table>
            <button type="submit" class="button">Save</button>
    </fieldset>
</form>
</body>
</html>