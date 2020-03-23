 
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html> 
<head> 
<title>Connection with mysql database</title>
</head> 
<body>
<h1>Connection status</h1>
<% 
try {
    String connectionURL = "jdbc:mysql://db:3306/AUTISSIER";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "AUTISSIER", "justine123");
    if(!connection.isClosed())
        out.println("Successfully connected to " + "MySQL server using TCP/IP...");
        Statement statement = connection.createStatement();
        String sql = "SELECT id, AES_DECRYPT(user, 'toto') AS user, password, date_created, is_admin FROM user where user=AES_ENCRYPT('"+ request.getParameter("user")+"', 'toto')";
        out.println(sql);
        //out.println(statement.toString());
                ResultSet rs = statement.executeQuery(sql);
      while (rs.next())
      {
        String user = rs.getString("user");
        //String password = rs.getString("password");
        Date dateCreated = rs.getDate("date_created");
        out.println( "<br>" + "<a href=\"userUnsafe.jsp?\">" + user + "</a> " + dateCreated);
      }
      statement.close();
    connection.close();
}catch(Exception ex){
    out.println("Unable to connect to database.");
    out.println(ex.toString());
}
%>
