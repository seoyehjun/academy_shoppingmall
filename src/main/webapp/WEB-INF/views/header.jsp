<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

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

        <a href="${contextPath }/mypage/myCartList">🛒</a>

        <a href="/signUp">JOIN</a>

        <c:if test="${empty user && empty admin }">
            <a href="/login/login">LOGIN</a>
        </c:if>

        <c:if test="${not empty user }">
            <a href="${cpath }/mypage/myPageMain">마이페이지</a>
            <a href="/login/logout">LOGOUT</a>
        </c:if>

        <ul>
            <li>
                <c:if test="${not empty admin }">
                    <a href="${cpath }/admin/main">관리자</a>
                    <ul class="sub">
                        <li>
                            <a href="${cpath}/admin/members">회원관리</a>
                            <a href="${cpath}/admin/orders">상품현황</a>
                            <a href="${cpath}/admin/addProduct">상품추가</a>
                        </li>
                    </ul>
                    <a href="/login/logout">LOGOUT</a>
                </c:if>
            </li>
        </ul>

    </div>
</header>


