<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
    <section class="WebName">
        <img alt="" src="">
    </section>

    <section>
        <form method="post" action="/admin/addProduct" enctype="multipart/form-datad">
            <table id="container">
                <tr>
                    <td id="result" colspan="2"></td>
                </tr>
<%--                상품 카테고리 선택 필요 --%>

<%--                상품의 색상 필요 --%>

<%--                상품의 사이즈 선택 필요 --%>
                <tr>
                    <th><label for="products_name">상품명</label></th>
                    <td><input type="text" name="products_name" id="products_name" placeholder="상품명 입력해주세요"></td>
                </tr>

                <tr>
                    <th><label for="products_price">가격</label></th>
                    <td><input type="text" name="products_price" id="products_price" placeholder="가격을 기입해주세요"></td>
                </tr>
                <tr>
                    <th><label for="products_description">상품 정보</label></th>
                    <td><textarea name="products_description" id="products_description" cols="50" rows="20"></textarea></td>
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