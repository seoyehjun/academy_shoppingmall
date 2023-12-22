<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <section class="WebName">
        <img alt="" src="">
    </section>

    <section>
        <table>
            <tr>
                <th>No</th>
                <th>상품명</th>
                <th>가격</th>
                <th>등록일</th>
                <th>재고</th>
                <th>카테고리</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="row" items="${list }">
                <tr>
                    <td>${row.products_idx }</td>
                    <td>${row.products_name }</td>
                    <td>${row.products_price }</td>
                    <td>
                        <fmt:formatDate value="${row.products_registration_date}" pattern="yyyy-MM-dd" />
                    </td>
                    <td>${row.products_stock }</td>
                    <td>${row.categories_name }</td>
                    <td><button>수정</button></td>
                    <td><button>삭제</button></td>
                </tr>
            </c:forEach>
        </table>

    </section>
</body>
</html>