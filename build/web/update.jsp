<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String id = request.getParameter("id");
    String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String connectionUrl = "jdbc:sqlserver://;databaseName=";
    String database = "ms_sql";
    String userid = "sa";
    String password = "root";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<%
try{
    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
    statement=connection.createStatement();
    String sql ="select * from users where id="+id;
    resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update data from database in jsp</h1>
    <form method="post" action="update-process.jsp">
        <table border="1">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
                    <td><input type="text" name="name" value="<%=resultSet.getString("name") %>"></td>
                    <td><input type="text" name="email" value="<%=resultSet.getString("email") %>"></td>
                    <td><input type="text" name="password" value="<%=resultSet.getString("password") %>"></td>
                </tr>
            </tbody>
        </table>
                <input type="submit" name="update" value="Update" />        
    </form>


<%
    }
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>