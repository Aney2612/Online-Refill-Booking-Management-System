<!-- REFILL BOOKING JSP PAGE -->


<%-- 
    Document   : refbook.jsp
    Created on : Feb 27, 2025, 6:31:35 PM
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
        <title>Refill Booking Request</title>
        <script type="text/javascript">
            function send() {
                alert("Request has been sended");
                window.location.assign("main.html");
            }
            function InvalidId() {
                alert("Invalid ConsumerId. Please try again");
                window.location.assign("RefillBooking.html");
            }
        </script>
    </head>
    <body>
        <%
            String Consumer_id = request.getParameter("consid");
            String refill_mess = request.getParameter("refillmess");
            String old_date = request.getParameter("odate");
            String latest_date = request.getParameter("ldate");
            
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
                String query= "insert into refillbooking(Consumer_id,refill_mess,old_date,latest_date) values(?,?,?,?)";
                ps = conn.prepareStatement(query);
                ps.setString(1,Consumer_id);
                ps.setString(2,refill_mess);
                ps.setString(3,old_date);
                ps.setString(4,latest_date);
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
