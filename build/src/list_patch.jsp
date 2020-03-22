<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
        <head>
                <title>list of users</title>
        </head>
        <body>
                <h1>List of users</h1>
                <a href="index.jsp">Home</a>

                <table>
                        <tr>
                          <th>User</th>
                          <th>Date of creation</th>
                        </tr>
                        <%
                        try {
			String connectionURL = "jdbc:mysql://db:3306/AUTISSIER?serverTimezone=UTC";
                            Connection connection = null;
                            Class.forName("com.mysql.jdbc.Driver").getDeclaredConstructor().newInstance();
			    connection = DriverManager.getConnection(connectionURL, "AUTISSIER", "justine123");
                            
                            if(connection.isClosed()) {
                                out.println("Database unreachable");
                            } else {
                                // out.println("Successfully connected to " + "MySQL server using TCP/IP...");  
                                String query = "SELECT * FROM user";

                                // create the java statement
                                Statement st = connection.createStatement();

                                // execute the query, and get a java resultset
                                ResultSet rs = st.executeQuery(query);

                                // iterate through the java resultset
                                while (rs.next())
                                {
                                  %>
                                        <c:set var="user" value="<%= rs.getString(\"user\") %>" />
                                        <c:set var="date_created" value="<%= rs.getString(\"date_created\") %>" />
                                
                                  <tr>
                                        <td><a href="userSafe.jsp?name=<c:out value="${user}"/>"><c:out value="${user}"/></a></td>
                                        <td><c:out value="${date_created}"/></td>
                                  </tr>
                                  <%
                                } 
                                st.close();
                            }
                            
                                connection.close();
                          
                        } catch(Exception ex){
                            out.println("Error occurred!");
                                out.println(ex);
                        }
                        %>
                </table> 
        </body>
</html>
