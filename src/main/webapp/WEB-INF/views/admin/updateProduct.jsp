<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<html>
<head>
    <title>상품 수정 페이지</title>
</head>
<body>
<section>
    <form method="post" action="/admin/updateProduct/${productTable.products_idx}">
        <table id="container">
            <tr>
                <td id="result" colspan="2"></td>
            </tr>

            <tr>
                <th><label for="products_name">상품명</label></th>
                <td><input type="text" name="products_name" id="products_name"
                           required value="${productTable.products_name}"></td>
            </tr>
            <tr>
                <th><label for="products_price">가격</label></th>
                <td><input type="text" name="products_price" id="products_price"
                           required value="${productTable.products_price}"></td>
            </tr>

            <tr>
                <th><label for="products_stock">수량</label></th>
                <td><input type="number" name="products_stock" id="products_stock"
                    required value="${productTable.products_stock}"></td>
            </tr>



            <tr>
                <th>
                    <input type="submit" id="submitButn" value="수정하기">
                </th>
            </tr>
        </table>
    </form>

</section>


</body>
</html>


<%--                상품 카테고리 선택 필요 --%>

<%--                상품의 색상 필요 --%>

<%--                상품의 사이즈 선택 필요 --%>



<%--            <tr><--%>

<%--                <tr>--%>
<%--                    현재는 관리자 로그인을 통해서 들어가는게 아니라 작성 안해도 된다.    --%>
<%--                    <th><label for="admins_name">작성자</label></th>--%>
<%--                    <td><input type="text" name="admins_name" id="admins_name" value="${admin.admins_name}" readonly></td>--%>
<%--                </tr>--%>


<%--            이미지 파일 수정은 보류--%>

<%--            <tr>--%>
<%--                <th><label for="files"> 이미지 파일</label></th>--%>
<%--                <td>--%>
<%--                    <input type="file" multiple  name="files" id="files" accept="image/*"><br>--%>
<%--                    <output id="output"></output>--%>
<%--                </td>--%>
<%--            </tr>--%>