<!-- ADD NEW CONSUMER DETAILS JSP PAGE (ADMIN INSERT)-->

<%-- 
    Document   : newConsumer
    Created on : Apr 22, 2025, 1:57:06 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="newConsumer.html" %>

<form method="post">
    <fieldset>
        <table>
            <tr>
                <th colspan="2"> <h2>New Consumer</h2></th>
            </tr> 
            <tr>
                <th><label for="Conid">Consumer id: </label></th>
                <td><input type="text" name="Conid" id="Conid" required></td>
            </tr>
            <tr>
                <th><label for="Conpwd">Password: </label></th>
                <td><input type="password" name="Conpwd" id="Conpwd" required></td>
            </tr>
            <tr>
                <th><label for="Conname">Consumer Name: </label></th>
                <td><input type="text" name="Conname" id="Conname" required></td>
            </tr>
            <tr>
                <th><label for="Phone">Phone: </label></th>
                <td><input type="tel" name="Phone" id="Phone" required></td>
            </tr>
            <tr>
                <th><label for="Email">Email: </label></th>
                <td><input type="email" name="Email" id="Email" required></td>
            </tr>
            <tr>
                <th><label for="Address">Address: </label></th>
                <td><textarea style="height:19px;" name="Address" required></textarea></td>
            </tr>
            <tr>
                <th><label for="District">District: </label></th>
                <td><input type="text" name="District" id="District" required></td>
            </tr>
            <tr>
                <th><label for="State">State: </label></th>
                <td><input type="text" name="State" id="State" required></td>
            </tr>
            <tr>
                <th><label for="Country">Country: </label></th>
                <td><input type="text" name="Country" id="Country" required></td>
            </tr>
            <tr>
                <th><label for="Pin">Pin code: </label></th>
                <td><input type="number" name="Pin" id="Pin" required></td>
            </tr>
            <tr>
                <th><label for="Code">Code: </label></th>
                <td><input type="number" name="Code" id="Code" required></td>
            </tr>
            <tr>
                <th><label for="Conn_date">Connection date: </label></th>
                <td><input type="date" name="Conn_date" style = "width: 162px;" id="Conn_date" required></td>
            </tr>
<%
    if("POST".equalsIgnoreCase(request.getMethod())){
        String Conid = request.getParameter("Conid");
        String Conpwd = request.getParameter("Conpwd");
        String Conname = request.getParameter("Conname");
        String Phone = request.getParameter("Phone");
        String Email = request.getParameter("Email");
        String Address = request.getParameter("Address");
        String District = request.getParameter("District");
        String State = request.getParameter("State");
        String Country = request.getParameter("Country");
        String Pin = request.getParameter("Pin");
        String Code = request.getParameter("Code");
        String Conn_date = request.getParameter("Conn_date");
        
        if (Conid != null && Conpwd != null && Conname != null && Phone != null && Email != null && Address != null && District != null 
            && State != null && Country != null && Pin != null && Code != null && Conn_date != null){
            try{
                String url = "jdbc:mysql://localhost:3306/refillmanagement";
                String username = "root";
                String password = "Aney@2612";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection(url, username, password); 

                String query = "INSERT INTO consumerdetails (Consumer_id, Consumer_pwd, Consumer_name, Phone, Email, Address, District, State, Country, Pin_code, Code, Conn_date) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement stmt= conn.prepareStatement(query);
                stmt.setString(1, Conid);
                stmt.setString(2, Conpwd);
                stmt.setString(3, Conname);
                stmt.setString(4, Phone);
                stmt.setString(5, Email);
                stmt.setString(6, Address);
                stmt.setString(7, District);
                stmt.setString(8, State);
                stmt.setString(9, Country);
                stmt.setString(10, Pin);
                stmt.setString(11, Code);
                stmt.setString(12, Conn_date);

                int rows = stmt.executeUpdate();

                if(rows>0){
                    %>
                    <script>
                        alert("Consumer Added Successfully");
                        window.location = "newConsumer.jsp";
                    </script>
                    <%
                }else{
                    %>
                <script>
                    alert("Failed to add Consumer. Try Again");
                    window.location = "newConsumer.jsp";
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
    <button type="submit" class="button">Add Consumer</button>
    </fieldset>
</form>
</body>
</html>
