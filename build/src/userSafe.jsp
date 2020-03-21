 
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
      // create the java statement
       
      String sql = "SELECT * FROM user where user=?";
      PreparedStatement statement = connection.prepareStatement(sql); 
      statement.setString(1, request.getParameter("user"));
 
      // execute the query, and get a java resultset
      out.println(statement.toString());
      ResultSet rs = statement.executeQuery();
      
      // iterate through the java resultset
      while (rs.next())
      {
        //int id = rs.getInt("user");
        String user = rs.getString("user");
        //String password = rs.getString("password");
        Date dateCreated = rs.getDate("date_created");
        //boolean isAdmin = rs.getBoolean("is_admin");
        
        // print the results
        //System.out.format("%s, %s, %s, %s, %s, %s\n", id, firstName, lastName, dateCreated, isAdmin, numPoints);
        out.println( "<br>" + "<a href=\"\">" + user + "</a> " + dateCreated);
      }
      statement.close();
    
    
    connection.close();
}catch(Exception ex){
    out.println("Unable to connect to database.");
}
%>
