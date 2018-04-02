<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String pass=request.getParameter("password");

    try{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection conn = DriverManager.getConnection("jdbc:sqlserver://;databaseName=ms_sql", "sa", "root");
        Statement st=conn.createStatement();

        int i=st.executeUpdate("insert into users(name, email, password)values('"+name+"','"+email+"','"+pass+"')");
        //out.println("Data is successfully inserted!");
        response.sendRedirect("index.jsp");
    
    }catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
    }
%>