<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>accountTable</title>
    <link rel="stylesheet" href="${cpath}/resources/css/login.css">
</head>
<body>
    <h1>테스트 Table</h1>
    <hr>

<section class="table">
    <table>
        <tr>
            <th>No</th>
            <th>아이디</th>
            <th>패스워드</th>
            <th>닉네임</th>
            <th>이메일</th>
            <th>가입일</th>
        </tr>
        <c:forEach var="row" items="${list }">
            <tr>
                <td>${row.members_idx }</td>
                <td>${row.members_id }</td>
                <td>${row.members_password}</td>
                <td>${row.members_nickname }</td>
                <td>${row.members_email }</td>
                <td>${row.members_join_date }</td>
            </tr>
        </c:forEach>
    </table>


</section>

</body>
</html>
