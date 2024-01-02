<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" href="${cpath}/resources/css/admin.css">
    <section class="WebName">
        <img alt="" src="">
    </section>
<%-- 관리자 배송 수정 페이지--%>
    <section>
        <table>
                <tr>
                    <th>No</th>
                    <th>주문 번호</th>
                    <th>주문 날짜</th>
                    <th>주문자 ID</th>
                    <th>주문자 이름</th>
                    <th>상품 이름</th>
                    <th>상품 색상</th>
                    <th>상품 사이즈</th>
                    <th>상품 가격</th>
                    <th>배송 상태</th>
                </tr>
                <c:forEach var="row" items="${list }">
                    <tr>
                        <td>${row.ordersd_details }</td>
                        <td>${row.orders_idx }</td>
                        <td>
                            <fmt:formatDate value="${row.orders_date}" pattern="yyyy-MM-dd" />
                        </td>
                        <td>${row.members_id }</td>
                        <td>${row.members_name }</td>
                        <td>${row.products_name }</td>
                        <td>${row.color}</td>
                        <td>${row.size_product}</td>
                        <td>${row.products_price}</td>
                        <td>${row.orders_status}</td>

                        <td><a href="${cpath}/admin/updateOrders/${row.orders_idx}"><button>배송 수정</button></a></td>
                    </tr>
                </c:forEach>
            </table>

    </section>
</body>
</html>