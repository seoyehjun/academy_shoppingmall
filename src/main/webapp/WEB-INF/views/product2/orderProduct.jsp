<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath}/resources/css/style.css">
    <body>

	<div class="container">
	
	<div class="product-container">
	
	  <div class="product-header">
		        <div class="product-header-item">제품명</div>
		        <div class="product-header-item">members_nickname</div>
		        <div class="product-header-item">수량</div>
		        <div class="product-header-item">가격</div>
		        <div class="product-header-item">색상</div>
		        <div class="product-header-item">사이즈</div>
                <div class="product-header-item">members_idx</div>
                <div class="product-header-item">products_idx</div>
	        <!-- 필요한 다른 제품 정보들의 헤더 추가 -->
	  </div>
  	 	 <div class="product-row">
         <div class="product-item">${product.products_name}</div>
         <div class="product-item">${members.members_nickname}</div>
         <div class="product-item">${quantity}</div>
         <div class="product-item">${Math.round(totalPrice)}원</div>

        <!-- 해당 위치에 color 표시 -->
        <div class="product-item">${color}</div>

        <!-- 해당 위치에 size_product 표시 -->
        <div class="product-item">${size_product}</div>
        <div class="product-item">${members.members_idx}</div>
        <div class="product-item">${products_idx}</div>

        <!-- 필요한 다른 제품 정보들의 값 추가 -->
    	</div>
    <h2>배송 정보</h2>

    <div class="delivery-destination">
        <h3>배송지 선택</h3>

        <label>
            <input type="radio" name="delivery-option" id="same-as-member" checked onclick="toggleDeliveryFields(this)">
            회원 정보와 동일
        </label>

        <label>
            <input type="radio" name="delivery-option" id="new-destination" onclick="toggleDeliveryFields(this)">
            새로운 배송지
        </label>
    </div>

    <!-- 이하 JavaScript 코드 추가 -->

    <div class="recipient-info">
        <h3>받으시는 분</h3>
        <div>
            <label for="recipient-name">이름</label>
            <input type="text" id="recipient-name" name="recipient-name">
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
    <div class="contact-info">
        <h3>휴대전화</h3>
        <div>
            <label for="phone-prefix">휴대전화</label>
            <select id="phone-prefix" name="phone-prefix">
                <option value="010">010</option>
                <option value="016">016</option>
                <!-- Add more options as needed -->
            </select>
            <input type="text" id="phone-number" name="phone-number" placeholder="휴대전화 번호를 입력하세요">
            <input type="text" id="phone-number2" name="phone-number2" placeholder="휴대전화 번호를 입력하세요">
        </div>
    </div>

    <div class="email-info">
        <h3>이메일</h3>
        <div>
            <input type="text" id="email-id" name="email-id" placeholder="이메일을 입력하세요">
            @
            <select id="email-domain" name="email-domain">
                <option value="naver.com">naver.com</option>
                <option value="daum.com">daum.com</option>
                <option value="example.com">example.com</option>
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
<input type="hidden" name="members_nickname" value="${members.members_nickname}">
<input type="hidden" name="members_idx" value="${members.members_idx}">
 <script>
     document.addEventListener('DOMContentLoaded', function () {
                        // 회원 정보와 동일한 값으로 초기화
                        toggleDeliveryFields(document.getElementById('same-as-member'));
                    });

         function toggleDeliveryFields(radio) {
             var recipientName = document.getElementById("recipient-name");
             var addr1 = document.getElementById("addr1");
             var addr2 = document.getElementById("addr2");
             var addr3 = document.getElementById("addr3");
             var addr4 = document.getElementById("addr4");
             var phonePrefix = document.getElementById("phone-prefix");
             var phoneNumber = document.getElementById("phone-number");
             var phoneNumber2 = document.getElementById("phone-number2");
             var emailId = document.getElementById("email-id");
             var emailDomain = document.getElementById("email-domain");

            if (radio.id === "same-as-member" && radio.checked) {
                    // "회원 정보와 동일"이 선택된 경우, 회원 정보로 필드를 채움
                    recipientName.value = "${members.members_name}";
                    addr1.value = "${members.members_address_number}"; // 주소를 원하는 형식으로 변경 필요
                    addr2.value = "${members.members_address}"; // 새로운 주소를 원하는 형식으로 변경 필요
                    addr3.value = "${members.members_detailed_address}"; // 새로운 주소를 원하는 형식으로 변경 필요
                    addr4.value = "${members.members_address_building}";
                    phonePrefix.value = "${members.members_phone_number.split('-')[0]}"; // 전화번호 형식에 맞게 변경 필요
                    phoneNumber.value = "${members.members_phone_number.split('-')[1]}"; // 전화번호 형식에 맞게 변경 필요
                    phoneNumber2.value = "${members.members_phone_number.split('-')[2]}"; // 전화번호 형식에 맞게 변경 필요
                    emailId.value = "${members.members_email.split('@')[0]}";
                    emailDomain.value = "${members.members_email.split('@')[1]}";
                } else if (radio.id === "new-destination" && radio.checked) {
                    // "새로운 배송지"가 선택된 경우, 필드를 초기화
                    recipientName.value = "";
                    addr1.value = "";
                    addr2.value = "";
                    addr3.value = "";
                    addr4.value = "";
                    phonePrefix.value = "";
                    phoneNumber.value = "";
                    phoneNumber2.value = "";
                    emailId.value = "";
                    emailDomain.value = "";
                }
            }
     </script>

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

		  <!-- jQuery -->
             <script
                     type="text/javascript"
                     src="https://code.jquery.com/jquery-1.12.4.min.js"
             ></script>
             <!-- iamport.payment.js -->
             <script
                     type="text/javascript"
                     src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"
             ></script>


        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


       <!-- jQuery -->
              <script>
                   var IMP = window.IMP;
                   IMP.init("imp62577181");

                   function requestPay() {
                       IMP.request_pay({
                           pg: "html5_inicis",
                           pay_method: "card",
                           merchant_uid: "1332132123",
                           name: "${product.products_name}",
                           amount: ${Math.round(totalPrice)},
                           buyer_email: "${members.members_email}",
                           buyer_name: "${members.members_name}",
                           buyer_tel: "${members.members_phone_number}",
                           buyer_addr: "${members.members_address}",
                           buyer_postcode: "${members.members_address_number}"
                       }, function (rsp) {
                           if (rsp.success) {
                               // 서버로 결제 정보 전송
                               sendOrderData(rsp);
                           } else {
                               alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
                           }
                       });
                   }


                   function sendOrderData(response) {
                       var form = document.getElementById("orderForm");
                       var formData = new FormData(form);

                       // 추가 데이터 전송
                       formData.append("pg_tid", response.pg_tid);
                       formData.append("imp_uid", response.imp_uid);
                       formData.append("merchant_uid", response.merchant_uid);
                       formData.append("members_nickname", "${members.members_nickname}");
                       formData.append("members_idx", "${members.members_idx}");
                       formData.append("addr1", document.getElementById("addr1").value);
                       formData.append("addr2", document.getElementById("addr2").value);
                       formData.append("addr3", document.getElementById("addr3").value);
                       formData.append("phone-number", document.getElementById("phone-prefix").value + "-" + document.getElementById("phone-number").value + "-" + document.getElementById("phone-number2").value);
                       formData.append("email", document.getElementById("email-id").value + "@" + document.getElementById("email-domain").value);
                       formData.append("delivery-message", document.getElementById("delivery-message").value);


                       // 총 가격을 숫자로 변환하여 추가
                       formData.append("total_Price", parseFloat("${Math.round(totalPrice)}"));


                       // AJAX를 사용하여 주문 정보 전송
                       $.ajax({
                           type: "POST",
                           url: "${cpath}/product2/addToDatabase",
                           data: formData,
                           processData: false,
                           contentType: false,
                           success: function (response) {
                               alert(response);
                           },
                           error: function (error) {
                               console.log(error); // 에러를 콘솔에 로깅
                               alert("데이터베이스에 주문 추가 중 오류 발생: " + error.statusText);
                           }
                       });
                   }
                   </script>


                 <form id="orderForm" action="${cpath}/product2/addToDatabase" method="post">
                     <input type="hidden" id="total_Price" name="total_Price" />
                 </form>

             </div>

             <button onclick="requestPay()">결제하기</button>
             <!-- 결제하기 버튼 생성 -->
             </body>
             </html>