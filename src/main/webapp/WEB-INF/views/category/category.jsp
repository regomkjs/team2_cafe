<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Category</title>
    <!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">


</style>
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