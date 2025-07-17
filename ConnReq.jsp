<!-- CONNECTION REQUEST JSP PAGE -->


<%-- 
    Document   : ConnReq.jsp
    Created on : Feb 27, 2025, 5:31:50 PM
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
        <title>Connection Request</title>
        <script type="text/javascript">
            function send() {
                alert("Request has been sended");
                window.location.assign("main.html");
            }
            function InvalidId() {
                alert("Invalid UserId. Please try again");
                window.location.assign("Conn_Req.html");
            }
        </script>
    </head>
    <body>
        <!--<h1><center>You are successfully Registered</center></h1>-->
        <%
            String User_id = request.getParameter("userid");
            String Conn_mess = request.getParameter("connmess");
            String date = request.getParameter("date");
            
            String url = "jdbc:mysql://localhost:3306/refillmanagement";
            String username = "root";
            String password = "Aney@2612";
            Connection conn = null; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(url, username, password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from userdetails where User_id='" + User_id + "'");
            
            try{
                PreparedStatement ps = null;
                String query= "insert into newconnreq(User_id,Conn_mess,date) values(?,?,?)";
                ps = conn.prepareStatement(query);
                ps.setString(1,User_id);
                ps.setString(2,Conn_mess);
                ps.setString(3,date);
                ps.executeUpdate();
                
                rs.next();
                if (rs.getString("User_id").equals(User_id)) {
                    //String site = new String("main.html");
                    //response.setStatus(response.SC_MOVED_TEMPORARILY);
                    //response.setHeader("Location", site); 
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
                //out.print("SQL:"+se.getMessage());
                //String site = new String("Conn_Req.html");
                //response.setStatus(response.SC_MOVED_TEMPORARILY);
               // response.setHeader("Location", site);
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
