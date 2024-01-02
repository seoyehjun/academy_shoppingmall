<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<html>
<head>
    <title>배송 수정 페이지</title>
    <link rel="stylesheet" href="${cpath}/resources/css/admin.css">
</head>
<body>
<section>
    <form method="post" action="/admin/updateOrders/${ordersTable.orders_idx}">
        <table id="container">

            <tr>
                <th>주문 번호</th>
                <td>${ordersTable.orders_idx}</td>
            </tr>

            <tr>
                <th>주문 날짜</th>
                <td><fmt:formatDate value="${ordersTable.orders_date}" pattern="yyyy-MM-dd" /></td>
            </tr>
            <tr>
                <th>주문자 ID</th>
                <td>${ordersTable.members_id }</td>
            </tr>
            <tr>
                <th>주문자 이름</th>
                <td>${ordersTable.members_name }</td>
            </tr>

            <tr>
                <th>상품 이름</th>
                <td>${ordersTable.products_name }</td>
            </tr>

            <tr>
                <th>상품 색상</th>
                <td>${ordersTable.color }</td>
            </tr>

            <tr>
                <th>상품 사이즈</th>
                <td>${ordersTable.size_product }</td>
            </tr>

            <tr>
                <th>상품 가격</th>
                <td>${ordersTable.products_price }</td>
            </tr>

            <tr>
                <label for="orders_status">주문 상태:</label>
                <select name="orders_status" id="orders_status">
                    <option value="배송 준비중" ${ordersTable.orders_status == '배송 준비중' ? 'selected' : ''}>배송 준비중</option>
                    <option value="배송중" ${ordersTable.orders_status == '배송중' ? 'selected' : ''}>배송중</option>
                    <option value="배송 완료" ${ordersTable.orders_status == '배송완료' ? 'selected' : ''}>배송완료</option>
                </select>
            </tr>
            <tr>
                <th>
                    <input type="submit" id="submitButn" value="수정 하기">
                </th>
            </tr>
        </table>
    </form>

</section>



</body>
</html>
