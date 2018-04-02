<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.io.*" %> 
<%
    String id=request.getParameter("id");
    try
    {
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection conn = DriverManager.getConnection("jdbc:sqlserver://;databaseName=ms_sql", "sa", "root");
    Statement st=conn.createStatement();
    int i=st.executeUpdate("DELETE FROM users WHERE id="+id);
    //out.println("Data Deleted Successfully!");
    response.sendRedirect("index.jsp");
    }
    catch(Exception e)
    {
    System.out.print(e);
    e.printStackTrace();
    }
%>