<!-- FAQ JSP PAGE -->


<%-- 
    Document   : faq.jsp
    Created on : Feb 27, 2025, 7:43:49 PM
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
        <title>FAQ Questions</title>
        <script type="text/javascript">
            function send() {
                alert("Request has been sended");
                window.location.assign("main.html");
            }
            function InvalidId() {
                alert("Invalid UserId. Please try again");
                window.location.assign("FAQ.html");
            }
        </script>
    </head>
    <body>
        <%
            String User_id = request.getParameter("userid");
            String faq_ques = request.getParameter("faqQ");
            String sub = request.getParameter("sub");
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
                String query= "insert into faq(User_id,faq_ques,sub,date) values(?,?,?,?)";
                ps = conn.prepareStatement(query);
                ps.setString(1,User_id);
                ps.setString(2,faq_ques);
                ps.setString(3,sub);
                ps.setString(4,date);
                ps.executeUpdate();
                
                rs.next();
                if (rs.getString("User_id").equals(User_id)) {
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
