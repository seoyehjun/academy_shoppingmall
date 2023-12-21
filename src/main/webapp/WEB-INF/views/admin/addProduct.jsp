<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
    <section class="WebName">
        <img alt="" src="">
    </section>

    <section>
        <form method="post">
            <table id="container">
                <tr>
                    <td id="result" colspan="2"></td>
                </tr>
                <tr>
                    <th><label for="products_name">상품명</label></th>
                    <td><input type="text" name="productname" id="productname" placeholder="상품명 입력해주세요"></td>
                </tr>
                <tr>
                    <th><label for="products_price">가격</label></th>
                    <td><input type="text" name="productprice" id="productprice" placeholder="가격을 기입해주세요"></td>
                </tr>
                <tr>
                    <th><label for="products_description">상품 정보</label></th>
                    <td><textarea name="productcontents" id="productcontents" cols="50" rows="20"></textarea></td>
                </tr>
                <tr>
                    <th><label for="admins_name">작성자</label></th>
                    <td><input type="text" name="useremail" id="useremail" value="${admin.admins_name}" readonly></td>
                </tr>
                <tr>
                    <th><label for="files"> 이미지 파일</label></th>
                    <td><input type="file" multiple  name="files" id="files">
                    <div class="select_img"></div></td>
                </tr>
                <tr>
                    <th colspan="2">
                        <input type="button" id="submitButn" value="등록하기">
                    </th>
                </tr>
            </table>
        </form>

    </section>
</body>
</html>