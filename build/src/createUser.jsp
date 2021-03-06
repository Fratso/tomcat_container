<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New user</title>
</head>
<body>
        <h1>New user form</h1>

        <form name="loginForm" method="POST" action="createUser.jsp">
                <label for="username">Username</label>
                <input type="text" name="username" size="20" required/>

                <label for="password">Password</label>
                <input type="password" name="password" size="20" required/>
        <input type="submit" value="Create"/>
        </form>       

        <%
                // retrieving all the parameters
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                if(username == null || password == null) {
                        out.println("Username or password not set");
                } else {
                        // starting the database connection
			String connectionURL = "jdbc:mysql://db:3306/AUTISSIER?serverTimezone=UTC";
                    Connection connection = null;
                    PreparedStatement pstatement = null;
                    int updateQuery = 0;

                    Class.forName("com.mysql.jdbc.Driver").newInstance();
		    connection = DriverManager.getConnection(connectionURL, "AUTISSIER", "justine123");

                    if(connection.isClosed()) {
                        out.println("Dtabase is unreachable");
                    } else {
                        out.println("Successfully connected to " + "MySQL server using TCP/IP...");
                    
                        // preparing the statement 
                        String query = "INSERT INTO user (user, password, date_created, is_admin) VALUES (AES_ENCRYPT(?, 'toto'), SHA2(?, 256), CURRENT_DATE(), 0);";

                    pstatement = connection.prepareStatement(query);
                    pstatement.setString(1, username);
                    pstatement.setString(2, password);

                    updateQuery = pstatement.executeUpdate();
                    if (updateQuery != 0) {
                        out.println("<p>User created! <a href='list.jsp'>User list</a>.");
                    }
                }
                }
        %>
</body>
</html>
