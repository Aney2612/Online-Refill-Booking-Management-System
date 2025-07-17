<!-- EDIT CONSUMER DETAILS JSP PAGE (ADMIN UPDATE)-->

<%-- 
    Document   : EditConsumer
    Created on : Apr 22, 2025, 4:05:36 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="EditConsumer.html" %>
<%
    String id = request.getParameter("id");
    String url = "jdbc:mysql://localhost:3306/refillmanagement";
    String username = "root";
    String password = "Aney@2612";
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String name = "", email ="", address = "", district = "", state = "", country = "", date = "", phone = "", code = "", pin = "";
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn=DriverManager.getConnection(url, username, password); 
        ps = conn.prepareStatement("select * from consumerdetails where Consumer_id = ?");
        ps.setInt(1,Integer.parseInt(id));
        rs = ps.executeQuery();    
        if (rs.next()){
            name = rs.getString("Consumer_name");
            phone = rs.getString("Phone");
            email = rs.getString("Email");
            address = rs.getString("Address");
            district = rs.getString("District");
            state = rs.getString("State");
            country = rs.getString("Country");
            pin = rs.getString("Pin_code");
            code = rs.getString("Code");
            date = rs.getString("Conn_date");
        }
        conn.close();
        } catch (Exception e) {
            out.println("Error: " +e.getMessage());
        } 
        %>
        <html>
            <head>
                <title>Edit Consumer</title>
            </head>
            <body>
                <fieldset>
                    <h1>Edit Consumer Details</h1><hr>
                    <form action="UpdateConsumer.jsp" method="post">
                        <table>
                            <tr> 
                                <th>Consumer id: </th>
                                <td><input type="hidden" name="Consumer_id" value="<%= id %>" ></td>
                            </tr>
                            <tr> 
                                <th>Consumer name: </th> 
                                <td><input type="text" name="Consumer_name" value="<%= name %>"><br></td>
                            </tr>
                            <tr> 
                                <th>Phone: </th>
                                <td><input type="tel" name="Phone" value="<%= phone %>"><br></td>
                            </tr>
                            <tr> 
                                <th>Email: </th>
                                <td><input type="email" name="Email" value="<%= email %>"><br></td>
                            </tr>
                            <tr> 
                                <th>Address: </th>
                                <td><textarea name="Address"><%= address %></textarea><br></td>
                            </tr>
                            <tr> 
                                <th>District: </th>
                                <td><input type="text" name="District" value="<%= district %>"><br></td>
                            </tr>
                            <tr> 
                                <th>State: </th>
                                <td><input type="text" name="State" value="<%= state %>"><br></td>
                            </tr>
                            <tr> 
                                <th>Country: </th>
                                <td><input type="text" name="Country" value="<%= country %>"><br></td>
                            </tr>
                            <tr> 
                                <th>Pin code: </th>
                                <td><input type="number" name="Pin_code" value="<%= pin %>"><br></td>
                            </tr> 
                            <tr> 
                                <th>Code: </th>
                                <td><input type="number" name="Code" value="<%= code %>"><br></td>
                            </tr> 
                            <tr> 
                                <th>Connection date: </th>
                                <td><input type="date" name="Conn_date" style = "width: 162px;" value="<%= date %>"><br></td>
                            </tr>
                        </table>
                            <button type="submit" value="update">Update</button>
                    </form>
                </fieldset>
            </body>
        </html>
    </body>
</html>