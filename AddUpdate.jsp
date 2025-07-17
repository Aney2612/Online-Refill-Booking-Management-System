<!-- ADDRESS UPDATE JSP PAGE -->


<%-- 
    Document   : AddUpdate.jsp
    Created on : Feb 27, 2025, 7:28:49 PM
    Author     : Dell-R
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Address Change Request</title>
        <script type="text/javascript">
            function send() {
                alert("Request has been sended");
                window.location.assign("main.html");
            }
            function InvalidId() {
                alert("Invalid ConsumerId. Please try again");
                window.location.assign("Add_Update.html");
            }
        </script>
    </head>
    <body>
        <%
            String Consumer_id = request.getParameter("consid");
            String Add_req = request.getParameter("Nadd");
            String valid_from = request.getParameter("valid");
            String curr_date = request.getParameter("current");
            
            String url = "jdbc:mysql://localhost:3306/refillmanagement";
            String username = "root";
            String password = "Aney@2612";
            Connection conn = null; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(url, username, password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from consumerdetails where Consumer_id='" + Consumer_id + "'");
            
            try{
                PreparedStatement ps = null;
                String query= "insert into addchangereq(Consumer_id,Add_req,valid_from,curr_date) values(?,?,?,?)";
                ps = conn.prepareStatement(query);
                ps.setString(1,Consumer_id);
                ps.setString(2,Add_req);
                ps.setString(3,valid_from);
                ps.setString(4,curr_date);
                ps.executeUpdate();
                
                rs.next();
                if (rs.getString("Consumer_id").equals(Consumer_id)) { 
                    %>
                    <script type="text/javascript">
                      send();
                    </script> 
                   <%
                } 
                if(conn==null){
                    conn.close();
                }
            }
            catch(SQLException se){
                %>
                <script type="text/javascript">
                  InvalidId();
                </script> 
               <%
            }
            catch(Exception e){
                out.print("Exception:"+e.getMessage());
            }
        %>
    </body>
</html>
