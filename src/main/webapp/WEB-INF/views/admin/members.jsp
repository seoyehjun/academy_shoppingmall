<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


    <section class="WebName">
        <img alt="" src="">
    </section>

    <section>
        <table>
                <tr>
                    <th>No</th>
                    <th>아이디</th>
                    <th>닉네임</th>
                    <th>이메일</th>
                    <th>가입일</th>
                </tr>
                <c:forEach var="row" items="${list }">
                    <tr>
                        <td>${row.members_idx }</td>
                        <td>${row.members_id }</td>
                        <td>${row.members_nickname }</td>
                        <td>${row.members_email }</td>
                        <td>
                            <fmt:formatDate value="${row.members_join_date}" pattern="yyyy-MM-dd" />
                        </td>
                        <td><button>배송 수정</button></td>
                    </tr>
                </c:forEach>
            </table>

    </section>
</body>
</html>