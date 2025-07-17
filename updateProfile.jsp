<!-- UPDATE PROFILE JSP PAGE -->



<%-- 
    Document   : updateProfile.jsp
    Created on : Apr 15, 2025, 9:58:43 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<html>
    <head>
        <title>Update Profile</title>
        <script type="text/javascript">
        function success(){
            alert("Profile updated successfully!");
            window.location.href = "profile.jsp";
        } 
        function unsuccess(){
            alert("Failed to update profile. Please try again");
            window.location.href = "editProfile.jsp";
        } 
    </script>
    </head>
    <body>
    <% 
        String oldEmail = (String) session.getAttribute("email");
        String Name = request.getParameter("name");
        String Email = request.getParameter("email");
        String Phone = request.getParameter("phone");

        if (oldEmail == null){
            response.sendRedirect("index.html");
        }
        try {
            String url = "jdbc:mysql://localhost:3306/refillmanagement";
            String username = "root";
            String password = "Aney@2612";
            Connection conn = null; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(url, username, password);
            String query = "UPDATE userdetails SET Name = ?, Email = ?, Phone = ? WHERE Email = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1,Name);
            stmt.setString(2,Email);
            stmt.setString(3,Phone);
            stmt.setString(4,oldEmail);

            int rows  = stmt.executeUpdate();
            conn.close();

            if(rows>0){
                session.setAttribute("email",Email);  //update session with new email
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
        } catch (Exception e){
        %>
         <script>
           unsuccess();
         </script>
         <%   
        }
    %>

    </body>
</html>
