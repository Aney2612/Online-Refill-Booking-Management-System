<!-- REGISTRATION JSP PAGE-->


<%-- 
    Document   : regdatabase.jsp
    Created on : Feb 19, 2025, 4:03:40 PM
    Author     : Dell-R
--%>
<%@ page import="java.sql.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <h1><center>You are successfully Registered</center></h1>
        <%
            String User_id = request.getParameter("userid");
            String Name = request.getParameter("name");
            out.println("Name= "+Name +"<br>");
            String Phone = request.getParameter("phone");
            out.println("Phone Number= "+Phone +"<br>");
            String Address = request.getParameter("address");
            String District = request.getParameter("district");
            String State = request.getParameter("state");
            String Country = request.getParameter("country");
            String Pin_code = request.getParameter("pin");
            String Email = request.getParameter("email");
            out.println("Email ID= "+Email +"<br><br>");
            String Password = request.getParameter("psw");
            String Birth_date = request.getParameter("birth_date");
            String Join_date = request.getParameter("join_date");
            
            try{
                String url = "jdbc:mysql://localhost:3306/refillmanagement";
                String username = "root";
                String password = "Aney@2612";
                Connection conn = null; 
                Statement stmt = null; 
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn=DriverManager.getConnection(url, username, password);
                PreparedStatement ps = null;
                String query= "insert into userdetails(User_id,Name,Phone,Address,District,State,Country,Pin_code,Email,Password,Birth_date,Join_date) values(?,?,?,?,?,?,?,?,?,?,?,?)";
                ps = conn.prepareStatement(query);
                ps.setString(1,User_id);
                ps.setString(2,Name);
                ps.setString(3,Phone);
                ps.setString(4,Address);
                ps.setString(5,District);
                ps.setString(6,State);
                ps.setString(7,Country);
                ps.setString(8,Pin_code);
                ps.setString(9,Email);
                ps.setString(10,Password);
                ps.setString(11,Birth_date);
                ps.setString(12,Join_date);
                ps.executeUpdate();
              
                String site = new String("index.html");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site); 
                
                if(conn==null){
                    conn.close();
                }
            }
            catch(SQLException se){
                out.print("SQL:"+se.getMessage());
            }
            catch(Exception e){
                out.print("Exception:"+e.getMessage());
            }
        %>
    </body>
</html>
