<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.cpath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<link href="${cpath }/resources/css/style.css" rel="stylesheet">

</head>
<body>


<header>

		<h1>Gaba works</h1>
		<br>
		<nav class="menu">
 		<ul>
			<li><a href="${cpath }/mypage/myPageMain">home</a></li>
			<li><a href="${cpath }/mypage/myDetailInfo">내정보 수정</a></li>
			<li><a href="${cpath }/mypage/myCartList">카트</a></li>
		</ul>
		
</nav>
<hr>
</header>