<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<link rel="stylesheet" href="${cpath}/resources/css/style.css">
<head>
    <script>
    window.onload=function()
    {
        selectBoxInit();//select태그 기본값 정하는 함수
    }

    function selectBoxInit()
    {

    var temp = '<c:out value='${memberInfo.members_phone_number}'/>';//바인딩된 정보 가져온다.
    var origin_selected_tel = '${memberInfo.members_phone_number.substring(0,3)}';
    var user_selected_tel = document.getElementById('tel1');
    var tel_list = user_selected_tel.options;
    var val;
    for(var i=0; i<tel_list.length;i++)
    {
        val = tel_list[i].value;
        if(origin_selected_tel == val)
        {
        tel_list[i].selected = true;
        break;
        }
    }
}
    </script>
</head>

<div class="container">

        <table class="product-container">
        <tr class="product-header">
            <th class="product-header-item">제품명</th>
            <th class="product-header-item">가격</th>
            <th class="product-header-item">색상</th>
            <th class="product-header-item">사이즈</th>
            <th class="product-header-item">갯수</th>
            <!-- 필요한 다른 제품 정보들의 헤더 추가 -->
        </tr>

        <c:forEach var="item" items="${CO_list}">
            <tr class="product-row">
                <td class="product-item">${item.products_name}</td>
                <td><c:set var="imagePath" value="/springboot/" />
                    <c:forEach items="${img}" var="img" begin="0" end="0">
                        <div>
                            <img class="thumbnails"
                                 src="${imagePath}${item.products_idx}/${img.img_url}"
                                 alt="Product Image"
                                 width="100px" height="150px"/>
                        </div>
                    </c:forEach></td>
                <td class="product-item">${item.products_price}</td>
                <td class="product-item">${item.color}</td>
                <td class="product-item">${item.size_product}</td>
                <td class="product-item">${item.quantity}</td>
                <!-- 필요한 다른 제품 정보들의 값 추가 -->
            </tr>
        </c:forEach>
        </table>

        <h2>배송 정보</h2>

        <div class="delivery-destination">
            <h3>배송지 선택</h3>
            <div>
                <label>
                    <input type="checkbox" id="same-as-member" name="delivery-option" checked>
                    회원 정보와 동일
                </label>
            </div>

            <div>
                <label>
                    <input type="checkbox" id="new-destination" name="delivery-option">
                    새로운 배송지
                </label>
            </div>
        </div>

        <div class="recipient-info">
            <h3>받으시는 분</h3>
            <div>
                <label for="recipient-name">이름</label>
                <input type="text" id="recipient-name" name="recipient-name" value="${memberInfo.members_name}">
            </div>
        </div>
        <div class="form-group">
            <h3>주소</h3>
            <div style="display: flex; align-items: center;">
                <input class="form-control" style="width: 40%;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly">
                <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
            </div>
            <div style="margin-top: 5px;">
                <input class="form-control" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
            </div>
            <div style="margin-top: 5px;">
                <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text" />
            </div>

            <div style="margin-top: 5px;">
                <input class="form-control" placeholder="참고항목" name="addr4" id="addr4" type="text" />
            </div>

            <div class="dot_line">
                <td class="fixed_join">전화번호</td>
                <td>
                    <select name="tel1" id="tel1" >
                        <option>없음</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                    </select>


                    <%--@기준으로 쪼개야 한다. --%>
                    <c:set var="origin_tel" value="${memberInfo.members_phone_number }"/>
                    <c:set var="refined_tel" value="${fn:split(origin_tel,'-') }"/>
                    -<input type="text" size=4 name="tel2" value="${refined_tel[1] }">
                    -<input type="text" size=4 name="tel3" value="${refined_tel[2] }">
                </td>
            </div>

            <div class="email-info">
                <h3>이메일</h3>
                <div>
                    <c:set var="origin_email" value="${memberInfo.members_email }"/>
                    <c:set var="refined_email" value="${fn:split(origin_email,'@') }"/>
                    <input type="text" id="email-id" name="email-id" placeholder="이메일을 입력하세요" value="${refined_email[0]}">
                    @
                    <select id="email-domain" name="email-domain">
                        <option value="naver.com">naver.com</option>
                        <!-- Add more options as needed -->
                    </select>
                </div>
            </div>

            <div class="delivery-message">
                <h3>배송메시지</h3>
                <div>
                    <textarea id="delivery-message" name="delivery-message" placeholder="배송 메시지를 입력하세요"></textarea>
                </div>
            </div>
        </div>



    </div>


</div>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execPostCode() {
        new daum.Postcode({
            oncomplete: function (data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("addr4").value = extraAddr;
                } else {
                    document.getElementById("addr4").value = '';
                }

                document.getElementById('addr1').value = data.zonecode;
                document.getElementById("addr2").value = addr;
                document.getElementById("addr3").focus();
            }
        }).open();
    }

</script>



</body>
</html>