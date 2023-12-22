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
                <th>주문회원</th>
                <th>주문일자</th>
                <th>상품명</th>
                <th>배송상태</th>
                <th>주문량</th>
                <th></th>
            </tr>
            <c:forEach var="row" items="${list }">
                <tr>
                    <td>${row.orders_idx }</td>
                    <td>${row.members_id }</td>
                    <td>
                        <fmt:formatDate value="${row.orders_date}" pattern="yyyy-MM-dd" />
                    </td>
                    <td>${row.products_name }</td>
                    <td>${row.orders_status }</td>
                    <td>${row.quantity }개</td>
                    <td><button>수정</button></td>
                </tr>
            </c:forEach>
        </table>

    </section>
</body>
</html>