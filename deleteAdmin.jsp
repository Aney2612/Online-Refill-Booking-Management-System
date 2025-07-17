<!-- Delete Admin JSP PAGE (delete page)  -->


<%-- 
    Document   : deleteAdmin
    Created on : Apr 27, 2025, 10:51:13 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.*" %>


<%
    
String Adminid = request.getParameter("Admin_id");
if (Adminid != null){
    int Admin_id = Integer.parseInt(Adminid);
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try{
        String url = "jdbc:mysql://localhost:3306/refillmanagement";
        String username = "root";
        String password = "Aney@2612";
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn=DriverManager.getConnection(url, username, password); 
        pstmt = conn.prepareStatement("DELETE FROM adminlist WHERE Admin_id = ?");
        pstmt.setInt(1, Admin_id);
        
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