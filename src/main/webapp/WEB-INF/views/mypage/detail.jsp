<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style type="text/css">
        .row {
            margin: 0px auto;
            width:700px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <h1 class="text-center">내용보기</h1>
        <table class="table table-striped">
            <tr>
                <th width=20% class="text-center danger">번호</th>
                <td width=30% class="text-center">${vo.inquiries_idx }</td>
                <th width=20% class="text-center danger">작성일</th>
                <td width=30% class="text-center">
                    <fmt:formatDate value="${vo.inquiries_registration_date }" pattern="yyyy-MM-dd"/>
                </td>
            </tr>
            <tr>
                <th width=20% class="text-center danger">이름</th>
                <td width=30% class="text-center">${vo.members_name }</td>
            </tr>
            <tr>
                <th width=20% class="text-center danger">제목</th>
                <td colspan="3">${vo.inquiries_title }</td>
            </tr>
            <tr>
                <td colspan="4" class="text-left" valign="top" height="200">${vo.inquiries_content }</td>
            </tr>
            <tr>
                <td colspan="4" class="text-right">
                    <c:if test="${sessionScope.id!=null }">
                        <a href="../mypage/reply?idx=${vo.inquiries_idx }" class="btn btn-xs btn-danger">답변</a>
                        <a href="#" class="btn btn-xs btn-success">수정</a>
                        <a href="#" class="btn btn-xs btn-info">삭제</a>
                    </c:if>
                    <button class="custom-btn btn-5" onclick="history.back()" >목록</button>
                </td>
            </tr>
        </table>

        <div class="reply">
            <h5 class="reply_child">답변 (${reCount })</h5>


            <table class="reply_child">
                <c:forEach var="re" items="${replys }">
                    <tr>
                        <td>
                <pre class="reply_child">
                ${re.contents }
                </pre>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>


</body>
</html>
