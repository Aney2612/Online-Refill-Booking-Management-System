<!-- Delete connection JSP PAGE (delete page)  -->


<%-- 
    Document   : deleteConn
    Created on : Apr 27, 2025, 8:19:27 PM
    Author     : Dell-R
--%>


<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.*" %>


<%
    
String Userid = request.getParameter("User_id");
if (Userid != null){
    int User_id = Integer.parseInt(Userid);
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try{
        String url = "jdbc:mysql://localhost:3306/refillmanagement";
        String username = "root";
        String password = "Aney@2612";
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn=DriverManager.getConnection(url, username, password); 
        pstmt = conn.prepareStatement("DELETE FROM newconnreq WHERE User_id = ?");
        pstmt.setInt(1, User_id);
        
        int rowsDel = pstmt.executeUpdate();
        if (rowsDel > 0) {
            %>
            <script>
                alert('Record Successfully deleted!');
                window.location.href = 'delete.html';
            </script>
            <%
        }
        else{
        %>
            <script>
                alert('No record  found to delete');
                window.location.href = 'delete.html';
            </script>
        <%
        }
    }catch(Exception e){
        out.println("Error: "+ e.getMessage());
    }finally {
        if (pstmt != null){
            pstmt.close();
        }
        if (conn != null){
            conn.close();
        }
    }
}
%>