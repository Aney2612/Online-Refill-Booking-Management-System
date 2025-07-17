<!-- FAQ Reply JSP PAGE (main page)  -->


<%-- 
    Document   : FAQReply
    Created on : Apr 25, 2025, 12:29:20 AM
    Author     : Dell-R
--%>

<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="FAQReply.html" %>
<html>
    <head>
        <title>FAQ REPLY</title>
    </head>
    <body>
        <form>
        <fieldset>
        <h2>FAQ Reply</h2><hr>
        <table>
        <%
            String email = (String) session.getAttribute("email");

            if (email == null) {
                out.println("<tr><td colspan='2'>Please log in to view your FAQ replies.</td></tr>");
            } else {
                String url = "jdbc:mysql://localhost:3306/refillmanagement";
                String username = "root";
                String password = "Aney@2612";

                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, username, password);

                    // Step 1: Get User_id from email
                    String getUserIdSQL = "SELECT User_id FROM userdetails WHERE email = ?";
                    ps = conn.prepareStatement(getUserIdSQL);
                    ps.setString(1, email);
                    rs = ps.executeQuery();

                    int userId = -1;
                    if (rs.next()) {
                        userId = rs.getInt("User_id");
                    }

                    if (userId == -1) {
                        out.println("<tr><td colspan='2'>User not found.</td></tr>");
                    } else {
                        rs.close();
                        ps.close();

                        // Step 2: Join faq and faqreply on faq_ques and sub
                        String sql = "SELECT f.faq_ques, fr.faq_reply, fr.updated, fr.sub " +
                                     "FROM faq f JOIN faqreply fr ON f.faq_ques = fr.faq_ques AND f.sub = fr.sub " +
                                     "WHERE f.User_id = ?";

                        ps = conn.prepareStatement(sql);
                        ps.setInt(1, userId);
                        rs = ps.executeQuery();

                        boolean found = false;

                        while (rs.next()) {
                            found = true;
        %>
                            <tr>
                                <td><label><b>FAQ Question: </b></label></td>
                                <td><input type="text" value="<%= rs.getString("faq_ques") %>" disabled style="height: 25px;"></td>
                            </tr>
                            <tr>
                                <td><label><b>FAQ Reply: </b></label></td>
                                <td><input type="text" value="<%= rs.getString("faq_reply") %>" disabled style="height: 25px;"></td>
                            </tr>
                            <tr>
                                <td><label><b>Subject: </b></label></td>
                                <td><input type="text" value="<%= rs.getString("sub") %>" disabled style="height: 25px;"></td>
                            </tr>
                            <tr>
                                <td><label><b>Updated Date: </b></label></td>
                                <td><input type="date" value="<%= rs.getString("updated").split(" ")[0] %>" disabled style="height: 25px;"></td>
                            </tr>
        <%
                        }

                        if (!found) {
                            out.println("<tr><td colspan='2'>No FAQ replies found for your account.</td></tr>");
                        }
                    }

                } catch (Exception e) {
                    out.println("<tr><td colspan='2'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
                    try { if (ps != null) ps.close(); } catch (SQLException ignored) {}
                    try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
                }
            }
        %>

        </table> 
        </fieldset>
        </form>
    </body>
</html>