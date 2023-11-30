<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="cpath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>shoppingMall project</title>
    <link rel="stylesheet" href="${cpath}/resources/css/header.css">

</head>
<body>
<header>
    <h1><a href="http://localhost:8888">브랜드 명</a></h1>


    <c:if test="${empty user }">
        <a href="login">login</a>
    </c:if>

    <c:if test="${not empty user }">
        <li><a href="myPage">${user.members_nickname}</a></li>
        <li><a href="logout">logout</a></li>
    </c:if>

</header>



<hr>

</body>
</html>

