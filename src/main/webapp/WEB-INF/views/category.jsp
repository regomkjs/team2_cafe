<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Category</title>
</head>
<body>
    <h2>Categories:</h2>
    <form method="post" action="${pageContext.request.contextPath}/category">
        <input type="text" name="category">
        <input type="submit" name="action" value="Add">
        <input type="submit" name="action" value="Delete">
    </form>
</body>
</html>