<!-- LOGIN PAGE JSP -->


<%-- 
    Document   : login.jsp
    Created on : Feb 21, 2025, 8:19:24 PM
    Author     : Dell-R
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script type="text/javascript">
            function admin() {
                alert("Login Successfull");
                window.location.assign("Admin.html");
            }
            function Login() {
                alert("Login Successfull");
                window.location.assign("main.html");
            }
            function InvalidLogin() {
                alert("Invalid Email or Password. Please try again or register yourself");
                window.location.assign("index.html");
            }
        </script>
    </head>
    <body>
        
        <%
            String Email = request.getParameter("email");
            String Password = request.getParameter("psw");
            
            String url = "jdbc:mysql://localhost:3306/refillmanagement";
            String username = "root";
            String password = "Aney@2612";
            Connection conn = null; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(url, username, password);
            Statement stmt = conn.createStatement(); 
            ResultSet rs = stmt.executeQuery("select * from userdetails where Email='" + Email + "' and Password='" + Password + "'");
            try{
                rs.next();   
                if (Email.equals("admin@admin") && Password.equals("admin")) {
                    session.setAttribute("email",Email);
                    %>
                    <script>
                      admin();
                    </script> 
                   <% 
                }else if (Email.equals(Email) && Password.equals(Password)){
                    session.setAttribute("email",Email);
                    %>
                    <script>
                      Login();
                    </script> 
                   <% 
                }else{
                    session.setAttribute("email",Email);
                   %>
                   <script>
                      InvalidLogin();
                    </script>
                  <%
                }
            }
            catch(Exception e){
                out.print("Exception:"+e.getMessage());
            }
        %>
    </body>
</html>
    