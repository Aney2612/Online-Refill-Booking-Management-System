<!-- Insert and Update FAQ Reply JSP PAGE (Update Page) -->

<%-- 
    Document   : Admin_FaqReply
    Created on : Apr 24, 2025, 11:25:53 PM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="Admin_FaqReply.html" %>

<form method="post">
    <fieldset>
        <table>
            <tr>
                <th colspan="2"> <h2>FAQ Reply</h2> <hr></th>
            </tr>
            <tr>
                <th><label for="faq_ques">FAQ Question: </label></th>
                <td><textarea style="height:25px; width: 100%" name= "faq_ques"></textarea></td>
            </tr>
            <tr>
                <th><label for="faq_reply">FAQ Reply: </label></th>
                <td><textarea style="height:25px; width: 100%;" name= "faq_reply"></textarea></td>
            </tr>
            <tr>
                <th><label for="sub">Subject: </label></th>
                <td><input type="text" name="sub" id="sub" required style = "height:25px;"></td>
            </tr>
            <tr>
                <th><label for="updated">Update Date: </label></th>
                <td><input type="date" style = "height:25px;" name="updated" id="updated" required></td>
            </tr>
<%
    if("POST".equalsIgnoreCase(request.getMethod())){
        String faq_ques = request.getParameter("faq_ques");
        String faq_reply = request.getParameter("faq_reply");
        String sub = request.getParameter("sub");
        String updated = request.getParameter("updated");

        if (faq_ques != null && faq_reply != null && sub != null && updated != null){
            try{
                String url = "jdbc:mysql://localhost:3306/refillmanagement";
                String username = "root";
                String password = "Aney@2612";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection(url, username, password); 

                String query = "INSERT INTO faqreply (faq_ques, faq_reply, sub, updated) VALUES (?,?,?,?)";
                PreparedStatement stmt= conn.prepareStatement(query);
                stmt.setString(1, faq_ques);
                stmt.setString(2, faq_reply);
                stmt.setString(3, sub);
                stmt.setString(4, updated);

                int rows = stmt.executeUpdate();

                if(rows>0){
                    %>
                    <script>
                        alert("FAQ Reply updated Successfully");
                        window.location = "Admin_FaqReply.jsp";
                    </script>
                    <%
                }else{
                    %>
                <script>
                    alert("Failed to update. Try Again");
                    window.location = "Admin_FaqReply.jsp";
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
    <button type="submit" class="button">Update</button>
    </fieldset>
</form>
</body>
</html>
