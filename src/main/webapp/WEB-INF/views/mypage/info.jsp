<!--https://qh5944.tistory.com/111-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp" %>

<!DOCTYPE html>
<html>

<link rel="stylesheet" href="${cpath}/resources/css/mypage.css">

<head>
</head>

<body>

<div class="container">
    <div class="row">
        <br>
        <h3 class="text-center">Q & A</h3>
        <br>
            <table class="table">
                <tr>
                    <td class="text-left">
                        <a href="/mypage/insert" class="btn btn-sm btn-danger">새글</a>
                    </td>
                </tr>
            </table>

        <table class="table table-striped">
            <tr class="warning">
                <th class="text-center" width=10%>번호</th>
                <th class="text-center" width=45%>제목</th>
                <th class="text-center" width=15%>이름</th>
                <th class="text-center" width=20%>작성일</th>
            </tr>
            <c:forEach var="item" items="${Infolist }">
                <tr>
                    <td class="text-center btd" width=10%>${item.inquiries_idx}</td>
                    <td class="text-left btd" width=45%>
                        <a href="/mypage/detail?no=${item.inquiries_idx }">${item.inquiries_title }</a><!--개시글보기 링크-->
                    </td>
                    <td class="text-center btd" width=15%>${item.members_name }</td>
                    <td class="text-center btd" width=20%>
                        <fmt:formatDate value="${item.inquiries_registration_date }" pattern="yyyy-MM-dd"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <ul class="info_menu page">
            <c:if test="${p.prev }">
                <li class="paging"><a href="${cpath }/mypage/info/${p.begin - 1 }">이전</a></li>
            </c:if>

            <c:forEach var="i" begin="${p.begin }" end="${p.end }">
                <li class="paging"><a href="${cpath }/mypage/info/${i }">${i }</a></li>
            </c:forEach>

            <c:if test="${p.next }">
                <li class="paging"><a href="${cpath }/mypage/info/${p.end + 1 }">다음</a></li>
            </c:if>
        </ul>
    </div>

</div>
</body>
</html>