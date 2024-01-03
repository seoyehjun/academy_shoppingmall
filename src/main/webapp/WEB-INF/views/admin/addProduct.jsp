<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" href="${cpath}/resources/css/admin.css">

    <section>
        <form method="post" action="/admin/addProduct" enctype="multipart/form-data">
            <table id="container">
<%--                <tr>--%>
<%--                    <td id="result" colspan="2"></td>--%>
<%--                </tr>--%>

                <tr>
                    <th>카테고리</th>
                    <td><select name="categories_idx">
                        <c:forEach items="${category}" var="cate">
                            <option value="${cate.categories_idx}">${cate.categories_name}</option>
                        </c:forEach>
                    </select>
                    </td>

                </tr>

                <tr>
                    <th><label for="products_name">상품명</label></th>
                    <td><input type="text" name="products_name" id="products_name" placeholder="상품명 입력해주세요"></td>
                </tr>

                <tr>
                    <th><label for="products_price">가격</label></th>
                    <td><input type="number" name="products_price" id="products_price" placeholder="가격을 기입해주세요"></td>
                </tr>

                <tr>
                    <th><label for="products_stock">수량</label></th>
                    <td><input type="number" name="products_stock" id="products_stock"></td>
                </tr>


                <tr>
                    <th>사이즈</th>
                    <td>
                        <c:forEach items="${sizes}" var="size">
                        <input type="checkbox" name="sizes" value="${size.size_idx}">${size.size_product}
                    </c:forEach>
                    </td>

                </tr>

                <tr>
                    <th>색상</th>
                    <td>
                        <select name="colors" multiple = "multiple">
                        <c:forEach items="${colors}" var="colors">
                            <option value="${colors.color_idx}">${colors.color}</option>
                        </c:forEach>
                    </select>
                    </td>

                </tr>

                <tr>
                    <th><label for="files"> 이미지 파일</label></th>
                    <td>
                        <input type="file" multiple  name="files" id="files" accept="image/*"><br>
                        <output id="output"></output>
                    </td>


                </tr>

                <tr>
                    <th>
                        <input type="submit" id="submitButn" value="등록하기">
                    </th>
                </tr>
            </table>
        </form>

    </section>


<script>
    const input = document.getElementById('files');
    const output = document.getElementById('output');

    // 파일 선택 이벤트 리스너 추가
    document.getElementById('files').addEventListener('input', (event) => {
        const files = event.target.files;
        if (files.length > 0) {
            // 첫 번째 파일에 대한 FileReader 인스턴스 생성
            var fReader = new FileReader();

            // 파일 읽기
            fReader.readAsDataURL(files[0]);

        }

        // 파일 이름들을 세로로 출력 하기 위해 <br> 사용해야함
        output.innerHTML = Array.from(files).map(file => file.name + '<br>').join('');
    });
</script>


</body>
</html>