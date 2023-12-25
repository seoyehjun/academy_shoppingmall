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
    <h3 class="logo"><a href="http://localhost:8888">SooDaSam <br> SHOP</a></h3>
    <div class="menu">
        <ul>
            <li>
                <a href="${cpath}/menu/outer">아우터</a>
                <ul class="sub">
                    <c:forEach var="row" items="${outer }">
                        <li><a href="${cpath}/menu/outer/${row.categories_idx}">${row.categories_name}</a></li>
                    </c:forEach>
                </ul>
            </li>
            <li>
                <a href="${cpath}/menu/top">상의</a>
                <ul class="sub">
                    <c:forEach var="row" items="${top }">
                        <li><a href="${cpath}/menu/outer/${row.categories_idx}">${row.categories_name}</a></li>
                    </c:forEach>
                </ul>
            </li>
            <li>
                <a href="${cpath}/menu/bottom">하의</a>
                <ul class="sub">
                    <c:forEach var="row" items="${bottom }">
                        <li><a href="${cpath}/menu/outer/${row.categories_idx}">${row.categories_name}</a></li>
                    </c:forEach>
                </ul>
            </li>
            <li>
                <a href="${cpath}/menu/accessory">악세사리</a>
                <ul class="sub">
                    <c:forEach var="row" items="${accessory }">
                        <li><a href="${cpath}/menu/outer/${row.categories_idx}">${row.categories_name}</a></li>
                    </c:forEach>
                </ul>
            </li>
        </ul>
    </div>

    <div class="acc">

        <a href="${cpath }/mypage/myCartList">🛒</a>

        <a href="/signUp">JOIN</a>

        <c:if test="${empty user }">
            <a href="/login/login">LOGIN</a>
        </c:if>

        <c:if test="${not empty user }">
            <a href="${cpath }/mypage/myPageMain">마이페이지</a>
            <a href="/login/logout">LOGOUT</a>
        </c:if>


    </div>
</header>


