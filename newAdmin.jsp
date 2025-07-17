<!-- ADD NEW ADMIN JSP PAGE (ADMIN INSERT)-->

<%-- 
    Document   : newAdmin
    Created on : Apr 21, 2025, 10:53:50 PM
    Author     : Dell-R
--%>
<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="newAdmin.html" %>

<form method="post">
    <fieldset>
        <table>
            <tr>
                <th colspan="2"> <h2>New Admin</h2> <hr></th>
            </tr>
            <tr>
                <th><label for="Adminid">Admin id</label></th>
                <td><input type="text" name="Adminid" id="Adminid" required></td>
            </tr>
            <tr>
                <th><label for="Adminpwd">Admin Password</label></th>
                <td><input type="password" name="Adminpwd" id="Adminpwd" required></td>
            </tr>
            <tr>
                <th><label for="Adminname">Admin Name</label></th>
                <td><input type="text" name="Adminname" id="Adminname" required></td>
            </tr>
<%
    if("POST".equalsIgnoreCase(request.getMethod())){
        String Adminid = request.getParameter("Adminid");
        String Adminpwd = request.getParameter("Adminpwd");
        String Adminname = request.getParameter("Adminname");

        if (Adminid != null && Adminpwd != null && Adminname != null){
            try{
                String url = "jdbc:mysql://localhost:3306/refillmanagement";
                String username = "root";
                String password = "Aney@2612";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection(url, username, password); 

                String query = "INSERT INTO adminlist (Admin_id, Admin_pwd, Admin_name) VALUES (?,?,?)";
                PreparedStatement stmt= conn.prepareStatement(query);
                stmt.setString(1, Adminid);
                stmt.setString(2, Adminpwd);
                stmt.setString(3, Adminname);

                int rows = stmt.executeUpdate();

                if(rows>0){
                    %>
                    <script>
                        alert("Admin Added Successfully");
                        window.location = "newAdmin.jsp";
                    </script>
                    <%
                }else{
                    %>
                <script>
                    alert("Failed to add admin. Try Again");
                    window.location = "newAdmin.jsp";
                </script>
                <%
                }
            } catch(Exception e){
                   out.println("Error: " + e.getMessage());
            } 
        }
    }
    
%>       
    </table>
    <button type="submit" class="button">Add Admin</button>
    </fieldset>
</form>
</body>
</html>