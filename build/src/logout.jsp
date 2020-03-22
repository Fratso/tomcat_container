<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login out...</title>
</head>
<body>
        <h1>Login you out...</h1>
        <%
        session.invalidate();
        response.sendRedirect("login.jsp");
        %> 
</body>
</html>
