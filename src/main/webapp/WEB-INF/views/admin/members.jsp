<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


    <section class="WebName">
        <img alt="" src="">
    </section>

    <section>
        <table>
                <tr>
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
                        <td>${row.members_idx }</td>
                        <td>
                            <fmt:formatDate value="${row.members_join_date}" pattern="yyyy-MM-dd" />
                        </td>
                        <td>${row.members_id }</td>
                        <td>${row.members_nickname }</td>
                        <td>${row.members_email }</td>
                        <td>${row.members_}</td>

                        <td><button>배송 수정</button></td>
                    </tr>
                </c:forEach>
            </table>

    </section>
</body>
</html>